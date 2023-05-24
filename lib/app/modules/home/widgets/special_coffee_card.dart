// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:howabout_coffee/app/core/extensions/size_extensions.dart';

// import '../../../data/models/product_model.dart';

// class SpecialCoffeeCard extends StatelessWidget {
//   final List<ProductModel> products;
//   const SpecialCoffeeCard({Key? key, required this.products}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//         itemCount: products.length,
//         itemBuilder: (context, index) {
//           final product = products[index];
//           return Column(
//             children: [
//               Container(
//                 height: 140,
//                 width: context.screenWidth,
//                 decoration: BoxDecoration(color: const Color(0xff141921), borderRadius: BorderRadius.circular(20)),
//                 child: Row(
//                   children: [
//                     const SizedBox(
//                       width: 10,
//                     ),
//                     Container(
//                       height: 120,
//                       width: 150,
//                       decoration: BoxDecoration(color: Colors.blue, image: DecorationImage(image: CachedNetworkImageProvider(product.image ?? ' '), fit: BoxFit.cover), borderRadius: BorderRadius.circular(20)),
//                     ),
//                     const SizedBox(
//                       width: 15,
//                     ),
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'AAA',
//                           // product.title,
//                           style: const TextStyle(
//                             fontSize: 16,
//                             color: Colors.white,
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 6,
//                         ),
//                         // Text(
//                         //   ingredients[index],
//                         //   style: const TextStyle(color: Color(0xff919293), fontSize: 12),
//                         // ),
//                         const SizedBox(
//                           height: 8,
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
//                                   product.price.toString(),
//                                   style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
//                                 )
//                               ],
//                             ),
//                             const SizedBox(
//                               width: 80,
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
//                         ),
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//               const SizedBox(
//                 height: 15,
//               ),
//             ],
//           );
//         });
//   }
// }
