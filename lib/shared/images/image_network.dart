import 'package:flutter/material.dart';

class ImageNetwork extends StatelessWidget {
  // TODO: Change default image
  String? url;
  double? height;
  double? width;
  BoxFit? fit;

  ImageNetwork(
    this.url, {
    Key? key,
    this.height,
    this.width,
    this.fit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      url ??
          'https://media.istockphoto.com/photos/white-sneaker-on-a-blue-gradient-background-mens-fashion-sport-shoe-picture-id1303978937?b=1&k=20&m=1303978937&s=170667a&w=0&h=az5Y96agxAdHt3XAv7PP9pThdiDpcQ3otWWn9YuJQRc=',
      height: height,
      width: width,
      fit: fit ?? BoxFit.cover,
    );
  }
}
