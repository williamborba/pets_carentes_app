part of 'router.dart';

class MainRouterBindings implements Bindings {
  @override
  Future<void> dependencies() async {
    Get.put<CoreLocationService>(CoreLocationService());
  }
}
