import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:glow_up_app/app/constans/colors.dart';
import 'package:glow_up_app/app/modules/promethee/controllers/promethee_controller.dart';
import 'package:glow_up_app/app/modules/promethee/views/result_view.dart';

class QnaView extends GetView {
  const QnaView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PrometheeController());
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        title: Obx(() => Text(
              '${controller.count.value}/2 Pertanyaan',
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w700),
            )),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 0,
                      blurRadius: 10,
                      offset: const Offset(0, 5))
                ]),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Obx(() => Text(
                              '${controller.questions[controller.count.value - 1]}',
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                              ),
                            )),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Obx(() => ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount:
                          controller.answers[controller.count.value - 1].length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: SizedBox(
                            height: 45,
                            child: ElevatedButton(
                              onPressed: () {
                                controller.insertAnswer(
                                    controller.sub[controller.count.value - 1],
                                    controller
                                            .answers[controller.count.value - 1]
                                        [index]);
                                controller.current.value = index;
                                controller
                                    .increment(controller.questions.length);
                                print(controller.userInput);
                                if (controller.userInput.length == 2) {
                                  Get.off(ResultView(),
                                      arguments: controller.userInput);
                                }
                              },
                              style: ButtonStyle(
                                shadowColor: const MaterialStatePropertyAll(
                                    Colors.transparent),
                                backgroundColor: const MaterialStatePropertyAll(
                                    AppColors.mainBackground),
                                shape: MaterialStatePropertyAll<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        side: const BorderSide(
                                            color: AppColors.greyText,
                                            width: 1),
                                        borderRadius:
                                            BorderRadius.circular(20))),
                                overlayColor:
                                    MaterialStateProperty.resolveWith<Color?>(
                                  (Set<MaterialState> states) {
                                    if (states
                                        .contains(MaterialState.pressed)) {
                                      return AppColors.primaryColor;
                                    }
                                    return null;
                                  },
                                ),
                                foregroundColor:
                                    MaterialStateProperty.resolveWith<Color?>(
                                  (Set<MaterialState> states) {
                                    if (states
                                        .contains(MaterialState.pressed)) {
                                      return AppColors.mainBackground;
                                    }
                                    return AppColors.greyText;
                                  },
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    controller
                                            .answers[controller.count.value - 1]
                                        [index],
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      })),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
