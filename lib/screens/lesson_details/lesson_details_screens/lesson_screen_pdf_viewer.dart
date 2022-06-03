import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../../constants/colors.dart';
import '../../../constants/text_styles.dart';
import '../../../widgets/yellow_back_button.dart';
import '../lesson_details_controller.dart';

class LessonScreenPdfViewer extends StatelessWidget {
  static const routeName = '/lesson_screen_pdf_viewer';
  final LessonDetailsController controller = Get.find<LessonDetailsController>();

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: FCColors.gray100,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: FCColors.white,
          leading: YellowBackButton(),
          elevation: 1,
          title: Text(
            controller.getFileName(controller.selectedFileUrl),
            style: FATextStyles.headline,
          ),
        ),
        body: Container(
          child: SfPdfViewer.network(controller.selectedFileUrl),
        ),
      );
}
