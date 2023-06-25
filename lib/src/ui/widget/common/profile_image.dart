import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../core/utils/misc.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    super.key,
    required this.name,
  });

  final String name;

  @override
  Widget build(BuildContext context) {
    return Misc.getInitial(name)
        .text
        .makeCentered()
        .p8()
        .box
        .width(60)
        .height(60)
        .gray200
        .make()
        .clipOval();
  }
}
