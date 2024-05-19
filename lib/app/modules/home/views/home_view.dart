import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

import 'package:get/get.dart';
import 'package:glow_up_app/app/constans/colors.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Scaffold(
      backgroundColor: AppColors.mainBackground,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              width: Get.width,
              height: Get.height * 0.5,
              color: AppColors.primaryColor,
            ),
            Center(
              child: Container(
                  width: Get.width - 16,
                  height: Get.height * 0.8,
                  padding: const EdgeInsets.all(20),
                  child: Obx(
                    () => Flexible(
                      child: CardSwiper(
                        cardsCount: controller.cards.isEmpty
                            ? 2
                            : controller.cards.length,
                        cardBuilder: (context, index, percentThresholdX,
                                percentThresholdY) =>
                            controller.cards.isEmpty
                                ? Container(
                                    color: Colors.white,
                                    child: const Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  )
                                : controller.cards[index],
                      ),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
