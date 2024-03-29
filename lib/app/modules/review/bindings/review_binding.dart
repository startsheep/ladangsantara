import 'package:get/get.dart';
import 'package:ladangsantara/app/common/input/xpicker_image.dart';
import 'package:ladangsantara/app/modules/review/controllers/create_review_controller.dart';
import 'package:ladangsantara/app/modules/review/controllers/form_review_controller.dart';
import 'package:ladangsantara/app/providers/review_provider.dart';

import '../controllers/review_controller.dart';

class ReviewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FormReviewController>(
      () => FormReviewController(),
    );
    Get.lazyPut<CreateReviewController>(
      () => CreateReviewController(),
    );
    Get.lazyPut<ReviewController>(
      () => ReviewController(),
    );
    Get.lazyPut<FormReviewController>(() => FormReviewController());
    Get.lazyPut<PickerController>(() => PickerController());
    Get.lazyPut<ReviewProvider>(() => ReviewProvider());
  }
}
