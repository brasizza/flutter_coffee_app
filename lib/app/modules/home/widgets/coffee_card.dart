import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:howabout_coffee/app/core/extensions/size_extensions.dart';
import 'package:howabout_coffee/app/data/models/product_model.dart';
import 'package:howabout_coffee/app/modules/home/widgets/coffee_details_page.dart';

class CoffeeCard extends StatelessWidget {
  final List<ProductModel> products;

  const CoffeeCard({super.key, this.products = const []});
  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();
    return SizedBox(
        height: context.screenHeight - 200,
        child: InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const CoffeeDetailsPage()));
          },
          child: Padding(
            padding: const EdgeInsets.only(bottom: 250),
            child: GridView.custom(
              controller: scrollController,
              gridDelegate: SliverWovenGridDelegate.count(
                crossAxisCount: 2,
                mainAxisSpacing: 0,
                crossAxisSpacing: 0,
                pattern: [
                  const WovenGridTile(1),
                  const WovenGridTile(
                    5 / 7,
                    alignment: AlignmentDirectional.center,
                  ),
                ],
              ),
              childrenDelegate: SliverChildBuilderDelegate(
                childCount: products.length,
                (context, index) {
                  final product = products[index];
                  return Row(children: [
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
                                    child: Flexible(
                                      child: Text(
                                        product.title,
                                        style: const TextStyle(color: Colors.white),
                                      ),
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
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ]);
                },
              ),
            ),
          ),
        )

        //  GridView.builder(
        //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        //     controller: scrollController,
        //     shrinkWrap: true,
        //     scrollDirection: Axis.vertical,
        //     itemCount: products.length,
        //     itemBuilder: (context, index) {
        //       final ProductModel product = products[index];
        //       return Row(
        //         children: [
        //           Container(
        //             height: 250,
        //             width: 160,
        //             decoration: BoxDecoration(color: const Color(0xff242931), borderRadius: BorderRadius.circular(20)),
        //             child: Column(
        //               children: [
        //                 const SizedBox(
        //                   height: 10,
        //                 ),
        //                 Container(
        //                   height: 100,
        //                   width: 100,
        //                   decoration: BoxDecoration(
        //                     borderRadius: BorderRadius.circular(20),
        //                     image: DecorationImage(
        //                       image: ((product.image == null) ? const AssetImage('assets/images/logo_coffee.png') : NetworkImage(product.image!)) as ImageProvider,
        //                       fit: BoxFit.cover,
        //                       scale: 2,
        //                     ),
        //                   ),
        //                 ),
        //                 Padding(
        //                   padding: const EdgeInsets.only(left: 8, right: 8, top: 4),
        //                   child: Expanded(
        //                     child: Column(
        //                       crossAxisAlignment: CrossAxisAlignment.start,
        //                       children: [
        //                         Padding(
        //                           padding: const EdgeInsets.symmetric(vertical: 10),
        //                           child: Center(
        //                             child: Flexible(
        //                               child: Text(
        //                                 product.title,
        //                                 style: const TextStyle(color: Colors.white),
        //                               ),
        //                             ),
        //                           ),
        //                         ),
        //                         Row(
        //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                           children: [
        //                             Row(
        //                               children: [
        //                                 const Text(
        //                                   r'$ ',
        //                                   style: TextStyle(color: Color(0xffd17842), fontWeight: FontWeight.bold, fontSize: 20),
        //                                 ),
        //                                 Text(
        //                                   "${product.price}",
        //                                   style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        //                                 )
        //                               ],
        //                             ),
        //                             Container(
        //                                 height: 30,
        //                                 width: 30,
        //                                 decoration: BoxDecoration(color: const Color(0xffd17842), borderRadius: BorderRadius.circular(10)),
        //                                 child: const Icon(
        //                                   Icons.add,
        //                                   color: Colors.white,
        //                                   size: 20,
        //                                 ))
        //                           ],
        //                         )
        //                       ],
        //                     ),
        //                   ),
        //                 )
        //               ],
        //             ),
        //           ),
        //           const SizedBox(
        //             width: 20,
        //           ),
        //         ],
        //       );
        //     }),

        );
  }
}
