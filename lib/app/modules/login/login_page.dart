import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:howabout_coffee/app/core/extensions/size_extensions.dart';
import 'package:howabout_coffee/app/core/extensions/translate.dart';
import 'package:howabout_coffee/app/core/ui/base_state/app_state.dart';
import 'package:howabout_coffee/app/core/ui/styles/color_app.dart';
import 'package:howabout_coffee/app/core/ui/styles/text_styles.dart';
import 'package:howabout_coffee/app/data/services/user/user_service.dart';
import 'package:howabout_coffee/app/modules/login/login_controller.dart';
import 'package:howabout_coffee/app/modules/login/state/login_state.dart';

import '../../core/widgets/my_button.dart';
import '../../core/widgets/my_textfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends BaseState<LoginPage, LoginController> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final double _opacity = 0.5;
  // final controller = Get.find<ADASDAS>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void loginUser() async {
    final nav = Navigator.of(context, rootNavigator: true);
    if (formKey.currentState!.validate()) {
      final userService = context.read<UserService>();

      final user = await controller.loginUser(email: emailController.text, password: passwordController.text);
      if (user) {
        await userService.getUser();
        nav.pushNamedAndRemoveUntil('/home', (route) => false);
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
              resendPassword: (() => showSuccess('reset.email'.translate)),
              emptyEmail: (() => showError('email.emtpy'.translate)),
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
          builder: (context, state) => Stack(
            alignment: Alignment.center,
            children: [
              Opacity(
                opacity: _opacity,
                child: Image.asset(
                  'assets/images/lattee.jpg',
                  width: context.screenWidth,
                  height: context.screenHeight,
                  fit: BoxFit.cover,
                ),
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
                  SizedBox(height: context.screenHeight * 0.18),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text('login.welcome'.translate, style: TextStyle(color: Colors.white, fontSize: context.textStyles.titleSize, fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(height: context.screenHeight * 0.02),
                  Center(
                    child: ClipRect(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(color: const Color.fromRGBO(0, 0, 0, 1).withOpacity(_opacity), borderRadius: const BorderRadius.all(Radius.circular(30))),
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
                                  hintText: 'fields.email'.translate,
                                  obscureText: false,
                                  validatorText: 'validation.email_empty'.translate,
                                ),

                                const SizedBox(height: 20),

                                MyTextField(
                                  controller: passwordController,
                                  hintText: 'fields.password'.translate,
                                  obscureText: true,
                                  validatorText: 'validation.password_empty'.translate,
                                ),

                                const SizedBox(height: 20),

                                // sign in button
                                MyButton(
                                  text: 'btn.enter'.translate,
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
                                        'or'.translate,
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
                                        'login.dont_have_account'.translate,
                                        style: const TextStyle(color: Colors.white, fontSize: 18),
                                        textAlign: TextAlign.start,
                                      ),
                                      const SizedBox(height: 10),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).pushNamed('/login/sign-up');
                                        },
                                        child: Text(
                                          'login.sing_up_label'.translate,
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
                                              'login.forgot_password'.translate,
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
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
