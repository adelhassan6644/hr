import 'dart:developer';

import 'package:advance_pdf_viewer_fork/advance_pdf_viewer_fork.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../app/core/color_resources.dart';
import '../app/core/text_styles.dart';
import '../app/localization/language_constant.dart';
import '../main_providers/download_provider.dart';
import 'custom_app_bar.dart';

class CustomPDF extends StatefulWidget {
  final String url;

  const CustomPDF({Key? key, required this.url}) : super(key: key);

  @override
  State<CustomPDF> createState() => _CustomPDFState();
}

class _CustomPDFState extends State<CustomPDF> {
  PDFDocument? doc;

  bool _isLoading = true;
  bool _isError = false;
  getPdf() async {
    log("Hi ${widget.url}++ ${widget.url.split("/").last}");

    doc = await PDFDocument.fromURL(widget.url).catchError((e) {
      setState(() {
        _isLoading = false;
        _isError = true;
      });
    });
    setState(() => _isLoading = false);
  }

  @override
  void initState() {
    getPdf();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: getTranslated("salary_details", context),
          // actionChild: ChangeNotifierProvider(
          //   create: (_) => DownloadProvider(),
          //   child: Consumer<DownloadProvider>(builder: (_, provider, child) {
          //     return provider.isLoading
          //         ? const SizedBox(
          //             width: 30,
          //             child: CupertinoActivityIndicator(
          //               color: Styles.PRIMARY_COLOR,
          //             ),
          //           )
          //         : InkWell(
          //             onTap: () async {
          //               if (!provider.downloaded) {
          //                 provider.download(
          //                     widget.url, widget.url.split("/").last);
          //               }
          //             },
          //             child: Icon(
          //               provider.downloaded
          //                   ? Icons.check_circle_rounded
          //                   : Icons.save_alt_outlined,
          //               color: provider.downloaded
          //                   ? Styles.ACTIVE
          //                   : Styles.PRIMARY_COLOR,
          //             ),
          //           );
          //   }),
          // ),
        ),
        body: _isLoading
            ? const Center(
                child: CupertinoActivityIndicator(
                  color: Styles.PRIMARY_COLOR,
                ),
              )
            : _isError
                ? const Center(
                    child: Text(
                      "Error 404 !",
                      style: AppTextStyles.w500,
                    ),
                  )
                : PDFViewer(
                    document: doc!,
                    zoomSteps: 1,
                    showPicker: false,
                    showNavigation: false,
                  ));
  }
}
