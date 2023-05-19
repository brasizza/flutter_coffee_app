import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:howabout_coffee/app/core/ui/base_state/app_state.dart';
import 'package:howabout_coffee/app/core/ui/styles/color_app.dart';
import 'package:howabout_coffee/app/modules/home/home_controller.dart';
import 'package:howabout_coffee/app/modules/home/state/home_state.dart';
import 'package:howabout_coffee/app/modules/home/widgets/special_coffee_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends BaseState<HomePage, HomeController> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void onReady() {
    // TODO: implement onReady
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
          backgroundColor: Colors.black,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.black,
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
          body: SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Special for you",
                    style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SpecialCoffeeCard(coffeeName: [
                    'AAAA'
                  ], ingredients: [
                    'BBB'
                  ], price: [
                    "3.00"
                  ], specialImages: [
                    "assets/images/coffee_based.jpg",
                    "assets/images/coffee.jpg",
                    "assets/images/lattee.jpg",
                  ]),
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
      },
    );
  }
}
