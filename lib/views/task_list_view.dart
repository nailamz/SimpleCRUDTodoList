import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mockupui/view_models/app_view_model.dart';
import 'package:provider/provider.dart';

class TaskListView extends StatelessWidget {
  const TaskListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewModel>(builder:(context, viewModel, child) {
      return Container(
        decoration: BoxDecoration(
          color: viewModel.clrLvl1,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30))
          ),
          child: ListView.separated(
            padding: EdgeInsets.all(15),
            separatorBuilder:(context, index) {
            return SizedBox(height: 15);
          }, 
          itemCount: viewModel.numTasks,
          itemBuilder:(context, index) {
            return Dismissible(
              key: UniqueKey(),
              onDismissed:(direction) {
                viewModel.deleteTask(index);
              },
              background: Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  color: Colors.red.shade300,
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Center(child: Icon(Icons.delete, color: Colors.red.shade700,)),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: viewModel.clrLvl5, 
                  borderRadius: BorderRadius.circular(20)),
                child: ListTile(
                  leading: Checkbox(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                      side: BorderSide(width: 2, color: viewModel.clrLvl3),
                      checkColor: viewModel.clrLvl4,
                      activeColor: viewModel.clrLvl1,
                      value: viewModel.getTaskValue(index),
                      onChanged:(value) {
                        viewModel.setTextValue(index, value!);
                      },
                  ),
                  title: Text(viewModel.getTaskTitle(index), 
                  style: TextStyle(color: viewModel.clrLvl1,
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                )),
              ),
            );
          },
        ));
    });
  }
}