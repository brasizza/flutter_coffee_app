import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:howabout_coffee/app/data/repositories/presentation/presentation_repository.dart';
import 'package:howabout_coffee/app/data/repositories/presentation/presentation_repositoryimpl.dart';
import 'package:howabout_coffee/app/data/services/auth/auth_service.dart';
import 'package:howabout_coffee/app/data/services/auth/auth_service_impl.dart';
import 'package:howabout_coffee/app/data/services/presentation/presentation_service.dart';
import 'package:howabout_coffee/app/data/services/presentation/presentation_service_impl.dart';
import 'package:howabout_coffee/app/modules/presentation/presentation_controller.dart';
import 'package:howabout_coffee/app/modules/presentation/presentation_page.dart';
import 'package:provider/provider.dart';

class PresentationRouter {
  PresentationRouter._();

  static Widget get page => MultiProvider(
        providers: [
          Provider<PresentationRepository>(
            create: ((context) => PresentationRepositoryImpl(rest: context.read())),
          ),
          Provider<PresentationService>(
            create: ((context) => PresentationServiceImpl(repository: context.read())),
          ),
          Provider<PresentationController>(
            create: ((context) => PresentationController(service: context.read())),
          ),
          Provider<AuthService>(
            create: ((context) => AuthServiceImpl(instance: FirebaseAuth.instance)),
          ),
        ],
        child: const PresentationPage(),
      );
}
