import 'package:calculator_backend/calculator_backend.dart';

class CalcController extends ResourceController {
  @Operation.post('operation', 'left', 'right')
  Future<Response> calc(
    @Bind.path('operation') String operation,
    @Bind.path('left') double left,
    @Bind.path('right') double right,
  ) async {
    var result = 0.0;

    switch (operation) {
      case 'add':
        result = left + right;
        break;}
    switch (operation) {
      case 'sub':
        result = left - right;
        break;}
    switch (operation) {
     case 'mult':
        result = left * right;
        break;}
    switch (operation) {
      case 'div':
        result = left / right;
        break;}
      default:
        return Response.serverError();
    }

    return Response.ok(result.toString());
  }
}
