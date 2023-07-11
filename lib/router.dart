import 'package:get/get.dart';
import 'package:pets_carentes_app/modules/home/index.dart';

import 'core/index.dart';

part 'router_bindings.dart';

class MainRouter {
  static HomeRouter homeRouter = const HomeRouter();

  static List<GetPage<dynamic>>? routes() {
    return [
      ...homeRouter.routes(),
    ];
  }
}
