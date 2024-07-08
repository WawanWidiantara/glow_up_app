import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:glow_up_app/app/constans/colors.dart';
import 'package:glow_up_app/app/modules/promethee/views/qna_view.dart';

import '../controllers/promethee_controller.dart';

class PrometheeView extends GetView<PrometheeController> {
  const PrometheeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  width: 250,
                  height: 250,
                  child: Image.asset(
                    "assets/images/illustration.png",
                  )),
              SizedBox(
                height: 16,
              ),
              Text(
                'Rekomendasi Skincare Personal Anda Menanti',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                'Temukan produk skincare terbaik yang cocok dengan preferensi Anda dan nikmati kulit yang lebih sehat.',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    onPressed: () {
                      Get.to(() => QnaView());
                      FocusScope.of(context).unfocus();
                    },
                    child: Text("Cari Rekomendasi",
                        style: TextStyle(
                            color: AppColors.mainBackground,
                            fontSize: 14,
                            fontWeight: FontWeight.bold))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
