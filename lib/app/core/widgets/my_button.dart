import 'package:flutter/material.dart';
import 'package:howabout_coffee/app/core/ui/styles/app_style.dart';
import 'package:howabout_coffee/app/core/ui/styles/color_app.dart';
import 'package:howabout_coffee/app/core/ui/styles/text_styles.dart';

class MyButton extends StatelessWidget {
  final Function()? onTap;

  final String text;

  const MyButton({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: context.appStyles.primaryButton,
        onPressed: onTap,
        child: Container(
          padding: const EdgeInsets.all(25),
          child: Center(
            child: Text(
              text,
              style: context.textStyles.textBold.copyWith(
                color: ColorsApp.instance.fontColor,
              ),
            ),
          ),
        ));
  }
}
