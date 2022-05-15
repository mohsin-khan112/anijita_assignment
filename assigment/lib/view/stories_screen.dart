import 'package:assigment/constant/app_images_path.dart';
import 'package:assigment/constant/flutter_image_slide_show.dart';
import 'package:assigment/view/controller/stories_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class StoriesScreen extends StatefulWidget {
  const StoriesScreen({Key? key}) : super(key: key);

  @override
  _StoriesScreenState createState() => _StoriesScreenState();
}

class _StoriesScreenState extends State<StoriesScreen> {


  @override
  Widget build(BuildContext context) {
    return GetBuilder<StoriesController>(
        init: StoriesController(),
        builder: (controller) {
          return SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              body: Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ui(),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 22, right: 22),
                        child: sliderUI(controller),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 22, right: 22),
                        child: everyDayStories(controller),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 22, right: 22),
                        child: favouriteData(controller),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  Widget ui() {
    return SizedBox(
      height: 220,
      width: double.infinity,
      child: Stack(
        children: [
          Positioned(
            child: Container(
              height: 220,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppImagePath.homeHeader),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Positioned(
              top: 2,
              left: 5,
              height: 80,
              width: 80,
              child: SvgPicture.asset(AppImagePathSVG.starPremium)),
          Positioned(
            top: 100,
            left: -10,
            child: Container(
              height: 35,
              width: 35,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.white),
            ),
          ),
          Positioned(
            top: 10,
            right: 100,
            left: -15,
            child: Container(
              height: 360,
              width: 400,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.white),
            ),
          ),
          Positioned(
            top: 130,
            right: -50,
            child: Container(
              height: 300,
              width: 250,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.white),
            ),
          ),
          const Positioned(
              top: 20,
              right: 20,
              child: Icon(
                Icons.more_vert,
                size: 24,
                color: Colors.white,
              ))
        ],
      ),
    );
  }




  Widget sliderUI(StoriesController controller) {
    return Stack(
        children: [
          ImageSlideshow(
            width: double.infinity,
            initialPage: 0,
            indicatorColor: Colors.blue,
            indicatorBackgroundColor: Colors.grey,
            autoPlayInterval: 2000,
            isLoop: true,
            children: [
              Image.asset(
                AppImagePath.movie,
                height: 200,
                fit:BoxFit.fill,
              ),
              Image.asset(
                AppImagePath.movie1,
                height: 200,
                fit:BoxFit.fill,
              ),
              Image.asset(
                AppImagePath.movie2,
                height: 200,
                fit:BoxFit.fill,
              ),
              Image.asset(
                AppImagePath.movie3,
                height: 200,
                fit:BoxFit.fill,
              ),
              Image.asset(
                AppImagePath.movie4,
                height: 200,
                fit:BoxFit.fill,
              ),
            ],
          ),
          Positioned(
              top: 80,
              left: 40,
              child: SvgPicture.asset(
                AppImagePathSVG.icPlay,
                height: 60,
                width: 60,
              ),),
        ],
    );
  }

  Widget everyDayStories(StoriesController storiesController) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      AppImagePath.person,
                    ),
                    fit: BoxFit.cover,
                  ),
                  shape: BoxShape.circle),
            ),
            const SizedBox(
              width: 30,
            ),
            const Text('Everyday Stories')
          ],
        ),
        const SizedBox(
          height: 4,
        ),
        Obx(() => SizedBox(
              height: 250,
              child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: storiesController.everyDayStoriesDataList.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: <Widget>[
                      SizedBox(
                        height: 200,
                        child: Stack(
                          children: [
                            Positioned(
                              child: Card(
                                color: Colors.white,
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: SizedBox(
                                  height: 170,
                                  width: 150,
                                  child: Image.asset(
                                      storiesController
                                          .everyDayStoriesDataList[index]
                                          .image!,
                                      fit: BoxFit.fill),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 130,
                              right: 40,
                              height: 60,
                              width: 60,
                              child: SvgPicture.asset(
                                AppImagePathSVG.icPlay,
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        storiesController.everyDayStoriesDataList[index].name!,
                        style: const TextStyle(color: Colors.black),
                      ),
                    ],
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    width: 20,
                  );
                },
              ),
            ))
      ],
    );
  }

  Widget favouriteData(StoriesController controller) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      AppImagePath.person,
                    ),
                    fit: BoxFit.cover,
                  ),
                  shape: BoxShape.circle),
            ),
            const SizedBox(
              width: 30,
            ),
            const Text('Favourite')
          ],
        ),
        const SizedBox(
          height: 4,
        ),
        Obx(
          () => SizedBox(
            height: 250,
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: controller.favouriteListData.length,
              itemBuilder: (context, index) {
                return Column(
                  children: <Widget>[
                    SizedBox(
                      height: 200,
                      child: Stack(
                        children: [
                          Positioned(
                            child: Card(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: SizedBox(
                                height: 170,
                                width: 150,
                                child: Image.asset(
                                    controller.favouriteListData[index].image!,
                                    fit: BoxFit.fill),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 130,
                            right: 40,
                            height: 60,
                            width: 60,
                            child: SvgPicture.asset(
                              AppImagePathSVG.icPlay,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      controller.favouriteListData[index].name!,
                      style: const TextStyle(color: Colors.black),
                    ),
                  ],
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  width: 20,
                );
              },
            ),
          ),
        )
      ],
    );
  }
}
