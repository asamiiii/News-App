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
                    image: NetworkImage(article?['urlToImage'].toString()??'https://www.flaticon.com/free-icon/not-found_2748614?term=not+found&page=1&position=2&origin=search&related_id=2748614'),
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
