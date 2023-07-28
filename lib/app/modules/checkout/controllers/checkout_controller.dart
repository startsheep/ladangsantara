import 'package:get/get.dart';
import 'package:ladangsantara/app/models/address_model.dart';
import 'package:ladangsantara/app/models/order_modell.dart';
import 'package:ladangsantara/app/modules/checkout/controllers/order_address_controller.dart';
import 'package:ladangsantara/app/modules/payment/views/payment_code_view.dart';
import 'package:ladangsantara/app/providers/order_provider.dart';

class CheckoutController extends GetxController {
  //TODO: Implement CheckoutControlle
  final OrderAddressController orderAddressController =
      Get.find<OrderAddressController>();
  Rx<AddressModel?> currentAddress = Rx<AddressModel?>(null);
  Rx<OrderModel> order = OrderModel().obs;
  final orderProvider = Get.find<OrderProvider>();

  @override
  void onInit() {
    super.onInit();
    orderAddressController.getAddress();
    currentAddress.value = orderAddressController.selectedAddress.value;
    ever(orderAddressController.selectedAddress, (callback) {
      currentAddress.value = callback as AddressModel?;
    });
    order.value = Get.arguments;
  }

  Future<void> createOrder() async {
    print(order.value.forCreate());
    try {
      final response = await orderProvider.createOrder(order: order.value);
      print("response create order: ${response.body}");
      if (response.body['status'] == 'SUCCESS') {
        // Get.offAllNamed('/order');
        Get.to(() => const PaymentCodeView());
      }
    } catch (e) {
      print(e);
    }
  }
}
