import 'package:flutter/cupertino.dart';
import 'package:hr_project/app/core/extensions.dart';
import '../../../app/core/color_resources.dart';
import '../../../app/core/dimensions.dart';
import '../../../app/core/images.dart';
import '../../../app/core/text_styles.dart';
import '../../../app/localization/language_constant.dart';
import '../../../components/custom_image_picker_widget.dart';
import '../../../components/custom_text_form_field.dart';

class RequestReason extends StatelessWidget {
  const RequestReason({Key? key,required  this.reasonController}) : super(key: key);
  final TextEditingController reasonController;
  @override
  Widget build(BuildContext context) {
    return  Container(
      padding:  EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_DEFAULT.w,
          vertical:Dimensions.PADDING_SIZE_DEFAULT.h ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.w),
          border: Border.all(
              color: ColorResources.BORDER_COLOR,
              width: 0.5,
              style: BorderStyle.solid
          )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 5.w,),
            child: Text(
              getTranslated("reason", context),
              style: AppTextStyles.w600.copyWith(
                fontSize: 16.0,
              ),
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
          CustomTextFormField(
            tIcon: Images.question,
            removePIcon: false,
            sIcon:Images.question ,
            tIconColor: ColorResources.hintColor,
            hint:getTranslated("reason", context) ,
            controller: reasonController,
            label: true,
          ),
          SizedBox(
            height: 16.h,
          ),
          CustomButtonImagePicker(
            title:getTranslated("attachment", context) ,
            onTap: () async {

              // var _image = await ImagePicker().pickImage(source: ImageSource.gallery);

            },
          )
        ],
      ),
    );
  }
}
