import 'package:get/get.dart';
import 'package:greengrocer/src/models/order_model.dart';
import 'package:greengrocer/src/pages/auth/controller/auth_controller.dart';
import 'package:greengrocer/src/pages/orders/orders_result/orders_result.dart';
import 'package:greengrocer/src/pages/orders/repository/order_repository.dart';
import 'package:greengrocer/src/services/utils_services.dart';

class AllOrdersController extends GetxController {
  List<OrderModel> allOrders = [];
  final ordersRespository = OrderRepository();
  final authContoller = Get.find<AuthController>();
  final utilServices = UtilsServices();

  @override
  void onInit() {
    super.onInit();

    getAllOrders();
  }

  Future<void> getAllOrders() async {
    OrdersResult<List<OrderModel>> result = await ordersRespository
        .getAllOrders(
          userId: authContoller.user.id!,
          token: authContoller.user.token!,
        );

    result.when(
      success: (orders) {
        allOrders = orders;
        update();
      },
      error: (mesage) {
        utilServices.showToast(message: mesage, isError: true);
      },
    );
  }
}
