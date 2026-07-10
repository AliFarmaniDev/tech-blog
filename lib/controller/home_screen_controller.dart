// create a controller for home screen
import 'package:get/get.dart';
import 'package:tech_blog/components/api_constant.dart';
import 'package:tech_blog/models/poster_model.dart';
import 'package:tech_blog/services/dio_service.dart';

class HomeScreenController extends GetxController {
  // create a method to fetch home items from API
  late Rx<PosterModel> poster;
  RxList tgasList = RxList();
  RxList topVisited = RxList();
  RxList topPodcasts = RxList();

  getHomeItems() async {
    var responce = await DioService().getMethod(ApiConstant.getHomeItems);
    responce.data['poster'];
    responce.data['top_visited'];
    responce.data['top_podcasts'];
  }
}
