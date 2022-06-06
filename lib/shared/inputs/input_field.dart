import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:letshop_mobile/utils/constants/font_size.dart';
import 'package:letshop_mobile/utils/device/sizing.dart';
import 'package:letshop_mobile/utils/theme/theme_controller.dart';

class InputField extends StatelessWidget {
  final TextEditingController controller;
  final String placeholder;
  final String? label;
  final String? hint;
  final TextInputType? keyboardType;

  const InputField({
    Key? key,
    required this.controller,
    required this.placeholder,
    this.label,
    this.hint,
    this.keyboardType,
  }) : super(key: key);

  // TODO: Refactor
  ThemeController get themeController => GetInstance().find<ThemeController>();

  OutlineInputBorder _makeBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(Sizing.h(8)),
      borderSide: BorderSide(
        color: color,
        width: Sizing.w(1),
      ),
    );
  }

  // TODO: Detailing (text styling and margin/padding sizing)
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (label != null)
          Text(
            label!,
            style: TextStyle(
              color: themeController.onBackground,
              fontSize: FontSize.bodyRegular,
            ),
          ),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hint,
            errorBorder: _makeBorder(themeController.error),
            enabledBorder: _makeBorder(themeController.border),
            focusedBorder: _makeBorder(themeController.primary),
          ),
        ),
      ],
    );
  }
}
