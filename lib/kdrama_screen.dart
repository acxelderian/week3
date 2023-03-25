import 'package:flutter/material.dart';
import 'package:week3/detail_kdrama_screen.dart';
import 'package:week3/detail_news_screen.dart';
import 'package:week3/model/kdrama.dart';

class KDramaScreen extends StatelessWidget {
  static const routeName= '/kdrama_list';
  const KDramaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("News App"),
      ),
      //sifatnya asynchronouts
      body: ListView.builder(
        itemCount: koreanDramaList.length,
        itemBuilder: (context, index) {
          final KoreanDrama kdrama = koreanDramaList[index];
          return InkWell(
            onTap: (){
              Navigator.pushNamed(context, DetailKDramaScreen.routeName, arguments:kdrama);
            },
            child: Card(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget> [
                  Expanded(
                    flex:1,
                    child: Text(
                        kdrama.name,
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.cyan, fontSize: 30),
                    ),
                  ),
                  Expanded(
                      flex:1,
                      child: HeroMode(
                        child: Hero(
                            tag: 'kdrama',
                            child: Image.asset(kdrama.banner),
                        ),
                        enabled: true,
                      ),
                  ),
                ]
              ),
            ),
          );
        },
      )
    );
  }
}

// template dasar
// Widget buildItem(BuildContext context, Article article) {
//   return ListTile(
//     contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//     leading: Image.network(article.urlToImage, width: 100),
//     title: Text(article.title),
//     subtitle: Text(article.author),
//     onTap: (){
//       Navigator.pushNamed(context, DetailNewsScreen.routeName, arguments:article);
//     },
//   );
// }
