import 'package:flutter/material.dart';
import 'package:hr_project/app/core/utils/extensions.dart';
import 'package:hr_project/navigation/custom_navigation.dart';
import '../../app/core/utils/color_resources.dart';
import '../../app/core/utils/dimensions.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final List<Widget>? actionChild;
  final bool showLeading ;
  final Widget? leadingAction;
  final bool titleCenter;

  const CustomAppBar({Key? key, this.title ,this.leadingAction ,this.titleCenter=false ,this.showLeading = false, this.actionChild}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shadowColor: ColorResources.PRIMARY,
      backgroundColor: ColorResources.WHITE,
      elevation: 0.5,
      shape: const Border(bottom: BorderSide(width: 0, color: ColorResources.transparentColor)),
      actions: actionChild,
      automaticallyImplyLeading: false,
      centerTitle:titleCenter,
      leadingWidth: Navigator.canPop(context)?60.w: 35.w,
      title: Padding(
        padding:  EdgeInsets.symmetric(horizontal: Navigator.canPop(context)?0:24.w),
        child: Text(title ??'',
            style:  const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            )),
      ),
      leading: Navigator.canPop(context)?Padding(
        padding:  const EdgeInsets.symmetric(horizontal:Dimensions.PADDING_SIZE_DEFAULT),
        child: leadingAction?? InkWell(
          onTap: ()=> CustomNavigator.pop(),
          child: Row(
            children: [
              SizedBox(width: Dimensions.PADDING_SIZE_DEFAULT.w,),
              const Icon(
                Icons.arrow_back_ios,
                size: 20,
                color: ColorResources.PRIMARY,
              ),
            ],
          )
        ),
      ):null,
    );
  }

  @override
  Size get preferredSize => const Size(double.maxFinite, 50);
}
