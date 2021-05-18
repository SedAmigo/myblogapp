import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:blogapplication/utils/extensions/size_extension.dart';

class ImageSider extends StatefulWidget {
  @override
  _ImageSiderState createState() => _ImageSiderState();
}

class _ImageSiderState extends State<ImageSider> {
  final List<String> imageList = [
    "assets/CONFF.jpg",
    "assets/funn.jpg",
    "assets/LOVE.jpg",
    "assets/MOTIV.jpg",
    "assets/RAN.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500.flexibleWidth,
      height: 200.flexibleHeight,
      child: CarouselSlider(
        options: CarouselOptions(
          autoPlay: true,
          enlargeCenterPage: true,
          height: 300.flexibleHeight,
        ),
        items: getImages(imageList),
      ),
    );
  }

  getImages(List imageList) {
    return imageList.map(
      (images) => Container(
        padding: EdgeInsets.only(
          left: 3.0,
          right: 5.0,
          top: 10.0,
          bottom: 10.0,
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(9.0)),
                shape: BoxShape.rectangle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(images),
                ),
              ),
            ),
          ],
        ),
      ),
    ).toList();
  }
}
