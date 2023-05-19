import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:howabout_coffee/app/core/extensions/size_extensions.dart';
import 'package:howabout_coffee/app/core/ui/base_state/app_state.dart';
import 'package:howabout_coffee/app/core/ui/styles/color_app.dart';
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
  final double opacity = 0.5;

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
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: BlocConsumer<LoginController, LoginState>(
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
                      SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.18),
                      const Text('boas_vindas', style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold)),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                      ClipRect(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(color: const Color.fromRGBO(0, 0, 0, 1).withOpacity(opacity), borderRadius: const BorderRadius.all(Radius.circular(30))),
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: MediaQuery.of(context).size.height * 0.63,
                          child: Form(
                            key: formKey,
                            child: Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // username textfield
                                  MyTextField(
                                    controller: emailController,
                                    hintText: 'E-mail',
                                    obscureText: false,
                                    validatorText: 'Empty email',
                                  ),

                                  const SizedBox(height: 10),

                                  MyTextField(
                                    controller: passwordController,
                                    hintText: 'Password',
                                    obscureText: true,
                                    validatorText: 'Your password',
                                  ),

                                  const SizedBox(height: 10),

                                  // sign in button
                                  MyButton(
                                    onTap: () => loginUser(),
                                  ),

                                  const SizedBox(height: 10),

                                  // or continue with
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Divider(
                                          thickness: 0.5,
                                          color: Colors.grey[400],
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                                        child: Text(
                                          'Or',
                                          style: TextStyle(color: Colors.white, fontSize: 16),
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

                                  const SizedBox(height: 10),

                                  // google + apple sign in buttons

                                  const SizedBox(height: 10),

                                  // not a member? register now
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            const Text(
                                              'Don\'t have an account?',
                                              style: TextStyle(color: Colors.white, fontSize: 20),
                                              textAlign: TextAlign.start,
                                            ),
                                            const SizedBox(width: 20),
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.of(context).pushNamed('/login/sign-up');
                                              },
                                              child: Text(
                                                'Sign Up',
                                                style: TextStyle(color: ColorsApp.instance.primary, fontWeight: FontWeight.bold, fontSize: 20),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
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
