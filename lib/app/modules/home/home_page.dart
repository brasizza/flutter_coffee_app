import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:howabout_coffee/app/core/global/translation/app_translation.dart';
import 'package:howabout_coffee/app/core/ui/base_state/app_state.dart';
import 'package:howabout_coffee/app/core/ui/styles/color_app.dart';
import 'package:howabout_coffee/app/modules/home/home_controller.dart';
import 'package:howabout_coffee/app/modules/home/state/home_state.dart';
import 'package:howabout_coffee/app/modules/products/category_page.dart';
import 'package:howabout_coffee/app/modules/products/components/product_list.dart';

class HomePage extends StatefulWidget {
  final AppTranslation translation;
  const HomePage({Key? key, required this.translation}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends BaseState<HomePage, HomeController> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void onReady() {
    controller.addUser();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeController, HomeState>(
      listener: (context, state) {
        state.status.matchAny(
          any: (() => hideLoader()),
          loading: (() => showLoader()),
          error: () {
            hideLoader();
            showError(state.errorMessage ?? ' Erro');
          },
        );
      },
      buildWhen: ((previous, current) => current.status.matchAny(
            any: (() => false),
            initial: (() => true),
            loaded: (() => true),
          )),
      builder: (context, state) {
        return Scaffold(
          key: scaffoldKey,
          drawerEnableOpenDragGesture: false,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            leading: GestureDetector(
              onTap: () => scaffoldKey.currentState?.openDrawer(),
              child: Icon(
                Icons.menu,
                color: ColorsApp.instance.primary,
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Icon(
                  Icons.person,
                  weight: 50,
                  color: ColorsApp.instance.primary,
                ),
              )
            ],
          ),
          drawer: const Drawer(),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.translation.translate('home_find_coffee'),
                  style: const TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),

                Text(
                  widget.translation.translate('home_special_coffee'),
                  style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),

                CategoryPage(translation: widget.translation),
                const SizedBox(
                  height: 20,
                ),

                Expanded(
                  child: ProductList(translation: widget.translation),
                ),
                // Expanded(
                //   // child: ProductsPage(translation: widget.translation),
                // ),

                // SpecialCoffeeCard(coffeeName: [
                //   'AAAA'
                // ], ingredients: [
                //   'BBB'
                // ], price: [
                //   "3.00"
                // ], specialImages: [
                //   "assets/images/coffee_based.jpg",
                //   "assets/images/coffee.jpg",
                //   "assets/images/lattee.jpg",
                // ]),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
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
      },
    );
  }
}
