import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mockupui/views/bottomsheets/addtaskbottomsheetview.dart';
import 'package:provider/provider.dart';

import '../view_models/app_view_model.dart';

class AddTaskView extends StatelessWidget {
  const AddTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewModel>(builder:(context, viewModel, child) {
      return SizedBox(
        height: 60,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: viewModel.clrLvl3,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
          ),
          onPressed: () {
            HapticFeedback.heavyImpact();
            viewModel.bottomSheetBuilder(
              const AddTaskBottomSheetView(), context);
          },
          child: Icon(
            Icons.add, 
            size: 30,
        )),
      );
    });
  }
}