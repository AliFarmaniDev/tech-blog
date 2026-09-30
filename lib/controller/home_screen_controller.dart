// create a controller for home screen
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:get/get.dart';
import 'package:tech_blog/components/api_constant.dart';
import 'package:tech_blog/models/article_modle.dart';
import 'package:tech_blog/models/podcast_model.dart';
import 'package:tech_blog/models/poster_model.dart';
import 'package:tech_blog/services/dio_service.dart';

class HomeScreenController extends GetxController {
  // create a method to fetch home items from API
  late Rx<PosterModel> poster;
  RxList tgasList = RxList();
  RxList<ArticleModel> topVisitedList = RxList();
  RxList<PodcastModel> topPodcastsList = RxList();
  final RxBool isLoading = true.obs;
  final RxnString errorMessage = RxnString();

  @override
  void onInit() {
    super.onInit();
    getHomeItems();
  }

  Future<void> getHomeItems() async {
    isLoading.value = true;
    errorMessage.value = null;

    try {
      final response = await DioService().getMethod(ApiConstant.getHomeItems);
      if (response.statusCode != 200) {
        errorMessage.value = 'پاسخ نامعتبر از سرور';
        return;
      }

      final data = response.data as Map<String, dynamic>;
      topVisitedList.assignAll(
        (data['top_visited'] as List<dynamic>).map(
          (element) => ArticleModel.fromJson(element as Map<String, dynamic>),
        ),
      );
      topPodcastsList.assignAll(
        (data['top_podcasts'] as List<dynamic>).map(
          (element) => PodcastModel.fromJson(element as Map<String, dynamic>),
        ),
      );
    } on DioException {
      errorMessage.value = kIsWeb
          ? 'مرورگر دسترسی به پاسخ را مسدود کرد؛ تنظیمات CORS سرور را بررسی کنید.'
          : 'اتصال به سرور ناموفق بود؛ اینترنت را بررسی و دوباره تلاش کنید.';
    } catch (_) {
      errorMessage.value = 'ساختار داده دریافتی از سرور نامعتبر است.';
    } finally {
      isLoading.value = false;
    }
  }
}
