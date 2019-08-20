import 'package:calculator_backend/calculator_backend.dart';

class PingValidationController extends Controller {
  @override
  FutureOr<RequestOrResponse> handle(Request request) {
    if (request.body == null) {
      return Response.badRequest(body: 'Bad request!');
    }

    return request;
  }
}

class PingController extends Controller {
  @override
  FutureOr<RequestOrResponse> handle(Request request) {
    return Response.ok('Everything is OK!')..contentType = ContentType.text;
  }
}
