import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/screens/web_veiw_screen.dart';

Widget devider() {
  return Container(
    height: 1,
    width: double.infinity,
    color: Colors.blueGrey,
  );
}

void navigateTo(context, Widget) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => Widget));
}

Widget buildArticlesNews(article, context) {
  //String url = article['urlToImage'].toString();
  String spare =
      'https://images.pexels.com/photos/4439425/pexels-photo-4439425.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
          .toString();

  return InkWell(
    onTap: () {
      navigateTo(context, WebVeiwScreen(article['url'].toString()));
    },
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              key: const Key("x"),
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: NetworkImage(article['urlToImage'].toString() ),
                    fit: BoxFit.cover,
                  ))),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: SizedBox(
              height: 120,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    key: const Key("valu"),
                    child: Text(
                      '${article['title']}',
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.headline1,
                    ),
                  ),
                  Text(
                    article['publishedAt'].toString(),
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
