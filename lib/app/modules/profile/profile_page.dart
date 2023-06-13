import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:howabout_coffee/app/core/ui/base_state/app_state.dart';
import 'package:howabout_coffee/app/modules/profile/profile_controller.dart';
import 'package:howabout_coffee/app/modules/profile/state/profile_state.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends BaseState<ProfilePage, ProfileController> {
  @override
  void onReady() {
    final client = (ModalRoute.of(context)?.settings.arguments as Map)['client'] ?? null;
    if (client != null) {
      controller.addUser(client);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileController, ProfileState>(
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
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          title: Text(state.client.toString()),
        ),
        body: Container(),
      ),
    );
  }
}
