import 'package:get/get.dart';
import 'package:meowdify/core/utilities/general.dart';

class MusicManagementRepo extends GetConnect {
  @override
  void onInit() {
    // TODO: implement onInit
    httpClient.baseUrl = "http://127.0.0.1:3000";
    super.onInit();
  }

  getUserMusic(String id) async {
    final response = await post("/get_user_music", {"_id": id});
    return errorCheck("get user music", response);
  }
}
