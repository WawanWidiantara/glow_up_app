import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:glow_up_app/app/constans/colors.dart';
import 'package:glow_up_app/app/modules/home/views/home_view.dart';
import 'package:glow_up_app/app/modules/promethee/views/promethee_view.dart';
import 'package:transitioned_indexed_stack/transitioned_indexed_stack.dart';

import '../controllers/navbar_controller.dart';

class NavbarView extends GetView<NavbarController> {
  const NavbarView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavbarController>(builder: (controller) {
      return Scaffold(
        body: FadeIndexedStack(
          beginOpacity: 0.0,
          endOpacity: 1.0,
          curve: Curves.easeInOut,
          duration: const Duration(milliseconds: 200),
          index: controller.tabIndex,
          children: const [
            HomeView(),
            PrometheeView(),
          ],
        ),
        bottomNavigationBar: Theme(
          data: ThemeData(
            splashColor: Colors.transparent,
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            enableFeedback: true,
            backgroundColor: AppColors.mainBackground,
            selectedItemColor: AppColors.primaryBlack,
            unselectedItemColor: AppColors.greyText,
            selectedFontSize: 12,
            onTap: controller.changeTabIndex,
            currentIndex: controller.tabIndex,
            showUnselectedLabels: false,
            showSelectedLabels: true,
            selectedLabelStyle: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Product',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.star),
                label: 'Recomendation',
              ),
            ],
          ),
        ),
      );
    });
  }
}
