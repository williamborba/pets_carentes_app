import 'package:get/get.dart';
import 'package:pets_carentes_app/modules/pet/index.dart';

import 'pages/index.dart';

part 'home_router_bindings.dart';

class HomeRouter {
  const HomeRouter();

  final String home = '/home';

  List<GetPage<dynamic>> routes() {
    return [
      GetPage(
        name: home,
        page: () => const HomePage(),
        binding: HomeBindings(),
      ),
    ];
  }
}
