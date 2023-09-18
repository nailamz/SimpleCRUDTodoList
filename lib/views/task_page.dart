import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mockupui/views/add_task_view.dart';
import 'package:mockupui/views/header_view.dart';
import 'package:mockupui/views/task_info_view.dart';
import 'package:mockupui/views/task_list_view.dart';

class TaskPage extends StatelessWidget {
  const TaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            // Header view
              Expanded(
                flex: 1,
                child: HeaderView()
              ),

            // Task info view
              Expanded(
                flex: 1,
                child: TaskInfoView()
              ),

            // Task List View
              Expanded(
                flex: 7,
                child: TaskListView()
              ),
          ],
        ),
      ),
      floatingActionButton: const AddTaskView());
  }
}