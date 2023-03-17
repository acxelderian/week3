import 'package:flutter/material.dart';
import 'package:week3/detail_news_screen.dart';
import 'package:week3/model/article.dart';

class NewsScreen extends StatelessWidget {
  static const routeName= '/news_list';
  const NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("News App"),
      ),
      //sifatnya asynchronouts
      body: FutureBuilder <String> (
        // jenis data apa yang akan diambil di future
        future: DefaultAssetBundle.of(context).loadString('assets/news.json'),
        // loadString yang sudah selesai akan dimasukkan ke dalam snapshot
        builder: (context, snapshot) {
          final List<Article> articles = parseArticle(snapshot.data);
          return ListView.builder(
              itemCount: articles.length,
              itemBuilder: (context, index) {
                return buildItem(context, articles[index]);
              },
          );
        }
      ),
    );
  }
}

Widget buildItem(BuildContext context, Article article) {
  return ListTile(
    contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
    leading: Hero(
      tag: 'dash',
      child: Image.network( article.urlToImage),
    ),
    title: Text(article.title),
    subtitle: Text(article.author),
    onTap: (){
      Navigator.pushNamed(context, DetailNewsScreen.routeName, arguments:article);
    },
  );
}
