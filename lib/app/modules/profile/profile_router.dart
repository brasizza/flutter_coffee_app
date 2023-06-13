import 'package:flutter/material.dart';
import 'package:howabout_coffee/app/modules/profile/profile_controller.dart';
import 'package:howabout_coffee/app/modules/profile/profile_page.dart';
import 'package:provider/provider.dart';

import '../../data/models/client_model.dart';

class ProfileRouter {
  ProfileRouter._();

  static ClientModel? client;

  static Widget get page => MultiProvider(
        providers: [
          Provider(
            create: (context) => ProfileController(),
          ),
        ],
        builder: (context, child) => const ProfilePage(),
      );
}
