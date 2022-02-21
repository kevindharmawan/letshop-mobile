import 'package:flutter/cupertino.dart';

class EmptyAppBar extends PreferredSize {
  EmptyAppBar({Key? key})
      : super(
          preferredSize: const Size.fromHeight(0),
          child: Container(),
        );
}
