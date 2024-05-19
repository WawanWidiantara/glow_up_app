import 'package:get/get.dart';

import 'package:glow_up_app/app/modules/promethee/controllers/result_controller.dart';

import '../controllers/promethee_controller.dart';

class PrometheeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ResultController>(
      () => ResultController(),
    );
    Get.lazyPut<PrometheeController>(
      () => PrometheeController(),
    );
  }
}
