// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class SpecialCoffeeCard extends StatelessWidget {
  final List<String> specialImages;

  final List<String> coffeeName;

  final List<String> ingredients;

  final List<String> price;

  const SpecialCoffeeCard({
    Key? key,
    required this.specialImages,
    required this.coffeeName,
    required this.ingredients,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: specialImages.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                height: 140,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(color: const Color(0xff141921), borderRadius: BorderRadius.circular(20)),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 120,
                      width: 150,
                      decoration: BoxDecoration(color: Colors.blue, image: DecorationImage(image: AssetImage(specialImages[index]), fit: BoxFit.cover), borderRadius: BorderRadius.circular(20)),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          coffeeName[index],
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Text(
                          ingredients[index],
                          style: const TextStyle(color: Color(0xff919293), fontSize: 12),
                        ),
                        const SizedBox(
                          height: 8,
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
                                  price[index],
                                  style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            const SizedBox(
                              width: 80,
                            ),
                            Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(color: const Color(0xffd17842), borderRadius: BorderRadius.circular(10)),
                                child: const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 20,
                                ))
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          );
        });
  }
}
