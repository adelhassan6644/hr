import 'package:flutter/cupertino.dart';
import '../app/core/color_resources.dart';

Row titleRow({required String title}) {
  return Row(
    children: [
      Text(
        title,
        style: const TextStyle(
            color: Styles.PRIMARY_COLOR,
            fontSize: 20,
            fontWeight: FontWeight.w600),
      ),
    ],
  );
}
