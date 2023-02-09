import 'package:flutter/material.dart';
import 'package:hr_project/app/core/utils/color_resources.dart';
import 'package:hr_project/app/core/utils/dimensions.dart';
import 'package:hr_project/app/core/utils/extensions.dart';
import 'package:hr_project/app/core/utils/text_styles.dart';
import 'package:hr_project/domain/localization/language_constant.dart';
import 'package:hr_project/presentation/base/custom_app_bar.dart';
import 'package:hr_project/presentation/base/custom_text_form_field.dart';


class PersonalScreen extends StatelessWidget {
  const PersonalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: getTranslated("personal", context),
      ),
      body: Padding(
        padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: ColorResources.FILL
                  ),
                  child: const ClipOval(
                    child:
                         Icon(Icons.person,color: ColorResources.disabledColor,size: 80,)
                  ),
                  ),
              ),
              SizedBox(height: 20.h,),
              Text(getTranslated("job_id", context),style: AppTextStyles.w600.copyWith(
                  fontSize: 14,
                  color: ColorResources.blackColor
              ),),
              SizedBox(height: 10.h,),
              const CustomTextFormField(
                isEdit: false,
                label: true,
                hint: "1253356",
                read: true,
              ),
              SizedBox(height: 20.h,),
              Text(getTranslated("name", context),style: AppTextStyles.w600.copyWith(
                fontSize: 14,
                color: ColorResources.blackColor
              ),),
              SizedBox(height: 10.h,),
              const CustomTextFormField(
                isEdit: false,
                label: true,
                 hint: "Software Cloud 2",
                read: true,
              ),
              SizedBox(height: 20.h,),
              Text(getTranslated("email_or_id", context),style: AppTextStyles.w600.copyWith(
                  fontSize: 14,
                  color: ColorResources.blackColor
              ),),
              SizedBox(height: 10.h,),
              const CustomTextFormField(
                isEdit: false,
                label: true,
                hint: "SoftwareCloud2@gmail.com",
                read: true,
              ),
              SizedBox(height: 20.h,),
              Text(getTranslated("phone", context),style: AppTextStyles.w600.copyWith(
                  fontSize: 14,
                  color: ColorResources.blackColor
              ),),
              SizedBox(height: 10.h,),
              const CustomTextFormField(
                isEdit: false,
                label: true,
                hint: "+505652110",
                read: true,
              ),
              SizedBox(height: 20.h,),
              Text(getTranslated("gender", context),style: AppTextStyles.w600.copyWith(
                  fontSize: 14,
                  color: ColorResources.blackColor
              ),),
              SizedBox(height: 10.h,),
               CustomTextFormField(
                isEdit: false,
                label: true,
                hint: getTranslated("male", context),
                read: true,
              ),
              SizedBox(height: 20.h,),
              Text(getTranslated("marital_status", context),style: AppTextStyles.w600.copyWith(
                  fontSize: 14,
                  color: ColorResources.blackColor
              ),),
              SizedBox(height: 10.h,),
              const CustomTextFormField(
                isEdit: false,
                label: true,
                hint: "أعزب",
                read: true,
              ),
              SizedBox(height: 20.h,),
              Text(getTranslated("age", context),style: AppTextStyles.w600.copyWith(
                  fontSize: 14,
                  color: ColorResources.blackColor
              ),),
              SizedBox(height: 10.h,),
              const CustomTextFormField(
                isEdit: false,
                label: true,
                hint: "25",
                read: true,
              ),
              SizedBox(height: 20.h,),
              Text(getTranslated("id_type", context),style: AppTextStyles.w600.copyWith(
                  fontSize: 14,
                  color: ColorResources.blackColor
              ),),
              SizedBox(height: 10.h,),
              const CustomTextFormField(
                isEdit: false,
                label: true,
                hint: "وطنية",
                read: true,
              ),
              SizedBox(height: 20.h,),
              Text(getTranslated("id_number", context),style: AppTextStyles.w600.copyWith(
                  fontSize: 14,
                  color: ColorResources.blackColor
              ),),
              SizedBox(height: 10.h,),
              const CustomTextFormField(
                isEdit: false,
                label: true,
                hint: "2021285569445",
                read: true,
              ),
              SizedBox(height: 20.h,),
              Text(getTranslated("religion", context),style: AppTextStyles.w600.copyWith(
                  fontSize: 14,
                  color: ColorResources.blackColor
              ),),
              SizedBox(height: 10.h,),
              const CustomTextFormField(
                isEdit: false,
                label: true,
                hint: "مسلم",
                read: true,
              ),
              SizedBox(height: 20.h,),
              Text(getTranslated("date_of_birth", context),style: AppTextStyles.w600.copyWith(
                  fontSize: 14,
                  color: ColorResources.blackColor
              ),),
              SizedBox(height: 10.h,),
              const CustomTextFormField(
                isEdit: false,
                label: true,
                hint: "14-2-1999",
                read: true,
              ),
              SizedBox(height: 20.h,),

            ],
          ),
        ),
      ),
    );
  }
}
