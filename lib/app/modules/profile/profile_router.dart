import 'package:flutter/material.dart';
import 'package:howabout_coffee/app/modules/profile/profile_controller.dart';
import 'package:howabout_coffee/app/modules/profile/profile_page.dart';
import 'package:provider/provider.dart';

class ProfileRouter {
  ProfileRouter._();
  static Widget get page => MultiProvider(
        providers: [
          Provider(
            create: (context) => ProfileController(service: context.read()),
          ),
        ],
        builder: (context, child) => const ProfilePage(),
      );
}
