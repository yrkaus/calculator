import 'package:calculator_backend/calc_controller.dart';
import 'package:calculator_backend/ping_controller.dart';

import 'calculator_backend.dart';

class CalculatorBackendChannel extends ApplicationChannel {
  @override
  Future prepare() async {
    logger.onRecord.listen(
        (rec) => print("$rec ${rec.error ?? ""} ${rec.stackTrace ?? ""}"));
  }

  @override
  Controller get entryPoint {
    final router = Router();

    router.route("/example").linkFunction((request) async {
      return Response.ok({"key": "value value 2"});
    });

    router
        .route('/ping')
        .link(() => PingValidationController())
        .link(() => PingController());

    router.route('/calc/:operation/:left/:right').link(() => CalcController());

    return router;
  }
}
