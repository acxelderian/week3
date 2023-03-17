import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:week3/model/article.dart';
import 'package:week3/model/kdrama.dart';
import 'package:week3/more_news.dart';

class DetailKDramaScreen extends StatelessWidget {
  static const routeName= '/detail_kdrama_list';
  final KoreanDrama kdrama;
  final double padValue = 0;
  const DetailKDramaScreen({Key? key, required this.kdrama}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(kdrama.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeroMode(
                enabled: false,
                child: Hero(
                    tag: 'kdrama',
                    // child: Image.network(kdrama.banner)
                    child: FadeInImage.assetNetwork(
                        fadeInCurve: Curves.bounceIn,
                        placeholder: 'image/alchemy.png',
                        image: kdrama.banner,
                    ),
                ),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(10),
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Text(kdrama.broadcaster),
            //       Divider(color: Colors.grey),
            //       Text(
            //         kdrama.broadcaster,
            //         style: const TextStyle(
            //           color: Colors.black,
            //           fontWeight: FontWeight.bold,
            //           fontSize: 24
            //         ),
            //       ),
            //       const Divider(color: Colors.grey,),
            //       Text('Schedule: ${kdrama.schedule}')
            //     ],
            //   ),
            // ),
            AnimatedPadding(
                padding: const EdgeInsets.all(10),
                duration: const Duration(seconds: 1),
                curve: Curves.easeInOut,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('By : ${kdrama.broadcaster}'),
                    Divider(color: Colors.grey),
                    Text(
                      kdrama.name,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 24
                      ),
                    ),
                    const Divider(color: Colors.grey,),
                    Text('Schedule: ${kdrama.schedule}')
                  ],
                ),
            )
          ],
        ),
      )
    );
  }
}
