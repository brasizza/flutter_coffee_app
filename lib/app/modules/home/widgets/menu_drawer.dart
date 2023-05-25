import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:howabout_coffee/app/core/mixins/loader.dart';
import 'package:howabout_coffee/app/core/ui/styles/color_app.dart';
import 'package:howabout_coffee/app/data/models/client_model.dart';
import 'package:howabout_coffee/app/data/services/auth/auth_service.dart';

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
                    Expanded(
                      child: Container(
                        padding: MenuDrawer.padding,
                        child: Column(
                          children: [
                            buildMenuItem(
                              context,
                              text: 'People',
                              icon: Icons.people,
                            ),
                            const SizedBox(height: 16),
                            buildMenuItem(
                              context,
                              text: 'Favourites',
                              icon: Icons.favorite_border,
                            ),
                            const SizedBox(height: 16),
                            buildMenuItem(
                              context,
                              text: 'Workflow',
                              icon: Icons.workspaces_outline,
                            ),
                            const SizedBox(height: 16),
                            buildMenuItem(
                              context,
                              text: 'Notifications',
                              icon: Icons.notifications_outlined,
                            ),
                            buildMenuItem(
                              context,
                              text: 'Favourites',
                              icon: Icons.favorite_border,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: buildMenuItem(context, text: 'Logout', icon: Icons.logout, tap: () async {
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
            padding: MenuDrawer.padding.add(EdgeInsets.symmetric(vertical: 40)),
            child: Column(
              children: [
                CircleAvatar(radius: 50, backgroundImage: ((widget.user?.avatar == null) ? const AssetImage('assets/images/logo_coffee.png') : NetworkImage(widget.user?.avatar ?? '')) as ImageProvider),
                Text(
                  name,
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                const SizedBox(height: 4),
                Text(
                  email,
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      );
}
