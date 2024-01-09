import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:external_path/external_path.dart';
import 'package:flutter/cupertino.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';

import '../app/core/app_snack_bar.dart';
import '../app/localization/language_constant.dart';
import '../components/loading_dialog.dart';
import '../helpers/permission_handler.dart';
import '../navigation/custom_navigation.dart';

class DownloadProvider extends ChangeNotifier {
  final Dio _dio = Dio();

  bool isLoading = false;
  bool downloaded = false;
  void download(url, name, {bool withDialog = true}) async {
    await PermissionHandler.checkFilePermission();
    {
      if (withDialog) {
        loadingDialog();
      }
      isLoading = true;
      notifyListeners();

      String path = "";
      if (Platform.isAndroid) {
        path =
            '${await ExternalPath.getExternalStoragePublicDirectory(ExternalPath.DIRECTORY_DOCUMENTS)}/يسربلس.$name';
      } else {
        Directory documents = await getApplicationDocumentsDirectory();
        path = '${documents.path}/يسربلس.$name';
      }

      try {
        log(path);
        log(url);

        Response response = await _dio.download(
          url ?? "",
          path,
          onReceiveProgress: (v1, v2) {
            if (v2.abs() >= 100) {
              downloaded = true;
            }
          },
          options: Options(
            headers: {
              HttpHeaders.acceptEncodingHeader: "*",
            },
          ),
        );
        if (withDialog) {
          CustomNavigator.pop();
        }

        // if (response.statusCode == 200) {
        //   downloaded = true;
        // } else {
        //   downloaded = false;
        // }

        await OpenFilex.open(path);

        isLoading = false;
        notifyListeners();
      } catch (e) {
        log(e.toString());
        showToast(getTranslated("something_went_wrong",
            CustomNavigator.navigatorState.currentContext!));
        isLoading = false;
        notifyListeners();
      }
      if (withDialog) {
        CustomNavigator.pop();
      }
    }
  }
}
