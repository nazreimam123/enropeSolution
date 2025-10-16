import 'package:enrope/model/post_model.dart';
import 'package:enrope/services/api_services.dart';
import 'package:get/get.dart';

class PostController extends GetxController {
  final ApiServices _apiService = ApiServices();

  var posts = <post_model>[].obs;
  var isLoading = true.obs;

  Future<void> fetchPosts() async {
    try {
      isLoading(true);
      final data = await _apiService.fetchPosts();
      posts.assignAll(data);
    } catch (e) {
      throw Exception('Failed to load post');
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchPosts();
  }
}
