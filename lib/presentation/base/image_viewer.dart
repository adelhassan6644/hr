import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hr_project/app/core/utils/color_resources.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../app/core/api/end_points.dart';



class ImageViewer extends StatelessWidget {
  const ImageViewer({
     Key? key,
     this.image,
    this.isFromInternet = false,
  }) : super(key: key);

  final dynamic image;
  final bool isFromInternet;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: isFromInternet
          ? Center(
            child: CachedNetworkImage(
        imageUrl: EndPoints.baseUrl.replaceAll("api", "")+image,
                fit: BoxFit.fill,
        errorWidget: (context, image, error) {
            return const SizedBox();
        },
        placeholder: (context, placeholder) => Center(
            child: LoadingAnimationWidget.inkDrop(
              size: 20,
              color: ColorResources.PRIMARY,
            ),
        ),
      ),
          )
          : Image.file(image, fit: BoxFit.cover,),
    );
  }
}
