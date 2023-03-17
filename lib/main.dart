import 'package:flutter/material.dart';
import 'package:week3/detail_kdrama_screen.dart';
import 'package:week3/detail_news_screen.dart';
import 'package:week3/kdrama_screen.dart';
import 'package:week3/model/article.dart';
import 'package:week3/model/kdrama.dart';
import 'package:week3/more_news.dart';
import 'package:week3/news_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      // theme: ThemeData.light(),
      // darkTheme: ThemeData.dark(),
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      //default root
      initialRoute: KDramaScreen.routeName,
      routes: {
        NewsScreen.routeName: (context) => const NewsScreen(),
        KDramaScreen.routeName: (context) => const KDramaScreen(),
        DetailKDramaScreen.routeName: (context) => DetailKDramaScreen(
          kdrama: ModalRoute.of(context)?.settings.arguments as KoreanDrama
        ),
        DetailNewsScreen.routeName: (context) => DetailNewsScreen(
          // pengiriman parameter ke widget
          article: ModalRoute.of(context)?.settings.arguments as Article
        ),
        MoreNewsScreen.routeName: (context) => MoreNewsScreen(
          // pengiriman parameter ke widget
          article: ModalRoute.of(context)?.settings.arguments as Article
        )
      }
    );
  }
}