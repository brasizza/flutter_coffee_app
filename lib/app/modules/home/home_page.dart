import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:howabout_coffee/app/core/extensions/translate.dart';
import 'package:howabout_coffee/app/core/notification/notification_controller.dart';
import 'package:howabout_coffee/app/core/notification/state/notification_state.dart';
import 'package:howabout_coffee/app/core/ui/base_state/app_state.dart';
import 'package:howabout_coffee/app/core/ui/styles/color_app.dart';
import 'package:howabout_coffee/app/modules/home/home_controller.dart';
import 'package:howabout_coffee/app/modules/home/state/home_state.dart';
import 'package:howabout_coffee/app/modules/home/widgets/app_bottom_bar.dart';
import 'package:howabout_coffee/app/modules/home/widgets/float_button_credit.dart';
import 'package:howabout_coffee/app/modules/home/widgets/menu_drawer.dart';
import 'package:howabout_coffee/app/modules/products/product_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends BaseState<HomePage, HomeController> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void onReady() {
    controller.addUser();
    context.read<NotificationController>().init();
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
            clientLoaded: (() => true),
          )),
      builder: (context, state) {
        return Scaffold(
          floatingActionButton: FloatButtonCredit(client: state.client),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          key: scaffoldKey,
          drawerEnableOpenDragGesture: false,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            elevation: 0,
            actions: [
              Padding(
                padding: const EdgeInsets.only(top: 20, right: 20),
                child: BlocConsumer<NotificationController, NotificationState>(
                  listener: (context, state) {},
                  builder: (context, stateNotification) {
                    final totalBadges = stateNotification.notifications.where((not) => not.read == false).length;
                    return Badge(
                      backgroundColor: ColorsApp.instance.primary,
                      textColor: ColorsApp.instance.fontColor,
                      isLabelVisible: (totalBadges > 0),
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                      label: Text(totalBadges.toString()),
                      child: GestureDetector(
                        onTap: () => scaffoldKey.currentState?.openDrawer(),
                        child: (state.client?.avatar == null)
                            ? Icon(
                                Icons.person,
                                weight: 50,
                                color: ColorsApp.instance.primary,
                              )
                            : CircleAvatar(
                                backgroundImage: CachedNetworkImageProvider(
                                  state.client?.avatar ?? '',
                                ),
                              ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
          drawer: Drawer(
            elevation: 2,
            backgroundColor: ColorsApp.instance.black.withOpacity(.9),
            child: MenuDrawer(user: state.client),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'home_find_coffee'.translate,
                  style: const TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'home_special_coffee'.translate,
                  style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: ProductRouter.page,
                ),
              ],
            ),
          ),
          bottomNavigationBar: const AppBottomBar(),
        );
      },
    );
  }
}
