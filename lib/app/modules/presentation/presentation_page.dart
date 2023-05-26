import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:howabout_coffee/app/core/extensions/size_extensions.dart';
import 'package:howabout_coffee/app/core/extensions/translate.dart';
import 'package:howabout_coffee/app/core/ui/base_state/app_state.dart';
import 'package:howabout_coffee/app/core/ui/styles/text_styles.dart';
import 'package:howabout_coffee/app/modules/presentation/presentation_controller.dart';
import 'package:howabout_coffee/app/modules/presentation/state/presentation_state.dart';

import '../../core/ui/styles/color_app.dart';
import '../../data/services/auth/auth_service.dart';

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
      body: Center(
        child: Stack(
          children: [
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
                return Visibility(
                  visible: state.status == PresentationStatus.loaded,
                  child: CarouselSlider.builder(
                      keepPage: true,

                      // slideIndicator: CircularSlideIndicator(
                      //   padding: const EdgeInsets.only(bottom: 30),
                      //   indicatorBorderColor: ColorsApp.instance.primary,
                      //   indicatorBackgroundColor: ColorsApp.instance.primary,
                      //   currentIndicatorColor: ColorsApp.instance.fontColor,
                      // ),
                      autoSliderTransitionTime: const Duration(milliseconds: 800),
                      enableAutoSlider: true,
                      unlimitedMode: true,
                      autoSliderTransitionCurve: Curves.fastOutSlowIn,
                      slideBuilder: (index) {
                        final image = state.images[index];
                        return Opacity(
                          opacity: 0.6,
                          child: Container(
                            clipBehavior: Clip.antiAlias,
                            decoration: const BoxDecoration(),
                            child: CachedNetworkImage(
                              fit: BoxFit.cover,
                              imageUrl: image.image,
                              placeholder: (context, url) => (index > 0)
                                  ? CachedNetworkImage(
                                      imageUrl: state.images[index - 1].image,
                                      fit: BoxFit.cover,
                                    )
                                  : const SizedBox(),
                            ),
                          ),
                        );
                      },
                      itemCount: state.images.length),
                );
              },
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Image.asset(
                'assets/images/logo_coffee_transparente.png',
                color: ColorsApp.instance.white,
                width: 200,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 165.0),
              child: Align(
                alignment: Alignment.topCenter,
                child: Text('presentation.welcome'.translate, style: context.textStyles.textExtraBold.copyWith(color: ColorsApp.instance.white)),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                color: ColorsApp.instance.primary,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: SizedBox(
                    width: context.screenWidth,
                    child: TextButton(
                      onPressed: () async {
                        showLoader();
                        final nav = Navigator.of(context);
                        final user = await controller.autoLogin(authService: context.read<AuthService>());
                        if (user == true) {
                          nav.pushNamedAndRemoveUntil('/home', (route) => false);
                        } else {
                          nav.pushNamedAndRemoveUntil('/login', (route) => false);
                        }
                      },
                      child: Text(
                        'btn.enter'.translate,
                        style: context.textStyles.textExtraBold.copyWith(
                          color: ColorsApp.instance.fontColor,
                        ),
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
