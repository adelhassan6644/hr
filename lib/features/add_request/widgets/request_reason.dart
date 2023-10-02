import 'package:flutter/cupertino.dart';
import 'package:yusrPlus/app/core/extensions.dart';
import 'package:yusrPlus/app/localization/language_constant.dart';
import '../../../app/core/images.dart';
import '../../../components/custom_expansion_tile.dart';
import '../../../components/custom_image_picker_widget.dart';
import '../../../components/custom_text_form_field.dart';

class RequestReason extends StatelessWidget {
  const RequestReason({Key? key, required this.reasonController})
      : super(key: key);
  final TextEditingController reasonController;
  @override
  Widget build(BuildContext context) {
    return CustomExpansionTile(
      title: getTranslated("reason", context),
      children: [
        CustomTextFormField(
          pAssetIcon: Images.question,
          hint: getTranslated("reason", context),
          controller: reasonController,
        ),
        SizedBox(
          height: 16.h,
        ),
        CustomButtonImagePicker(
          title: getTranslated("attachment", context),
          onTap: () async {
            // var _image = await ImagePicker().pickImage(source: ImageSource.gallery);
          },
        )
      ],
    );
  }
}
