import 'package:flutter/cupertino.dart';
import '../../app/core/utils/color_resources.dart';

Row titleRow({required String title}) {
  return Row(
    children: [
      Text(
        title,
        style: const TextStyle(
            color: ColorResources.primary,
            fontSize: 20,
            fontWeight: FontWeight.w600),
      ),
    ],
  );
}
