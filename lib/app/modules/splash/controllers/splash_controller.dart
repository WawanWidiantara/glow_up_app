import 'package:get/get.dart';
import 'package:glow_up_app/app/routes/app_pages.dart';

class SplashController extends GetxController {
  //TODO: Implement SplashController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAllNamed(Routes.NAVBAR);
      // apply animated transition
    });
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
