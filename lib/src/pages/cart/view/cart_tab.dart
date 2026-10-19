import 'package:flutter/material.dart';
import 'package:get/get.dart';
// ignore: unused_import
import 'package:greengrocer/src/config/app_data.dart' as appData;
import 'package:greengrocer/src/config/custom_colors.dart';
// ignore: unused_import
import 'package:greengrocer/src/models/cart_item_model.dart';
import 'package:greengrocer/src/pages/cart/controller/cart_controller.dart';
// ignore: unused_import
import 'package:greengrocer/src/pages/cart/view/components/cart_tile.dart';
// ignore: unused_import
import 'package:greengrocer/src/pages/common_widgets/payement_dialog.dart';
import 'package:greengrocer/src/pages/orders/controller/all_orders_controller.dart';
import 'package:greengrocer/src/services/utils_services.dart';

class CartTab extends StatefulWidget {
  const CartTab({super.key});

  @override
  State<CartTab> createState() => _CartTabState();
}

class _CartTabState extends State<CartTab> {
  final UtilsServices utilsServices = UtilsServices();
  final cartController = Get.find<CartController>();

  double cartTotalPrice() {
    //double total = 0;
    //for (var item in appData.cartItems) {
    //total += item.totalPrice();
    //}

    //return total;
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Carrinho')),

      body: Column(
        children: [
          // Lista de itens do carrinho
          Expanded(
            child: GetBuilder<CartController>(
              builder: (controller) {
                if (controller.cartItems.isEmpty) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.remove_shopping_cart,
                        size: 40,
                        color: CustomColors.customSwatchColor,
                      ),
                      const Text('Nao ha items no carrinho'),
                    ],
                  );
                }
                return ListView.builder(
                  itemCount: controller.cartItems.length,
                  itemBuilder: (_, index) {
                    return CartTile(cartItem: controller.cartItems[index]);
                  },
                );
              },
            ),
          ),

          // Total e botao de concluir o pedido
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(30)),

              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: 3,
                  spreadRadius: 2,
                ),
              ],
            ),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text('Total geral', style: TextStyle(fontSize: 12)),

                GetBuilder<CartController>(
                  builder: (controller) {
                    return Text(
                      utilsServices.priceToCurrency(
                        controller.cartTotalPrice(),
                      ),
                      style: TextStyle(
                        fontSize: 23,
                        color: CustomColors.customSwatchColor,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  },
                ),

                SizedBox(
                  height: 50,
                  child: GetBuilder<CartController>(
                    builder: (controller) {
                      return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: CustomColors.customSwatchColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                        onPressed:
                            (controller.isCheckoutLoading ||
                                    controller.cartItems.isEmpty)
                                ? null
                                : () async {
                                  bool? result = await showOrderConfimation();

                                  if (result ?? false) {
                                    cartController.checkoutCart();

                                    // ✅ Atualiza a lista de pedidos
                                    final ordersController =
                                        Get.find<AllOrdersController>();
                                    await ordersController.getAllOrders();
                                  } else {
                                    utilsServices.showToast(
                                      message: 'Pedido nao conformado',
                                    );
                                  }
                                },
                        child:
                            controller.isCheckoutLoading
                                ? const CircularProgressIndicator()
                                : const Text(
                                  'Concluir pedido',
                                  style: TextStyle(fontSize: 18),
                                ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<bool?> showOrderConfimation() {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Text('Confirmacao'),
          content: const Text('Deseja realmente concluir o pedido ?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: const Text('Nao'),
            ),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: const Text('Sim'),
            ),
          ],
        );
      },
    );
  }
}
