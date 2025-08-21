import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/controller/students_controller.dart';

class StudentAddressStep extends StatelessWidget {
  const StudentAddressStep({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StudentsController>(
      builder: (controller) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Address'),
            TextField(controller: controller.address),
          ],
        );
      },
    );
  }
}
