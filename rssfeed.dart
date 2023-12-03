//Run flutter pub add news_api_flutter_package and flutter pub add url_launcher, then run flutter pub get

import 'package:flutter/material.dart';
import 'package:news_api_flutter_package/model/article.dart';
import 'package:news_api_flutter_package/news_api_flutter_package.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<List<Article>> future;

  @override
  void initState() {
    future = getNewsData();
    super.initState();
  }

  Future<List<Article>> getNewsData() async {
    NewsAPI newsAPI = NewsAPI("2bdd3d6f2fd14bcfbf40c344274926f9");
    return await newsAPI.getTopHeadlines(
      country: "in",
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme
              .of(context)
              .colorScheme
              .inversePrimary,
          title: const Text("RSS Feed and API Calls"),
        ),
        body: SafeArea(child: Column(
          children: [
            Expanded(child:
            FutureBuilder(
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                else if (snapshot.hasError) {
                  return const Center(child: Text('Error loading'),);
                }
                else {
                  if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                    return _buildNewsListView(snapshot.data as List<Article>);
                  }
                  else {
                    return const Center(child: Text('No news found'),);
                  }
                }
              },
              future: future,
            )
            )
          ],
        ),

        )
    );
  }

  Widget _buildNewsListView(List<Article> articleList) {
    return ListView.builder(itemBuilder: (context, index) {
      Article article = articleList[index];
      // _buildNewsItem(article);
      return GestureDetector(
        onTap: () {
          if (article.url != null) {
            final Uri url = Uri.parse(article.url!);
            _openArticleUrl(url);
          } else {
            // Handle the case where the URL is null (optional)
            print('URL is null for this article.');
          }
        },
        child: Card(
          elevation: 4,
          child: Padding(
              padding: EdgeInsets.all(5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 80,
                    width: 80,
                    child: Image.network(
                      article.urlToImage ?? "",
                      fit: BoxFit.fitHeight,
                      errorBuilder: (context, error, stackTrace){
                        return const Icon(Icons.image_not_supported);
                      },
                    ),
                  ),

                  SizedBox(width: 250,
                      child: Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(article.title!, ),
                            Text(article.source.name!)
                          ],
                        ),
                      )
                  ),
                ],
             )) ) );
    },
        itemCount: articleList.length);
  }
  void _openArticleUrl(Uri url) {
    launchUrl(url);
  }

}
