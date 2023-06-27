import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:howabout_coffee/app/core/extensions/translate.dart';
import 'package:howabout_coffee/app/core/mixins/loader.dart';
import 'package:howabout_coffee/app/core/ui/styles/color_app.dart';
import 'package:howabout_coffee/app/data/models/client_model.dart';
import 'package:howabout_coffee/app/data/services/auth/auth_service.dart';
import 'package:howabout_coffee/app/data/services/user/user_service.dart';
import 'package:howabout_coffee/app/modules/favorite/favorite_route.dart';
import 'package:howabout_coffee/app/modules/home/home_controller.dart';

class MenuDrawer extends StatefulWidget {
  final ClientModel? user;
  static const padding = EdgeInsets.symmetric(horizontal: 20);

  const MenuDrawer({super.key, required this.user});

  @override
  State<MenuDrawer> createState() => _MenuDrawerState();
}

class _MenuDrawerState extends State<MenuDrawer> with Loader {
  @override
  Widget build(BuildContext context) => Drawer(
        child: Container(
          color: ColorsApp.instance.black,
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    buildHeader(
                      context,
                      urlImage: widget.user?.avatar,
                      name: widget.user?.name ?? '',
                      email: widget.user?.email ?? '',
                    ),
                    Container(
                      padding: MenuDrawer.padding,
                      child: Column(
                        children: [
                          buildMenuItem(
                            tap: () async {
                              final homeController = context.read<HomeController>();
                              final nav = Navigator.of(context);
                              final client = await Navigator.of(context).pushNamed('/home/profile', arguments: {'client': context.read<UserService>().currentUser});
                              if (client != null) {
                                homeController.refreshUser(client as ClientModel);
                              }
                              nav.pop();
                            },
                            context,
                            text: 'drawer.profile'.translate,
                            icon: Icons.people,
                          ),
                          const SizedBox(height: 16),
                          buildMenuItem(context, text: 'drawer.favorites'.translate, icon: Icons.favorite, tap: () async {
                            final nav = Navigator.of(context);

                            await showModalBottomSheet(
                                isDismissible: false,
                                isScrollControlled: true,
                                context: context,
                                builder: (_) {
                                  return FavoriteRoute.page(checkoutController: context.read(), homeController: context.read());
                                });
                            nav.pop();
                          }),
                          const SizedBox(height: 16),
                          buildMenuItem(
                            context,
                            text: 'drawer.notification'.translate,
                            icon: Icons.notifications_outlined,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: buildMenuItem(context, text: 'drawer.logout'.translate, icon: Icons.logout, tap: () async {
                  showLoader();
                  final nav = Navigator.of(context);
                  await context.read<AuthService>().signOut();
                  hideLoader();
                  nav.pushNamedAndRemoveUntil('/presentation', (route) => false);
                }),
              ),
            ],
          ),
        ),
      );

  Widget buildMenuItem(BuildContext context, {required String text, required IconData icon, VoidCallback? tap}) {
    return Material(
      color: Colors.transparent,
      child: ListTile(
        selected: false,
        selectedTileColor: Colors.white24,
        leading: Icon(icon, color: ColorsApp.instance.primary),
        title: Text(text, style: TextStyle(color: ColorsApp.instance.primary, fontSize: 16)),
        onTap: () => tap?.call(),
      ),
    );
  }

  Widget buildHeader(
    BuildContext context, {
    required String? urlImage,
    required String name,
    required String email,
  }) =>
      Material(
        color: Colors.transparent,
        child: InkWell(
          // onTap: () => selectItem(context, NavigationItem.header),
          child: Container(
            padding: MenuDrawer.padding.add(const EdgeInsets.symmetric(vertical: 40)),
            child: Column(
              children: [
                CircleAvatar(radius: 50, backgroundImage: ((widget.user?.avatar == null) ? const AssetImage('assets/images/logo_coffee.png') : NetworkImage(widget.user?.avatar ?? '')) as ImageProvider),
                Text(
                  name,
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                ),
                const SizedBox(height: 4),
                Text(
                  email,
                  style: const TextStyle(fontSize: 14, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      );
}
