import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mockupui/view_models/app_view_model.dart';
import 'package:mockupui/views/bottomsheets/deletebottomsheetview.dart';
import 'package:mockupui/views/bottomsheets/settingsbottomsheetview.dart';
import 'package:provider/provider.dart';

class HeaderView extends StatelessWidget {
  const HeaderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewModel>(builder:(context, viewModel, child) {
      return Container(
        // color: viewModel.clrLvl2,
        child: Row(children: [
          Expanded(
            flex: 3,
            child: Container(
              margin: EdgeInsets.only(left: 15),
              child: Column(children: [
                Expanded(
                  flex: 1,
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: FittedBox(
                      fit: BoxFit.fitHeight,
                      child: Text("Welcome back,", 
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: viewModel.clrLvl2)),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: FittedBox(
                      fit: BoxFit.fitHeight,
                      child: Text(viewModel.username, 
                      style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: viewModel.clrLvl2)),
                    ),
                  ),
                )
              ],
                    ),
            )),
      
          // Trash
          Expanded(
            flex: 1,
            child: InkWell(
              onTap: () {
                viewModel.bottomSheetBuilder(DeleteBottomSheetView(), context);
              },
              child: Icon(Icons.delete, color: viewModel.clrLvl1, size: 32,))),
          
          // Setting
          Expanded(
            flex: 1,
            child: InkWell(
              onTap: () {
                HapticFeedback.mediumImpact();
                      viewModel.bottomSheetBuilder(
                          SettingsBottomSheetView(), context);
              },
              child: Icon(Icons.edit, color: viewModel.clrLvl1, size: 32,))),
        ],
        ),
      );
    });
  }
}