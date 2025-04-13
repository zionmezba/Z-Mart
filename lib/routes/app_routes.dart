import 'package:get/get.dart';
import 'package:z_mart/features/authentication/screens/login/login.dart';
import 'package:z_mart/features/authentication/screens/onboarding/onboarding.dart';
import 'package:z_mart/features/authentication/screens/password_config/forgot_password.dart';
import 'package:z_mart/features/authentication/screens/signup/signup.dart';
import 'package:z_mart/features/authentication/screens/signup/verify_email.dart';
import 'package:z_mart/features/personalization/screens/address/address.dart';
import 'package:z_mart/features/personalization/screens/profile/profile.dart';
import 'package:z_mart/features/personalization/screens/settings/settings.dart';
import 'package:z_mart/features/shop/screens/cart/cart.dart';
import 'package:z_mart/features/shop/screens/checkout/checkout.dart';
import 'package:z_mart/features/shop/screens/home/home.dart';
import 'package:z_mart/features/shop/screens/order/order.dart';
import 'package:z_mart/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:z_mart/features/shop/screens/store/store.dart';
import 'package:z_mart/features/shop/screens/wishlist/wishlist.dart';
import 'package:z_mart/routes/routes.dart';

class AppRoutes {
  static final pages = [
    GetPage(name: ZRoutes.home, page: () => const HomeScreen()),
    GetPage(name: ZRoutes.store, page: () => const StoreScreen()),
    GetPage(name: ZRoutes.favourites, page: () => const FavouriteScreen()),
    GetPage(name: ZRoutes.settings, page: () => const SettingsScreen()),
    GetPage(name: ZRoutes.productReviews, page: () => const ProductReviewsScreen()),
    GetPage(name: ZRoutes.order, page: () => const OrderScreen()),
    GetPage(name: ZRoutes.checkout, page: () => const CheckoutScreen()),
    GetPage(name: ZRoutes.cart, page: () => const CartScreen()),
    GetPage(name: ZRoutes.userProfile, page: () => const ProfileScreen()),
    GetPage(name: ZRoutes.userAddress, page: () => const UserAddressScreen()),
    GetPage(name: ZRoutes.signup, page: () => const SignupScreen()),
    GetPage(name: ZRoutes.verifyEmail, page: () => const VerifyEmailScreen()),
    GetPage(name: ZRoutes.signIn, page: () => const LoginScreen()),
    GetPage(name: ZRoutes.forgetPassword, page: () => const ForgotPasswordScreen()),
    GetPage(name: ZRoutes.onBoarding, page: () => const OnBoardingScreen()),
  ];
}
