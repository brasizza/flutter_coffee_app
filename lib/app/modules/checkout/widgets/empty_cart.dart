import 'package:flutter/material.dart';
import 'package:howabout_coffee/app/core/extensions/translate.dart';
import 'package:howabout_coffee/app/core/ui/styles/color_app.dart';
import 'package:howabout_coffee/app/core/ui/styles/text_styles.dart';
import 'package:howabout_coffee/app/core/widgets/my_button.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/mug_empty.png'),
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 10, right: 10, bottom: 30),
              child: Text(
                'emptycart.message'.translate,
                style: context.textStyles.textMedium.copyWith(
                  color: ColorsApp.instance.fontColor,
                  fontSize: 20,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: MyButton(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  text: 'btn.close'.translate),
            )
          ],
        ),
      ),
    );
  }
}
