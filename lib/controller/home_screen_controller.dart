// create a controller for home screen
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
  RxList<ArticleModel> topVisited = RxList();
  RxList<PodcastModel> topPodcasts = RxList();

  @override
  void onInit() {
    super.onInit();
    getHomeItems();
  }

  void getHomeItems() async {
    var responce = await DioService().getMethod(ApiConstant.getHomeItems);

    if (responce.statusCode == 200) {
      responce.data["top_visited"].forEach((element) {
        topVisited.add(ArticleModel.fromJson(element));
      });
    }
  }
}
