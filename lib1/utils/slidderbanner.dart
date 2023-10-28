import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:manaqa_app/utils/loaderscreen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.facebook.com%2FOnlineCoursesPakistan%2F&psig=AOvVaw12NAauudb0pQ_8mlgPrWx3&ust=1677569162409000&source=images&cd=vfe&ved=0CBAQjRxqFwoTCPigiaKWtf0CFQAAAAAdAAAAABAz",
  'https://www.kyos.com/wp-content/uploads/2021/03/Training-Courses-laptop-shutterstock_532475893m.jpg',
];

class SliderScreen extends StatelessWidget {
  const SliderScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.h)),
          child: CarouselSlider.builder(
            itemCount: 4,
            itemBuilder:
                (BuildContext context, int itemIndex, int pageViewIndex) {
              return InkWell(
                child: CachedNetworkImage(
                  imageUrl: imgList[2],
                  width: 100.w,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => LoaderScreen(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              );
            },
            options: CarouselOptions(
              enlargeCenterPage: false,
              viewportFraction: 1,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
            ),
          ),
        ),
        // Positioned(
        //     top: 19.h,
        //     left: 0,
        //     right: 0,
        //     child: Padding(
        //       padding: EdgeInsets.only(top: 2.h, right: 2.h, left: 2.h),
        //       child: Center(
        //         child: SizedBox(
        //           height: 6.h,
        //           child: InkWell(
        //             onTap: () {
        //               Navigator.push(
        //                   context,
        //                   MaterialPageRoute(
        //                       builder: (context) => GlobalSearch()));
        //             },
        //             child: TextField(
        //               decoration: InputDecoration(
        //                 isDense: true,
        //                 suffixIcon: Padding(
        //                   padding: EdgeInsets.all(1.h),
        //                   child: SizedBox(
        //                     height: 1.0.h,
        //                     child: CircleAvatar(
        //                       backgroundColor: Colors.black,
        //                       child: IconButton(
        //                         padding: EdgeInsets.zero,
        //                         icon: InkWell(
        //                           onTap: () {
        //                             Navigator.push(
        //                                 context,
        //                                 MaterialPageRoute(
        //                                     builder: (context) =>
        //                                         GlobalSearch()));
        //                           },
        //                           child: Icon(
        //                             Icons.close,
        //                             size: 20,
        //                           ),
        //                         ),
        //                         color: Colors.white,
        //                         onPressed: () {},
        //                       ),
        //                     ),
        //                   ),
        //                 ),
        //                 hintText: 'Search',
        //                 hintStyle: AppStyle.textsubsubtitle,
        //                 border: InputBorder.none,
        //               ),
        //             ),
        //           ),
        //         ),
        //       ),
        //     )

        //     // SearchWidget()

        //     )
      ],
    );
  }
}
