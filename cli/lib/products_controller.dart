import 'dart:io';

import 'package:cli/consts.dart';
import 'package:dio/dio.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class ProductsController {
  final Dio dio;
  ProductsController({
    required this.dio,
  });

  Future<bool?> getAll() async {
    final vendusKey = Consts.vendusKey;
    final Map<int, dynamic> products = {};
    final urlCategory = '${Consts.urlVendus}/products/?api_key=$vendusKey&per_page=400';

    final response = await dio.get(urlCategory);
    if (response.statusCode != 200) {
      return null;
    }
    for (var item in response.data as List) {
      products[item['id']] = item;
    }

    final keys = products.keys.toList();

    // final QueryBuilder query = QueryBuilder<Owner>(Owner());

    QueryBuilder<ParseObject> query = QueryBuilder<ParseObject>(ParseObject('Product'));

    query.setLimit(10000000);
    // final productsBuild = await query.query();

    // if (productsBuild.success) {
    //   for (var prod in productsBuild.results as List<ParseObject>) {
    //     // await prod.delete();
    //   }
    // }

    var productsParse = <ParseObject>[];
    var apiResponse = await query.query();
    if (apiResponse.success) {
      productsParse = apiResponse.results as List<ParseObject>;
      if (apiResponse.count == 0) {
        for (var key in keys) {
          await insertProduct(products, key);
        }
      } else {
        final List<int> keysProducts = [];
        for (ParseObject productObject in apiResponse.result) {
          keysProducts.add(productObject.get('product_id'));
        }
        final toIsert = [...keys];
        // print(keysProducts);
        // // print(toIsert);
        // print(toIsert.length);
        // print(keysProducts.length);
        // // print(keysProducts);
        final elContain = toIsert.where((element) => keysProducts.contains(element));
        final elNotContain = toIsert.where((element) => !keysProducts.contains(element));
        if (elNotContain.isNotEmpty) {
          for (var key in elNotContain) {
            await insertProduct(products, key);
          }
        }

        if (elContain.isNotEmpty) {
          for (var key in elContain) {
            try {
              var prods = productsParse.where((element) => element.get('product_id') == key).first;

              await updateProduct(prods, products[key]);
            } catch (e) {
              print(e);
            }

            //  await updateProduct(products[key], key);
          }
        }
        // keys.removeWhere((element) => toIsert.contains(element));
      }
    }

    return true;
  }

  Future<void> updateProduct(ParseObject product, productUpdate) async {
    if (num.parse(product.get<num>('price').toString()) != num.parse(productUpdate['gross_price'].toString())) {
      product.set('price', double.parse(productUpdate['gross_price'].toString()));
      await product.save();
      print("Produto  ${product.get('title_pt').toString()} atualizado ");
    }
  }

  Future<void> insertProduct(Map<int, dynamic> products, int key) async {
    final arrProduct = (products[key]);
    File? fileImage;
    if (arrProduct['images'] is! List) {
      fileImage = File('${arrProduct['id']}.png');
      // print(Uri.parse(arrProduct['images']['m']));
      final imgResponse = await dio.get(arrProduct['images']['m'], options: Options(responseType: ResponseType.bytes));
      final raf = fileImage.openSync(mode: FileMode.write);
      raf.writeFromSync(imgResponse.data);
      raf.close();
      // fileImage = File.fromUri(Uri.parse(arrProduct['images']['m']));
      // print(arrProduct['images']);
    }
    final product = ParseObject('Product');
    product.set('product_id', arrProduct['id']);
    product.set('title_pt', arrProduct['title']);
    product.set('title_es', arrProduct['title']);
    product.set('title_en', arrProduct['title']);

    product.set('description_pt', arrProduct['description']);
    product.set('description_es', arrProduct['description']);
    product.set('description_en', arrProduct['description']);
    product.set('price', double.parse(arrProduct['gross_price']));
    product.set('category_id', arrProduct['category_id']);
    product.set('order', arrProduct['order']);
    product.set('status', (arrProduct['status'] == 'on') ? true : false);
    if (fileImage != null) {
      product.set('image_thumb', ParseFile(fileImage, debug: true, name: 'image_thumb_${arrProduct['id']}'));
      product.set('image_description', ParseFile(fileImage, debug: true, name: 'image_description_${arrProduct['id']}'));
    }
    await product.save();
    if (fileImage != null) {
      fileImage.deleteSync();
    }
  }
}
