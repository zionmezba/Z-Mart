import 'package:get/get.dart';
import 'package:z_mart/utils/helpers/network_manager.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    //implement dependencies
    Get.put(NetworkManager());
  }
}
