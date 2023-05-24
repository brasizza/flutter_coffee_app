import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:howabout_coffee/app/core/extensions/size_extensions.dart';
import 'package:howabout_coffee/app/core/global/translation/app_translation.dart';
import 'package:howabout_coffee/app/core/ui/base_state/app_state.dart';
import 'package:howabout_coffee/app/core/ui/styles/color_app.dart';
import 'package:howabout_coffee/app/modules/login/login_controller.dart';
import 'package:howabout_coffee/app/modules/login/state/login_state.dart';

import '../../core/widgets/my_button.dart';
import '../../core/widgets/my_textfield.dart';

class LoginPage extends StatefulWidget {
  final AppTranslation translation;
  const LoginPage({Key? key, required this.translation}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends BaseState<LoginPage, LoginController> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final double opacity = 0.5;
  // final controller = Get.find<ADASDAS>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void loginUser() async {
    final nav = Navigator.of(context);
    if (formKey.currentState!.validate()) {
      final user = await controller.loginUser(email: emailController.text, password: passwordController.text);
      if (user) {
        nav.pushReplacementNamed('/home');
      } else {
        nav.pushReplacementNamed('/presentation');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: BlocConsumer<LoginController, LoginState>(
          listener: (context, state) {
            state.status.matchAny(
              any: (() => hideLoader()),
              loading: (() => showLoader()),
              resendPassword: (() => showSuccess(widget.translation.translate('reset.email'))),
              emptyEmail: (() => showError(widget.translation.translate('email.emtpy'))),
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
          builder: (context, state) => Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    'assets/images/lattee.jpg',
                    width: context.screenWidth,
                    height: context.screenHeight,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: 0,
                    child: Image.asset(
                      'assets/images/logo_coffee_transparente.png',
                      width: 200,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: context.screenHeight * 0.05),
                      SizedBox(height: context.screenHeight * 0.18),
                      Text(widget.translation.translate('login.welcome'), style: const TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold)),
                      SizedBox(height: context.screenHeight * 0.02),
                      ClipRect(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(color: const Color.fromRGBO(0, 0, 0, 1).withOpacity(opacity), borderRadius: const BorderRadius.all(Radius.circular(30))),
                          width: context.screenWidth * 0.9,
                          height: context.screenHeight * 0.63,
                          child: Form(
                            key: formKey,
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  // username textfield
                                  MyTextField(
                                    controller: emailController,
                                    hintText: widget.translation.translate('fields.email'),
                                    obscureText: false,
                                    validatorText: widget.translation.translate('validation.email_empty'),
                                  ),

                                  const SizedBox(height: 20),

                                  MyTextField(
                                    controller: passwordController,
                                    hintText: widget.translation.translate('fields.password'),
                                    obscureText: true,
                                    validatorText: widget.translation.translate('validation.password_empty'),
                                  ),

                                  const SizedBox(height: 20),

                                  // sign in button
                                  MyButton(
                                    text: widget.translation.translate('btn.enter'),
                                    onTap: () => loginUser(),
                                  ),

                                  const SizedBox(height: 20),

                                  // or continue with
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Divider(
                                          thickness: 0.5,
                                          color: Colors.grey[400],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                        child: Text(
                                          widget.translation.translate('or'),
                                          style: const TextStyle(color: Colors.white, fontSize: 16),
                                        ),
                                      ),
                                      Expanded(
                                        child: Divider(
                                          thickness: 0.5,
                                          color: Colors.grey[400],
                                        ),
                                      ),
                                    ],
                                  ),

                                  // not a member? register now
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          widget.translation.translate('login.dont_have_account'),
                                          style: const TextStyle(color: Colors.white, fontSize: 18),
                                          textAlign: TextAlign.start,
                                        ),
                                        const SizedBox(height: 10),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.of(context).pushNamed('/login/sign-up');
                                          },
                                          child: Text(
                                            widget.translation.translate('login.sing_up_label'),
                                            style: TextStyle(color: ColorsApp.instance.primary, fontWeight: FontWeight.bold, fontSize: 20),
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            GestureDetector(
                                              onTap: () => controller.forgotPassword(email: emailController.text),
                                              child: Text(
                                                widget.translation.translate('login.forgot_password'),
                                                style: TextStyle(color: ColorsApp.instance.primary, fontWeight: FontWeight.bold, fontSize: 18),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
