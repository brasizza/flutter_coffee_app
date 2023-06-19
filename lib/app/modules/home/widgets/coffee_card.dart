import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:howabout_coffee/app/core/company/company_controller.dart';
import 'package:howabout_coffee/app/core/global/translation/app_translation.dart';
import 'package:howabout_coffee/app/core/ui/styles/color_app.dart';
import 'package:howabout_coffee/app/data/models/product_model.dart';
import 'package:howabout_coffee/app/data/services/user/user_service.dart';
import 'package:howabout_coffee/app/modules/checkout/checkout_controller.dart';
import 'package:howabout_coffee/app/modules/home/widgets/coffee_details_page.dart';
import 'package:howabout_coffee/app/modules/products/products_controller.dart';

class CoffeeCard extends StatelessWidget {
  final ProductModel product;
  final CompanyController companyController;
  final CheckoutController checkoutController;
  final ProductsController productController;
  final bool favorite;
  const CoffeeCard({super.key, required this.product, this.favorite = false, required this.companyController, required this.checkoutController, required this.productController});
  @override
  Widget build(BuildContext context) {
    String title = '';
    switch (AppTranslation.currentLocale) {
      case 'pt':
        title = product.titlePT;
        break;
      case 'es':
        title = product.titleES;
        break;
      case 'en':
        title = product.titleEN;
        break;
    }
    return GestureDetector(
      onLongPress: () => checkoutController.addItem(product, 1),
      onDoubleTap: () => productController.changeFavoriteProduct(productId: product.id, client: context.read<UserService>().currentUser),
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => CoffeeDetailsPage(
                    product: product,
                    checkoutController: checkoutController,
                  ))),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            height: 250,
            width: 160,
            decoration: BoxDecoration(color: const Color(0xff242931), borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: ((product.image == null) ? const AssetImage('assets/images/logo_coffee.png') : NetworkImage(product.image!)) as ImageProvider,
                      fit: BoxFit.cover,
                      scale: 2,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8, top: 4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Center(
                          child: Text(
                            title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                                child: Text(
                                  companyController.company?.moneySymbol ?? r'$',
                                  style: TextStyle(color: ColorsApp.instance.primary, fontWeight: FontWeight.bold, fontSize: 18),
                                ),
                              ),
                              Text(
                                product.price.toStringAsFixed(2),
                                style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Positioned(
            bottom: 10,
            right: 10,
            child: Icon(
              (favorite) ? Icons.favorite : Icons.favorite_border,
              color: (favorite) ? Colors.red : ColorsApp.instance.fontColor,
            ),
          ),
        ],
      ),
    );

    //
  }
}
