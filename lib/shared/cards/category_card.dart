import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:letshop_mobile/models/category.dart';
import 'package:letshop_mobile/shared/images/_images.dart';
import 'package:letshop_mobile/utils/constants/font_size.dart';
import 'package:letshop_mobile/utils/device/sizing.dart';
import 'package:letshop_mobile/utils/theme/theme_constant.dart';

class CategoryCard extends StatelessWidget {
  final Category category;

  const CategoryCard({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(Sizing.h(8))),
        color: themeController.elevated,
        boxShadow: themeController.shadowMd,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: Sizing.w(16),
        vertical: Sizing.h(16),
      ),
      child: Column(
        children: [
          ImageNetwork(
            category.imageUrl,
            height: Sizing.h(100),
            width: Sizing.w(100),
          ),
          Text(
            category.name ?? 'Name not found.',
            style: TextStyle(
              color: themeController.onElevated,
              fontSize: FontSize.bodyRegular,
            ),
          ),
        ],
      ),
    );
  }
}
