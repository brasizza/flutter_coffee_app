// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'package:howabout_coffee/app/core/extensions/translate.dart';
import 'package:howabout_coffee/app/core/ui/styles/color_app.dart';
import 'package:howabout_coffee/app/data/models/product_model.dart';
import 'package:howabout_coffee/app/modules/checkout/checkout_controller.dart';

import '../../../core/company/company_controller.dart';
import '../../../core/global/translation/app_translation.dart';

class CoffeeDetailsPage extends StatefulWidget {
  final ProductModel product;
  final CheckoutController? checkoutController;

  const CoffeeDetailsPage({
    Key? key,
    required this.product,
    this.checkoutController,
  }) : super(key: key);

  @override
  State<CoffeeDetailsPage> createState() => _CoffeeDetailsPageState();
}

class _CoffeeDetailsPageState extends State<CoffeeDetailsPage> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    final CompanyController companyController = context.read();

    String title = '';
    String description = '';
    switch (AppTranslation.currentLocale) {
      case 'pt':
        title = widget.product.titlePT;
        description = widget.product.descriptionPT;
        break;

      case 'es':
        title = widget.product.titleES;
        description = widget.product.descriptionES;
        break;

      case 'en':
        title = widget.product.titleEN;
        description = widget.product.descriptionEN;
        break;
    }

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            fit: StackFit.passthrough,
            children: [
              CachedNetworkImage(
                imageUrl: widget.product.imageBig ?? '',
                imageBuilder: (context, imageProvider) => Container(
                  height: 440,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                placeholder: (context, url) => SizedBox(
                    height: 440,
                    child: Image.asset(
                      color: ColorsApp.instance.primary,
                      'assets/images/logo_coffee.png',
                      colorBlendMode: BlendMode.colorBurn,
                      fit: BoxFit.cover,
                    )),
                errorWidget: (context, url, error) => SizedBox(
                    height: 440,
                    child: Image.asset(
                      'assets/images/logo_coffee.png',
                      fit: BoxFit.cover,
                    )),
              ),
              // Container(
              //   height: 440,
              //   width: context.screenWidth,
              //   decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), image: DecorationImage(image: ((widget.product.imageBig == null) ? const AssetImage('assets/images/logo_coffee.png') : CachedNetworkImageProvider(widget.product.imageBig!)) as ImageProvider, fit: BoxFit.cover)),
              // ),
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
                              onChanged: (value) {
                                setState(() {
                                  quantity = value.toInt();
                                });
                              }),
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
                  "detail_coffee.description".translate,
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
                      "detail_coffee.price".translate,
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
                          (widget.product.price * quantity).toStringAsFixed(2),
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
                  onPressed: () async {
                    final nav = Navigator.of(context);
                    await widget.checkoutController?.addItem(widget.product, quantity);
                    nav.pop();
                  },
                  child: Text(
                    "detail_coffee.add".translate,
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
