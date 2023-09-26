import 'package:flutter/material.dart';
import 'package:hr_project/components/custom_network_image.dart';
import 'package:hr_project/main_providers/user_provider.dart';
import 'package:provider/provider.dart';

import '../../../app/core/color_resources.dart';

class ProfileImageWidget extends StatelessWidget {
  const ProfileImageWidget({super.key, this.radius = 50});
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(builder: (_, provider, child) {
      return Container(
        width: (radius * 2),
        height: (radius * 2),
        decoration: const BoxDecoration(
            shape: BoxShape.circle, color: Styles.FILL_COLOR),
        child: provider.user?.image == null
            ? ClipOval(
                child: Icon(
                Icons.person,
                color: Styles.disabledColor,
                size: radius * 1.5,
              ))
            : CustomNetworkImage.circleNewWorkImage(
                image: provider.user?.image!,
                radius: radius,
              ),
      );
    });
  }
}
