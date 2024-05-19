import 'package:get/get.dart';

class PrometheeController extends GetxController {
  List<String> questions = [
    "Apakah Harga Produk Skincare Penting bagi Anda?",
    "Apa Jenis Kulit Anda?",
  ];

  List<String> sub = ["price_preference", "skin_type_preference"];

  List<String> answers1 = [
    "Tentu saja",
    "Harga bukanlah faktor utama",
  ];

  List<String> answers2 = [
    "Kulit Kering",
    "Kulit Berminyak",
    "Kulit Normal",
    "Kulit Sensitif",
    "Kulit Kombinasi",
  ];

  List answers = [];

  var userInput = {}.obs;

  final count = 1.obs;
  final current = 0.obs;
  @override
  void onInit() {
    super.onInit();
    answers.add(answers1);
    answers.add(answers2);
    update();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment(batas) {
    if (count.value < batas) {
      count.value++;
    }
  }

  void insertAnswer(String sub, String answer) {
    this.userInput[sub] = answer;
  }
}
