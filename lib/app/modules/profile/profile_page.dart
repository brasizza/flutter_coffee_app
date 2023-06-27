import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:howabout_coffee/app/core/extensions/translate.dart';
import 'package:howabout_coffee/app/core/ui/base_state/app_state.dart';
import 'package:howabout_coffee/app/core/ui/styles/color_app.dart';
import 'package:howabout_coffee/app/data/models/client_model.dart';
import 'package:howabout_coffee/app/modules/profile/profile_controller.dart';
import 'package:howabout_coffee/app/modules/profile/state/profile_state.dart';

import '../../core/widgets/my_button.dart';
import '../../core/widgets/my_textfield.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends BaseState<ProfilePage, ProfileController> {
  final formKey = GlobalKey<FormState>();

  final nameEC = TextEditingController();
  final phoneEC = TextEditingController();

  @override
  void dispose() {
    nameEC.dispose();
    phoneEC.dispose();
    super.dispose();
  }

  @override
  void onReady() {
    final ClientModel? client = (ModalRoute.of(context)?.settings.arguments as Map)['client'];
    if (client != null) {
      controller.addUser(client);
      nameEC.text = client.name ?? '';
      phoneEC.text = client.phoneNumber ?? '';
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
            photoChanged: (() => true),
          )),
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(state.client?.name ?? 'Profile page'),
        ),
        body: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Visibility(visible: state.photoProfile == null, replacement: CircleAvatar(radius: 60, backgroundImage: (state.photoProfile?.image)), child: CircleAvatar(radius: 60, backgroundImage: ((state.client?.avatar == null) ? const AssetImage('assets/images/logo_coffee.png') : NetworkImage(state.client?.avatar ?? '')) as ImageProvider)),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          onPressed: () async {
                            await controller.takePhoto(source: 'camera');
                          },
                          icon: Icon(
                            Icons.camera_alt_sharp,
                            size: 30,
                            color: ColorsApp.instance.fontColor,
                          ),
                        ),
                        IconButton(
                          onPressed: () async {
                            await controller.takePhoto(source: 'gallery');
                          },
                          icon: Icon(
                            Icons.image,
                            size: 30,
                            color: ColorsApp.instance.fontColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                const Spacer(),

                // username textfield
                MyTextField(
                  labelText: 'fields.name'.translate,
                  controller: nameEC,
                  hintText: 'fields.name'.translate,
                  obscureText: false,
                  validate: false,
                ),

                const SizedBox(height: 20),

                MyTextField(
                  labelText: 'fields.phone'.translate,
                  controller: phoneEC,
                  hintText: 'fields.phone'.translate,
                  obscureText: false,
                  validate: false,
                  validatorText: 'validaion.password_empty'.translate,
                ),

                const SizedBox(height: 20),
                const Spacer(),
                // sign in button
                MyButton(
                    text: 'fields.update'.translate,
                    onTap: () async {
                      if (state.client != null) {
                        final nav = Navigator.of(context);
                        final clientChanged = await controller.changeProfile(
                          client: state.client!.copyWith(name: nameEC.text, phoneNumber: phoneEC.text),
                        );
                        if (clientChanged != null) {
                          hideLoader();
                          nav.pop(clientChanged);
                        }
                      }
                    }),

                // or continue with
                // not a member? register now
              ],
            ),
          ),
        ),
      ),
    );
  }
}
