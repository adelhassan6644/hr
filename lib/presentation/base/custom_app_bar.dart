import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../app/core/utils/app_strings.dart';
import '../../app/core/utils/color_resources.dart';
import '../../app/core/utils/dimensions.dart';
import '../../app/core/utils/images.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? actionChild;
  final bool showLeading ;
  final Widget? leadingAction;
  final bool titleCenter;

  const CustomAppBar({Key? key, this.title ,this.leadingAction ,this.titleCenter=false ,this.showLeading = false, this.actionChild}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shadowColor: ColorResources.primary,
      backgroundColor: ColorResources.primary,
      elevation: 0,
      shape: const Border(bottom: BorderSide(width: 0, color: ColorResources.primary)),
      actions: [Padding(
        padding: const EdgeInsets.only(right:Dimensions.PADDING_SIZE_DEFAULT),
        child: actionChild??const SizedBox(),
      )],
      automaticallyImplyLeading: false,
      centerTitle:titleCenter,
      leadingWidth: 39,
      title: Text(title ??'',
          style:  const TextStyle(
            fontSize: 16,
            fontFamily: AppStrings.fontFamily,
            fontWeight: FontWeight.w700,
          )),
      leading: Padding(
        padding:  const EdgeInsets.only(left:Dimensions.PADDING_SIZE_DEFAULT),
        child: leadingAction?? InkWell(
          onTap: () {Navigator.pop(context);},
          child: SvgPicture.asset(
            Images.save,
            color: Colors.white,
          )
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.maxFinite, 50);
}
