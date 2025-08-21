import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/controller/students_controller.dart';

class StudentInfoStep extends StatelessWidget {
  const StudentInfoStep({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StudentsController>(
      builder: (controller) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Information'),
            TextField(controller: controller.name),
          ],
        );
      },
    );
  }
}
