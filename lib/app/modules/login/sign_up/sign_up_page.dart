import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:howabout_coffee/app/core/extensions/size_extensions.dart';
import 'package:howabout_coffee/app/core/extensions/translate.dart';
import 'package:howabout_coffee/app/core/ui/base_state/app_state.dart';
import 'package:howabout_coffee/app/core/ui/styles/text_styles.dart';
import 'package:howabout_coffee/app/core/widgets/my_button.dart';
import 'package:howabout_coffee/app/modules/login/sign_up/sign_up_controller.dart';
import 'package:howabout_coffee/app/modules/login/state/login_state.dart';

import '../../../core/widgets/my_textfield.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends BaseState<SignupPage, SignUpController> {
  // text editing controllers
  // final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final double _opacity = 0.5;

  final _formKey = GlobalKey<FormState>();

  // sign user in method
  Future<void> signUserIn() async {
    final nav = Navigator.of(context);
    if (_formKey.currentState!.validate()) {
      final user = await controller.signUp(
        email: emailController.text,
        password: passwordController.text,
      );
      if (user) {
        nav.pushReplacementNamed('/home');
      } else {
        nav.pushReplacementNamed('/presentation');
      }
    }
  }

  @override
  void dispose() {
    // usernameController.dispose();
    passwordController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SignUpController, LoginState>(
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
        child: SingleChildScrollView(
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Opacity(
                opacity: _opacity,
                child: Image.asset(
                  'assets/images/coffee_based.jpg',
                  width: context.screenWidth,
                  height: context.screenHeight,
                  fit: BoxFit.cover,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: context.screenHeight * 0.05),
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios),
                    color: Colors.white,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(height: context.screenHeight * 0.1),
                  Text('signup.sign_up_label'.translate, style: TextStyle(color: Colors.white, fontSize: context.textStyles.titleSize, fontWeight: FontWeight.bold)),
                  SizedBox(height: context.screenHeight * 0.02),
                  ClipRect(
                    clipBehavior: Clip.hardEdge,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(color: const Color.fromRGBO(0, 0, 0, 1).withOpacity(_opacity), borderRadius: const BorderRadius.all(Radius.circular(30))),
                      width: context.screenWidth * 0.9,
                      height: context.screenHeight * 0.7,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Form(
                          key: _formKey,
                          child: Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text('signup.text_creation'.translate,
                                    // ignore: prefer_const_constructors
                                    style: TextStyle(color: Colors.white, fontSize: 18),
                                    textAlign: TextAlign.start),
                                // ignore: prefer_const_constructors

                                const SizedBox(height: 40),

                                MyTextField(
                                  controller: emailController,
                                  hintText: 'Email',
                                  obscureText: false,
                                ),

                                const SizedBox(height: 20),
                                MyTextField(
                                  controller: passwordController,
                                  validatorText: 'Password empty',
                                  hintText: 'Password',
                                  obscureText: true,
                                ),
                                const SizedBox(height: 20),

                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    const SizedBox(height: 10),
                                    MyButton(
                                      text: 'signup.text_sign_up'.translate,
                                      onTap: () {
                                        signUserIn();
                                      },
                                    ),
                                  ],
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
