import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mockupui/view_models/app_view_model.dart';
import 'package:provider/provider.dart';

class TaskInfoView extends StatelessWidget {
  const TaskInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewModel>(builder:(context, viewModel, child) {
      return Container(
        margin: EdgeInsets.fromLTRB(15, 10, 15, 10),
        child: Row(
          children: [
            // Total Tasks
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  color: viewModel.clrLvl1, 
                  borderRadius: BorderRadius.circular(10)),
                  child: Column(children: [
                    Expanded(
                      flex: 2,
                      child: Align(
                        alignment: Alignment.center,
                        child: FittedBox(
                          child: Text("${viewModel.numTasks}", 
                          style: TextStyle(fontSize: 20, color: viewModel.clrLvl4, fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ), 
                    Expanded(
                      flex: 1,
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: FittedBox(
                          child: Text("Total Tasks", 
                          style: TextStyle(color: viewModel.clrLvl4, fontWeight: FontWeight.w600)),
                        ),
                      ),
                    ),
                  ]),
              ),
            ),
            SizedBox(width: 28),
      
            // Remaining
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  color: viewModel.clrLvl2, 
                  borderRadius: BorderRadius.circular(10)),
                  child: Column(children: [
                    Expanded(
                      flex: 2,
                      child: Align(
                        alignment: Alignment.center,
                        child: FittedBox(
                          child: Text("${viewModel.numTasksRemaining}", 
                          style: TextStyle(fontSize: 20, color: viewModel.clrLvl4, fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ), 
                    Expanded(
                      flex: 1,
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: FittedBox(
                          child: Text("Remaining", 
                          style: TextStyle(color: viewModel.clrLvl4, fontWeight: FontWeight.w600)),
                        ),
                      ),
                    ),
                  ]),
              ),
            ),
          ],
        ),
      );
    });
  }
}