import 'package:get/get.dart';
import 'package:meowdify/core/utilities/general.dart';

class ProfileRepository extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = "http://127.0.0.1:3000";
    super.onInit();
  }

  Future<Response> getUserProfile(String userid) async {
    Response response = await post("/get_user_profile", {"id": userid});
    return errorCheck("get user profile", response);
  }

  Future<Response> getUserHistory(String userid) async {
    Response response = await post("/get_user_history", {"id": userid});
    return errorCheck("get user history", response);
  }

  Future<Response> getUserInteractionInfo(String userid) async {
    Response response =
        await post("/get_user_interaction_info", {"id": userid});
    return errorCheck("get user history", response);
  }

  Future<Response> getUserMusic(String userid) async {
    Response response = await post("/get_user_music", {"id": userid});
    return errorCheck("get user history", response);
  }
}
