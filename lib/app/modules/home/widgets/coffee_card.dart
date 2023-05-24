import 'package:flutter/material.dart';
import 'package:howabout_coffee/app/core/global/translation/app_translation.dart';
import 'package:howabout_coffee/app/data/models/product_model.dart';

class CoffeeCard extends StatelessWidget {
  final ProductModel product;
  final AppTranslation translation;

  const CoffeeCard({super.key, required this.product, required this.translation});
  @override
  Widget build(BuildContext context) {
    String title = '';
    switch (translation.currentLocale) {
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
    return Container(
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
                        const Text(
                          r'$ ',
                          style: TextStyle(color: Color(0xffd17842), fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Text(
                          "${product.price}",
                          style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          )
        ],
      ),
    );

    //
  }
}
