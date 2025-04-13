import 'package:get/get.dart';
import 'package:z_mart/data/repositories/banners/banner_repository.dart';
import 'package:z_mart/features/shop/models/banner_model.dart';

import '../../../common/widgets/loaders/loaders.dart';

class BannerController extends GetxController {
  final carousalCurrentIndex = 0.obs;
  final isLoading = false.obs;
  RxList<BannerModel> allBanners = <BannerModel>[].obs;

  @override
  void onInit() {
    fetchBanners();
    super.onInit();
  }

  void updatePageIndicator(index) {
    carousalCurrentIndex.value = index;
  }

  /// -- Load Category data
  Future<void> fetchBanners() async {
    try {
      ///Show loader while loading
      isLoading.value = true;

      ///Fetch Banners from firebase
      final bannerRepo = Get.put(BannerRepository());
      final banners = await bannerRepo.fetchBanners();

      ///Assign Banners
      allBanners.assignAll(banners);

      ///filter featured cats
    } catch (e) {
      ZLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      //   Remove loader
      isLoading.value = false;
    }
  }
}
