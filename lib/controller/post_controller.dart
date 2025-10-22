import 'package:enrope/model/post_model.dart';
import 'package:enrope/services/api_services.dart';
import 'package:get/get.dart';

class PostController extends GetxController {
  final ApiServices _apiService = ApiServices();

  var posts = <post_model>[].obs;
  RxBool isLoading = true.obs;

  Future<void> fetchusers() async {
    try {
      isLoading.value=true;
      final data = await _apiService.getUsers();
      posts.assignAll(data);
    } catch (e) {
      throw Exception('Failed to load post');
    } finally {
      isLoading.value=false;
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchusers();
  }
}
