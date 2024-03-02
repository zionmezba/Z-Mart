import 'package:flutter/material.dart';
import 'package:z_mart/common/styles/rounded_container.dart';
import 'package:z_mart/common/widgets/success_screen/success_screen.dart';
import 'package:z_mart/features/shop/screens/checkout/widgets/biling_amount_section.dart';
import 'package:z_mart/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:z_mart/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:z_mart/navigation_manu.dart';
import 'package:z_mart/utils/constants/colors.dart';
import 'package:z_mart/utils/constants/image_strings.dart';
import 'package:z_mart/utils/constants/sizes.dart%20';
import 'package:z_mart/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/products/cart/coupon_widget.dart';
import '../../../../utils/constants/text_strings.dart';
import '../cart/widgets/cart_items.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = ZHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: ZAppBar(
          showBackArrow: true,
          title: Text("Order Review",
              style: Theme.of(context).textTheme.headlineSmall)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ZSizes.defaultSpace),
          child: Column(
            children: [
              ///---Items
              const ZCartItems(showAddRmvButton: false),
              const SizedBox(height: ZSizes.spaceBtwSections),

              ///--- Coupons
              const ZCouponCode(),
              const SizedBox(height: ZSizes.spaceBtwSections),

              ///---Billing
              ZRoundedContainer(
                showBorder: true,
                padding: const EdgeInsets.all(ZSizes.md),
                backgroundColor: dark ? ZColors.black : ZColors.white,
                child: const Column(
                  children: [
                    ///Pricing
                    ZBillingAmountSection(),
                    SizedBox(height: ZSizes.spaceBtwItems),

                    ///Divider
                    Divider(),
                    SizedBox(height: ZSizes.spaceBtwItems),

                    ///Payment Method
                    ZBillingPaymentSection(),
                    SizedBox(height: ZSizes.spaceBtwSections),

                    ///Address
                    ZBillingAddressSection(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      ///Bottom nav checkout
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(ZSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () => Get.to(
            () => SuccessScreen(
              image: ZImages.successCheckoutImage,
              title: 'Order Success',
              subTitle: 'Your item will be shipped soon',
              onPressed: () => Get.offAll(() => const NavigationMenu()),
            ),
          ),
          child: const Text('Checkout ${ZTexts.currencyBDT}980'),
        ),
      ),
    );
  }
}
