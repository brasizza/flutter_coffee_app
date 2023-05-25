// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'package:howabout_coffee/app/core/extensions/size_extensions.dart';
import 'package:howabout_coffee/app/core/ui/styles/color_app.dart';
import 'package:howabout_coffee/app/data/models/product_model.dart';

import '../../../core/company/company_controller.dart';
import '../../../core/global/translation/app_translation.dart';

class CoffeeDetailsPage extends StatelessWidget {
  const CoffeeDetailsPage({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final CompanyController companyController = context.read();

    String title = '';
    String description = '';
    switch (AppTranslation.currentLocale) {
      case 'pt':
        title = product.titlePT;
        description = product.descriptionPT;
        break;

      case 'es':
        title = product.titleES;
        description = product.descriptionES;
        break;

      case 'en':
        title = product.titleEN;
        description = product.descriptionEN;
        break;
    }

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            fit: StackFit.passthrough,
            children: [
              Container(
                height: 440,
                width: context.screenWidth,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), image: DecorationImage(image: ((product.imageBig == null) ? const AssetImage('assets/images/logo_coffee.png') : NetworkImage(product.imageBig!)) as ImageProvider, fit: BoxFit.cover)),
              ),
              Positioned(
                top: 320,
                child: BlurryContainer(
                  padding: const EdgeInsets.all(20),
                  color: const Color(0xff141921),
                  width: 300,
                  height: 130,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          title,
                          maxLines: 2,
                          overflow: TextOverflow.clip,
                          style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        child: SizedBox(
                          height: 50,
                          child: SpinBox(
                            readOnly: true,
                            incrementIcon: Icon(
                              Icons.add,
                              color: ColorsApp.instance.primary,
                            ),
                            decrementIcon: Icon(
                              Icons.remove,
                              color: ColorsApp.instance.primary,
                            ),
                            textStyle: TextStyle(color: ColorsApp.instance.primary),
                            decoration: const InputDecoration(
                              fillColor: Color(0xff141921),
                              border: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                            ),
                            min: 1,
                            max: 100,
                            value: 1,
                            onChanged: (value) => print(value),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                right: 10,
                top: 10,
                child: IconButton(
                  icon: const Icon(
                    Icons.expand_more_rounded,
                    size: 40,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  color: ColorsApp.instance.white,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Description",
                  style: TextStyle(color: ColorsApp.instance.white, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  description,
                  style: TextStyle(color: ColorsApp.instance.white, fontSize: 15),
                ),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 30, left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Price",
                      style: TextStyle(color: ColorsApp.instance.white, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                          child: Text(
                            companyController.company?.moneySymbol ?? r'$',
                            style: TextStyle(color: ColorsApp.instance.primary, fontSize: 21),
                          ),
                        ),
                        Text(
                          product.price.toString(),
                          style: const TextStyle(color: Colors.white, fontSize: 21),
                        )
                      ],
                    )
                  ],
                ),

                // ignore: deprecated_member_use
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      backgroundColor: ColorsApp.instance.primary),
                  // shape: RoundedRectangleBorder(
                  //     borderRadius: BorderRadius.circular(20)),
                  onPressed: () {},
                  child: Text(
                    "Buy Now",
                    style: TextStyle(
                      color: ColorsApp.instance.fontColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
