import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yusrPlus/components/loader_view.dart';
import 'package:yusrPlus/features/request_details/widget/request_details_widget.dart';

import '../../../app/localization/language_constant.dart';
import '../../../components/custom_app_bar.dart';
import '../../../data/config/di.dart';
import '../provider/request_details_provider.dart';
import '../repo/request_details_repo.dart';

class RequestDetails extends StatefulWidget {
  final int id;
  const RequestDetails({super.key, required this.id});

  @override
  State<RequestDetails> createState() => _RequestDetailsState();
}

class _RequestDetailsState extends State<RequestDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "${getTranslated("request", context)} #${widget.id}",
      ),
      body: ChangeNotifierProvider(
        create: (_) => RequestDetailsProvider(repo: sl<RequestDetailsRepo>())
          ..getRequestDetails(widget.id),
        child: Consumer<RequestDetailsProvider>(builder: (_, provider, child) {
          return Column(
            children: [
              provider.isLoading
                  ? const LoaderView()
                  : RequestDetailsWidget(
                      request: provider.model,
                    )
            ],
          );
        }),
      ),
    );
  }
}
