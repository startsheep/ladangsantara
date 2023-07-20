import 'package:get/get.dart';
import 'package:ladangsantara/app/models/store_model.dart';
import 'package:ladangsantara/app/providers/store_provider.dart';
import 'package:ladangsantara/app/services/location_service.dart';

class StoreIndexController extends GetxController with StateMixin {
  //TODO: Implement StoreIndexController
  final storeProvider = Get.find<StoreProvider>();
  RxList<StoreModel> stores = <StoreModel>[].obs;
  final locationService = Get.find<LocationService>();
  @override
  void onInit() {
    super.onInit();
    getStores();
  }

  Future<void> getStores() async {
    try {
      final response = await storeProvider.getStores();
      if (response.body['status'] == "SUCCESS") {
        if (response.body['data'].isEmpty) {
          change(stores, status: RxStatus.empty());
          return;
        }
        print("store json${response.body['data']}");
        stores.assignAll(response.body['data']);
        change(stores, status: RxStatus.success());
      }
    } catch (e) {
      print("error get store: $e");
    }
  }

  Future<double> getDistance({
    required double endLatitude,
    required double endLongitude,
  }) async {
    await locationService.getCurrentPosition();
    return locationService.calculateDistanceWithGoogleMapsAPI(
      startLatitude: 37.4219983,
      startLongitude: 102.084,
      endLatitude: endLatitude,
      endLongitude: endLongitude,
    );
  }
}
