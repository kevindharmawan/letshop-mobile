import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:letshop_mobile/models/product.dart';
import 'package:letshop_mobile/shared/images/_images.dart';
import 'package:letshop_mobile/utils/constants/font_size.dart';
import 'package:letshop_mobile/utils/device/sizing.dart';
import 'package:letshop_mobile/utils/theme/theme_constant.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      width: Sizing.w(152),
      alignment: Alignment.topLeft,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(Sizing.h(8))),
        color: themeController.elevated,
        boxShadow: themeController.shadowMd,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: Sizing.w(12),
        vertical: Sizing.h(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImageNetwork(
            product.imageUrl,
            height: Sizing.h(100),
            width: Sizing.w(128),
          ),
          Text(
            product.name ?? 'Name not found.',
            style: TextStyle(
              color: themeController.onElevated,
              fontSize: FontSize.bodyRegular,
              height: 1.5,
            ),
          ),
          Text(
            'Rp. ${product.price}',
            style: TextStyle(
              color: themeController.primary,
              fontSize: FontSize.bodyLarge,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: [
              Icon(
                Icons.star,
                color: themeController.warning,
                size: 15,
              ),
              Text(
                '${product.rate} | ${product.sold} sold',
                style: TextStyle(
                  color: themeController.onElevated,
                  fontSize: FontSize.bodySmall,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
