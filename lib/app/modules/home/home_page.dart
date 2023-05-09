import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/bindings/extensions/circle_indicator.dart';
import 'home_controller.dart';
import 'widgets/coffee_card.dart';
import 'widgets/special_coffee_card.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.all(20),
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 620,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Color(0xff1b2027),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(
                          Icons.menu,
                          color: Color(0xff4d4f52),
                        )),
                    Icon(
                      Icons.person,
                      weight: 50,
                      color: Colors.white,
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Find the best\ncoffee for you",
                  style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 6.0),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Color(0xff141921),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "Find your coffee...",
                        hintStyle: TextStyle(color: Color(0xff3c4046)),
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.grey[600],
                        )),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TabBar(isScrollable: true, controller: controller.tabController, labelColor: Color(0xffd17842), labelStyle: TextStyle(fontWeight: FontWeight.bold), unselectedLabelColor: Color(0xff3c4046), indicator: CircleTabIndicator(color: Color(0xffd17842), radius: 4), tabs: [
                  Tab(
                    text: "Cappuccino",
                  ),
                  Tab(
                    text: "Americano",
                  ),
                  Tab(
                    text: "Espresso",
                  ),
                  Tab(
                    text: "Mocha",
                  ),
                  Tab(
                    text: "Macchiato",
                  ),
                  Tab(
                    text: "Doppio",
                  ),
                ]),
                CoffeeCard(),
                Text(
                  "Special for you",
                  style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          SpecialCoffeeCard(),
        ],
      )),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Color(0xffd17842),
        unselectedItemColor: Color(0xff4d4f52),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ""),
        ],
        currentIndex: 0,
        onTap: (index) {},
      ),
    );
  }
}
