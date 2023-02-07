import 'package:flutter/material.dart';
import 'package:hr_project/app/core/utils/color_resources.dart';
import 'package:hr_project/app/core/utils/dimensions.dart';
import 'package:hr_project/app/core/utils/extensions.dart';
import 'package:hr_project/domain/localization/language_constant.dart';
import 'package:hr_project/presentation/base/custom_app_bar.dart';
import 'package:hr_project/presentation/requests/request_flow_screen.dart';
import 'package:hr_project/presentation/requests/widgets/title_container.dart';


class RequestsScreen extends StatelessWidget {
  const RequestsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
       title: getTranslated("requests", context),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_DEFAULT.w),
        child: Column(children: [
          SizedBox(height:24.h),
          InkWell(
            onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  RequestFlowScreen(
              requestType: getTranslated("loan", context),
              status: getTranslated("rejected", context).replaceAll("ال", "").replaceAll("ة", "") ,
            ),)),
            child: Container(width: context.width,
              padding: const EdgeInsets.symmetric(vertical: Dimensions.PADDING_SIZE_DEFAULT),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                      width: 0.5,
                      color: ColorResources.BORDER_COLOR
                  )
              ),
              child: Column(children: [
                SizedBox(height: 10.h,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_DEFAULT),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      titleContainer(title:getTranslated("rejected", context).replaceAll("ال", "").replaceAll("ة", ""),color: ColorResources.WARNING_COLOR.withOpacity(0.2)),
                      titleContainer(title:DateTime.now().format("EEEE dd MMMM"),),
                    ],
                  ),
                ),
                SizedBox(height: 10.h,),
                Container(height: 1,color: ColorResources.BORDER_COLOR,),
                SizedBox(height: 10.h,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_DEFAULT),
                  child: SizedBox(
                    width: context.width,
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          titleContainer(title:getTranslated("loan", context),color: ColorResources.PRIMARY.withOpacity(0.2)),
                          titleContainer(title:"ملغي من الموظف"),
                          titleContainer(title:"ملغي من الموظف"),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.h,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_DEFAULT),
                  child: SizedBox(
                    width: context.width,
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          titleContainer(title:getTranslated("needing", context),icon: Icons.question_mark),
                        ],
                      ),
                    ),
                  ),
                ),
              ],),),
          ),
          SizedBox(height:24.h),
          InkWell(
            onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  RequestFlowScreen(
              requestType: getTranslated("vacation", context),
              status: getTranslated("approved", context),
            ),)),
            child: Container(width: context.width,
              padding: const EdgeInsets.symmetric(vertical: Dimensions.PADDING_SIZE_DEFAULT),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                      width: 0.5,
                      color: ColorResources.BORDER_COLOR
                  )
              ),
              child: Column(children: [
                SizedBox(height: 10.h,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_DEFAULT),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      titleContainer(title:getTranslated("approved", context),color: ColorResources.GREEN_COLOR.withOpacity(0.2)),
                      titleContainer(title:DateTime.now().format("EEEE dd MMMM"),),
                    ],
                  ),
                ),
                SizedBox(height: 10.h,),
                Container(height: 1,color: ColorResources.BORDER_COLOR,),
                SizedBox(height: 10.h,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_DEFAULT),
                  child: SizedBox(
                    width: context.width,
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          titleContainer(title:getTranslated("vacation", context),color: ColorResources.PRIMARY.withOpacity(0.2)),
                          titleContainer(title:"ملغي من الموظف"),
                          titleContainer(title:"ملغي من الموظف"),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.h,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_DEFAULT),
                  child: SizedBox(
                    width: context.width,
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          titleContainer(title:getTranslated("needing", context),icon: Icons.question_mark),
                        ],
                      ),
                    ),
                  ),
                ),
              ],),),
          )

        ],),
      ),
    );
  }
}
