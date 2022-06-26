import 'package:flutter/material.dart';
import 'package:letshop_mobile/shared/cards/review_card.dart';
import 'package:letshop_mobile/utils/device/sizing.dart';
import 'package:letshop_mobile/utils/constants/font_size.dart';

class ProductReview extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 0, vertical: Sizing.h(16)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Review (3)", style: TextStyle(fontSize: FontSize.subheading, fontWeight: FontWeight.bold)),
                  Row(
                      children: [
                        Container(
                            height: Sizing.w(16),
                            width: Sizing.w(16),
                            margin: EdgeInsets.only(right: Sizing.w(6)),
                            child: Image(image: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/thumb/9/99/Star_icon_stylized.svg/1077px-Star_icon_stylized.svg.png'))
                        ),
                        Text("4.7", style: TextStyle(fontSize: FontSize.bodyLarge))
                      ]
                  ),
                ],
              ),
              ReviewCard(),
              ReviewCard(),
              ReviewCard(),
            ],
          ),
        ),
      ],
    );
  }

}