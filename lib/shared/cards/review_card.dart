import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:letshop_mobile/models/review.dart';
import 'package:letshop_mobile/utils/constants/font_size.dart';
import 'package:letshop_mobile/utils/device/sizing.dart';
import '../../models/user.dart';

class ReviewCard extends StatelessWidget {

  // final Review review;
  // final User user;
  //
  // const ReviewCard({
  //   Key? key,
  //   required this.review, required this.user,
  // }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: Sizing.h(16)),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
              height: Sizing.w(40),
              width: Sizing.w(40),
              margin: EdgeInsets.only(right: Sizing.w(16)),
              decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  image: new DecorationImage(fit: BoxFit.fill, image: new NetworkImage("https://www.freeiconspng.com/thumbs/profile-icon-png/profile-icon-9.png"))
              )
          ),
          Container(
            width: Sizing.w(260),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Lorem Ipsum", style: TextStyle(fontSize: FontSize.bodyLarge)),
                    Text("5 days ago", style: TextStyle(fontSize: FontSize.bodyRegular)),
                  ],
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: Sizing.h(4)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          height: Sizing.w(12),
                          width: Sizing.w(12),
                          margin: EdgeInsets.only(right: Sizing.w(6)),
                          child: Image(image: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/thumb/9/99/Star_icon_stylized.svg/1077px-Star_icon_stylized.svg.png'))
                      ),
                      Container(
                          height: Sizing.w(12),
                          width: Sizing.w(12),
                          margin: EdgeInsets.only(right: Sizing.w(6)),
                          child: Image(image: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/thumb/9/99/Star_icon_stylized.svg/1077px-Star_icon_stylized.svg.png'))
                      ),
                      Container(
                          height: Sizing.w(12),
                          width: Sizing.w(12),
                          margin: EdgeInsets.only(right: Sizing.w(6)),
                          child: Image(image: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/thumb/9/99/Star_icon_stylized.svg/1077px-Star_icon_stylized.svg.png'))
                      ),
                      Container(
                          height: Sizing.w(12),
                          width: Sizing.w(12),
                          margin: EdgeInsets.only(right: Sizing.w(6)),
                          child: Image(image: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/thumb/9/99/Star_icon_stylized.svg/1077px-Star_icon_stylized.svg.png'))
                      ),
                      Container(
                          height: Sizing.w(12),
                          width: Sizing.w(12),
                          margin: EdgeInsets.only(right: Sizing.w(6)),
                          child: Image(image: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/thumb/9/99/Star_icon_stylized.svg/1077px-Star_icon_stylized.svg.png'))
                      ),
                    ],
                  ),
                ),
                Container(
                    width: Sizing.w(260),
                    child: Text("Lorem ipsum dolor sitamet consectetur, adipisici ngelit. Ipsa, eius? Debitis perferendis nisi earum dolorem impedit", style: TextStyle(fontSize: FontSize.bodyLarge))
                )
              ],
            ),
          )

        ],
      ),
    );
  }
}
