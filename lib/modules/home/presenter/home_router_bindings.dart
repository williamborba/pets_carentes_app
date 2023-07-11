part of 'home_router.dart';

class HomeBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<PetService>(HttpPetService());
  }
}
