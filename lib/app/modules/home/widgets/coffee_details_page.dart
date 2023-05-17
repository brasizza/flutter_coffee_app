import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CoffeeDetailsPage extends StatelessWidget {
  const CoffeeDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 440,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), image: const DecorationImage(image: AssetImage("assets/images/tyler-nix-nwdtkFzDfPY-unsplash.jpg"), fit: BoxFit.cover)),
                  ),
                  Positioned(
                    right: 10,
                    top: 10,
                    child: GestureDetector(
                      onTap: () {},
                      child: const Icon(
                        Icons.expand_more_rounded,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 320,
                    child: BlurryContainer(
                      padding: const EdgeInsets.all(20),
                      height: 140,
                      color: const Color(0xff141921),
                      width: 377,
                      borderRadius: const BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30), bottomLeft: Radius.circular(25)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Cappuccino",
                                style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                "With Oat Milk",
                                style: TextStyle(
                                  color: Color(0xff919296),
                                  fontSize: 12,
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    "assets/images/star.svg",
                                    height: 20,
                                    colorFilter: const ColorFilter.mode(Colors.orange, BlendMode.srcIn),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Text(
                                    "4.5",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  const Text(
                                    "(6.983)",
                                    style: TextStyle(color: Color(0xff919296)),
                                  )
                                ],
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 42,
                                    width: 42,
                                    decoration: BoxDecoration(color: const Color(0xff101419), borderRadius: BorderRadius.circular(8)),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                          "assets/images/coffee-beans.svg",
                                          colorFilter: const ColorFilter.mode(Colors.orange, BlendMode.srcIn),
                                          height: 15,
                                        ),
                                        const SizedBox(
                                          height: 4,
                                        ),
                                        const Text(
                                          "Coffee",
                                          style: TextStyle(color: Color(0xff919296), fontSize: 10, fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Container(
                                    height: 42,
                                    width: 42,
                                    decoration: BoxDecoration(color: const Color(0xff101419), borderRadius: BorderRadius.circular(8)),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                          "assets/images/water-drop.svg",
                                          colorFilter: const ColorFilter.mode(Colors.orange, BlendMode.srcIn),
                                          height: 15,
                                        ),
                                        const SizedBox(
                                          height: 4,
                                        ),
                                        const Text(
                                          "Milk",
                                          style: TextStyle(color: Color(0xff919296), fontSize: 10, fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 37,
                                width: 120,
                                decoration: BoxDecoration(color: const Color(0xff101419), borderRadius: BorderRadius.circular(8)),
                                child: const Center(
                                    child: Text(
                                  "Medium Roasted",
                                  style: TextStyle(color: Color(0xff919296), fontSize: 12, fontWeight: FontWeight.bold),
                                )),
                              ),
                            ],
                          )
                        ],
                      ),
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
                    const Text(
                      "Description",
                      style: TextStyle(color: Color(0xff919296), fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      "A cappuccino is a coffee-based drink made primarily from espresso and milk.",
                      style: TextStyle(color: Color(0xff919296), fontSize: 15),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      "Size",
                      style: TextStyle(color: Color(0xff919296), fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Container(
                          height: 37,
                          width: 110,
                          decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(10), border: Border.all(color: const Color(0xffd17842))),
                          child: const Center(
                              child: Text(
                            "S",
                            style: TextStyle(
                              color: Color(0xff919296),
                              fontSize: 18,
                            ),
                          )),
                        ),
                        const SizedBox(
                          width: 11,
                        ),
                        Container(
                          height: 37,
                          width: 110,
                          decoration: BoxDecoration(color: const Color(0xff101419), borderRadius: BorderRadius.circular(8)),
                          child: const Center(
                              child: Text(
                            "M",
                            style: TextStyle(
                              color: Color(0xff919296),
                              fontSize: 18,
                            ),
                          )),
                        ),
                        const SizedBox(
                          width: 11,
                        ),
                        Container(
                          height: 37,
                          width: 110,
                          decoration: BoxDecoration(color: const Color(0xff101419), borderRadius: BorderRadius.circular(8)),
                          child: const Center(
                              child: Text(
                            "L",
                            style: TextStyle(
                              color: Color(0xff919296),
                              fontSize: 18,
                            ),
                          )),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 27,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Price",
                              style: TextStyle(color: Color(0xff919296), fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text(
                                  r'$',
                                  style: TextStyle(color: Color(0xffd17842), fontSize: 21),
                                ),
                                Text(
                                  " 4.20",
                                  style: TextStyle(color: Colors.white, fontSize: 21),
                                )
                              ],
                            )
                          ],
                        ),
                        // ignore: deprecated_member_use
                        ButtonTheme(
                          minWidth: 200,
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                backgroundColor: const Color(0xffd17842)),
                            // shape: RoundedRectangleBorder(
                            //     borderRadius: BorderRadius.circular(20)),
                            onPressed: () {},
                            child: const Text(
                              "Buy Now",
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
