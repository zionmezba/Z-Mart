import 'package:flutter/material.dart';
import 'package:z_mart/common/widgets/appbar/appbar.dart';
import 'package:z_mart/features/shop/screens/order/widgets/order_list.dart';
import 'package:z_mart/utils/constants/sizes.dart%20';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ZAppBar(
        showBackArrow: true,
          title: Text('My Orders',
              style: Theme.of(context).textTheme.headlineSmall)),
    body: const Padding(
      padding: EdgeInsets.all(ZSizes.defaultSpace),

      ///Orders
      child: ZOrderListItems(),
    ),
    );
  }
}
