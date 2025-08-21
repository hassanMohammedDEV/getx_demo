import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/controller/students_controller.dart';
import 'package:getx_demo/ui/widgets/student_address_step.dart';
import 'package:getx_demo/ui/widgets/student_info_step.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<StudentsController>(
      init: StudentsController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              controller.step == 0 ? 'Students Info' : 'Students Address',
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                if (controller.isLoading) ...[
                  Expanded(
                    child: const Center(
                      child: CircularProgressIndicator(color: Colors.black),
                    ),
                  ),
                ] else ...[
                  Expanded(
                    child: IndexedStack(
                      index: controller.step,
                      children: [StudentInfoStep(), StudentAddressStep()],
                    ),
                  ),
                ],
                ElevatedButton(
                  onPressed: () async {
                    if (controller.step == 0) {
                      await controller.goToNextPage();
                    } else {
                      await controller.getPrevious();
                    }
                  },
                  child: Text(controller.step == 0 ? 'Next' : 'Previous'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
