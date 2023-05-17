import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:howabout_coffee/app/core/ui/base_state/app_state.dart';
import 'package:howabout_coffee/app/core/ui/styles/text_styles.dart';
import 'package:howabout_coffee/app/data/services/auth/auth_service.dart';
import 'package:howabout_coffee/app/modules/presentation/presentation_controller.dart';
import 'package:howabout_coffee/app/modules/presentation/state/presentation_state.dart';

import '../../core/ui/styles/color_app.dart';

class PresentationPage extends StatefulWidget {
  const PresentationPage({Key? key}) : super(key: key);

  @override
  State<PresentationPage> createState() => _PresentationPageState();
}

class _PresentationPageState extends BaseState<PresentationPage, PresentationController> {
  @override
  void onReady() {
    super.onReady();
    controller.getPromotion();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          children: [
            Image.asset(
              'assets/images/logo_coffee.png',
              width: 200,
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 18.0),
              child: Text(
                'Bem vindo ao How about coffee',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            BlocConsumer<PresentationController, PresentationState>(
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
              builder: (context, state) {
                return Expanded(
                  child: Visibility(
                    visible: state.status == PresentationStatus.loaded,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(),
                      child: CarouselSlider.builder(
                          keepPage: true,
                          slideIndicator: CircularSlideIndicator(
                            padding: const EdgeInsets.only(bottom: 32),
                          ),
                          enableAutoSlider: true,
                          unlimitedMode: true,
                          slideBuilder: (index) {
                            final image = state.images[index];
                            return CachedNetworkImage(
                              fit: BoxFit.cover,
                              imageUrl: image.image,
                              placeholder: (context, url) => (index > 0)
                                  ? CachedNetworkImage(
                                      imageUrl: state.images[index - 1].image,
                                      fit: BoxFit.cover,
                                    )
                                  : const SizedBox(),
                            );
                          },
                          itemCount: state.images.length),
                    ),
                  ),
                );
              },
            ),
            Container(
              color: ColorsApp.instance.primary,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: TextButton(
                    onPressed: () {
                      if (context.read<AuthService>().isLogged()) {
                        Navigator.of(context).pushReplacementNamed('/home');
                      } else {
                        Navigator.of(context).pushReplacementNamed('/login');
                      }
                    },
                    child: Text(
                      'Entrar',
                      style: context.textStyles.textExtraBold.copyWith(
                        color: ColorsApp.instance.fontColor,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
