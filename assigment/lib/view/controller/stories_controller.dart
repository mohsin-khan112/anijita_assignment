import 'package:assigment/constant/app_images_path.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StoriesController extends GetxController {
  RxList<SliderImageList> sliderImageList = <SliderImageList>[].obs;
  RxList<ImageList> everyDayStoriesDataList = <ImageList>[].obs;
  RxList<FavouriteListData> favouriteListData = <FavouriteListData>[].obs;
  RxList<Widget> imageSliders = <Widget>[].obs;


  @override
  void onInit() async {
    super.onInit();
    sliderImage();
    everyDayStoriesData();
    favouriteLis();
  }

  sliderImage() {
    sliderImageList.value = [
      SliderImageList(image: AppImagePath.movie),
      SliderImageList(image: AppImagePath.movie1),
      SliderImageList(image: AppImagePath.movie2),
      SliderImageList(image: AppImagePath.movie3),
      SliderImageList(image: AppImagePath.movie4),
    ];



  }

  everyDayStoriesData() {
    everyDayStoriesDataList.value = [
      ImageList(name: "Mumbai saga", image: AppImagePath.movie),
      ImageList(name: "Wonder Women", image: AppImagePath.movie1),
      ImageList(name: "Godzilla", image: AppImagePath.movie2),
      ImageList(name: "Saina", image: AppImagePath.movie3),
      ImageList(name: "Chakede", image: AppImagePath.movie4),
    ];
  }

  favouriteLis() {
    favouriteListData.value = [
      FavouriteListData(image: AppImagePath.song, name: 'Teri Load'),
      FavouriteListData(image: AppImagePath.song1, name: 'Ron Na Dena'),
      FavouriteListData(image: AppImagePath.song2, name: 'Edho Edho'),
      FavouriteListData(image: AppImagePath.song3, name: 'number Likh'),
      FavouriteListData(image: AppImagePath.song4, name: 'Hook Up'),
    ];
  }

}

class SliderImageList {
  String? image;

  SliderImageList({this.image});
}

class ImageList {
  String? image;
  String? name;

  ImageList({this.image, this.name});
}

class FavouriteListData {
  String? image;
  String? name;

  FavouriteListData({this.image, this.name});
}
