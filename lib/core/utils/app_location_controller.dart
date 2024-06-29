//import 'package:exam/core/model/account.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:travel/core/model/account.dart';
import '../utils/app_account_controller.dart';
import '../model/post.dart';
import '../network/network_requestlocation.dart';

class LocationController extends GetxController {
  RxList<Post> posts = RxList<Post>();
  RxList<Account> accounts = RxList<Account>();
  RxBool checkLogin = false.obs;
  var isLoading = false.obs;
  var location = Post().obs;
  var account = Account().obs;
  RxString userId = ''.obs;
  RxList<Account> favoriteResults = RxList<Account>();
  RxList<Post> searchResults = RxList<Post>();
  RxList<Post> categoryResults = RxList<Post>();

  @override
  void onInit() {
    super.onInit();
    getPosts();
    // getFavorite();
  }

  void setLocation(Post newLocation) {
    location.value = newLocation;
    print(location.value);
  }

  Future<void> getPosts() async {
    isLoading.value = true;
    try {
      var response = await dataServices().getPosts();
      if (response is List<Post>) {
        posts.addAll(response);
      }
    } catch (e) {
      print('Error fetching posts: $e');
    } finally {
      isLoading.value = false;
    }
  }

  void searchLocations(String query) {
    if (query.isEmpty) {
      searchResults.value = [];
    } else {
      searchResults.value = posts.where((location) {
        final lowerQuery = query.toLowerCase();
        return (location.category?.toLowerCase().contains(lowerQuery) ??
                false) ||
            (location.title?.toLowerCase().contains(lowerQuery) ?? false) ||
            (location.location?.toLowerCase().contains(lowerQuery) ?? false);
      }).toList();
      print(searchResults);
    }
  }

  List<Post> getPostsBySchedule(List<Schedule> schedules) {
    final scheduleIds = schedules.expand((s) => s.id ?? []).toList();
    return posts.where((post) => scheduleIds.contains(post.id)).toList();
  }

  void categoryLocations(String category) {
    categoryResults.value = [];
    categoryResults.value = posts.where((location) {
      final lowerQuery = category.toLowerCase();
      return (location.location?.toLowerCase().contains(lowerQuery) ?? false);
    }).toList();
    // print(searchResults);
  }
}
