import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:letshop_mobile/models/review.dart';
import 'package:letshop_mobile/utils/constants/font_size.dart';
import 'package:letshop_mobile/utils/device/sizing.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ReviewCard extends StatelessWidget {

  final Review review;

  const ReviewCard({
    Key? key,
    required this.review,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final berlinWallFell = DateTime.now();
    final date = review.date;
    final difference = berlinWallFell.difference(date!).inDays;

    return Container(
      margin: EdgeInsets.symmetric(vertical: Sizing.h(5)),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
              height: Sizing.w(40),
              width: Sizing.w(40),
              margin: EdgeInsets.only(right: Sizing.w(16)),
              decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  image: new DecorationImage(fit: BoxFit.fill, image: new NetworkImage(review.profilePicture?? "https://www.freeiconspng.com/thumbs/profile-icon-png/profile-icon-9.png"))
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
                    Text(review.username?? 'name null', style: TextStyle(fontSize: FontSize.bodyLarge)),
                    Text('${difference} days ago', style: TextStyle(fontSize: FontSize.bodyRegular)),
                  ],
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: Sizing.h(4)),
                  child: RatingBarIndicator(
                    rating: review.rate!.toDouble(),
                    itemBuilder: (context, index) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    itemCount: 5,
                    itemSize: Sizing.w(15),
                    direction: Axis.horizontal,
                  ),
                ),
                Container(
                    width: Sizing.w(260),
                    child: Text(review.content?? 'review content null', style: TextStyle(fontSize: FontSize.bodyRegular))
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
