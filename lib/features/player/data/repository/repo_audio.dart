import 'package:get/get.dart';
import 'package:meowdify/core/utilities/general.dart';

class AudioRepository extends GetConnect {
  @override
  onInit() {
    httpClient.baseUrl = "http://127.0.0.1/";
    super.onInit();
  }

  Future<Response> getQueue(String id) async {
    final response = await post("/get_queue", {"id": id});

    return errorCheck("get_queue", response);
  }
}
