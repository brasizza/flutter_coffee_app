import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:howabout_coffee/app/core/rest/rest_client.dart';
import 'package:howabout_coffee/app/data/repositories/categories/categories_repository.dart';
import 'package:howabout_coffee/app/data/repositories/categories/categories_repository_impl.dart';
import 'package:howabout_coffee/app/data/repositories/products/products_repository.dart';
import 'package:howabout_coffee/app/data/repositories/products/products_repository_impl.dart';
import 'package:howabout_coffee/app/data/services/categoies/categories_service.dart';
import 'package:howabout_coffee/app/data/services/categoies/categories_service_impl.dart';
import 'package:howabout_coffee/app/data/services/products/products_service.dart';
import 'package:howabout_coffee/app/data/services/products/products_service_impl.dart';
import 'package:howabout_coffee/app/modules/products/products_controller.dart';
import 'package:howabout_coffee/app/modules/products/products_page.dart';

import 'home_controller.dart';
import 'widgets/special_coffee_card.dart';

class HomePage extends GetView<HomeController> {
  HomePage({super.key});

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawerEnableOpenDragGesture: false,
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        leading: GestureDetector(
          onTap: () => scaffoldKey.currentState?.openDrawer(),
          child: Icon(
            Icons.menu,
            color: context.theme.primaryColor,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Icon(Icons.person, weight: 50, color: context.theme.primaryColor),
          )
        ],
      ),
      drawer: const Drawer(),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(20),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Find the best\ncoffee for you",
                style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: GetBuilder<ProductsController>(
                  init: ProductsController(
                    categoriesService: Get.put<CategoriesService>(
                      CategoriesServiceImpl(
                        repository: Get.put<CategoriesRepository>(
                          CategoriesRepositoryImpl(
                            rest: Get.find<RestClient>(),
                          ),
                        ),
                      ),
                    ),
                    productsService: Get.put<ProductsService>(
                      ProductsServiceImpl(
                        repository: Get.put<ProductsRepository>(
                          ProductsRepositoryImpl(
                            rest: Get.find<RestClient>(),
                          ),
                        ),
                      ),
                    ),
                  ),
                  didChangeDependencies: (state) {},
                  builder: (value) => ProductsPage(),
                ),
              ),
              const Text(
                "Special for you",
                style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              SpecialCoffeeCard(),
            ],
          ),
        ),
      )),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: const Color(0xffd17842),
        unselectedItemColor: const Color(0xff4d4f52),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
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
