import 'package:flutter/material.dart';
import 'package:newspaper/src/controller/news_controller/news_controller.dart';
import 'package:newspaper/src/moduls/news_web/news.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var newsUrlProvider = Provider.of<NewsProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'News Paper',
          style: TextStyle(
          color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 25,
        ),),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      
      body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: newsUrlProvider.newsUrl.length,
          itemBuilder:(context, index){
            return InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> News(
                  newsUrl: newsUrlProvider.newsUrl[index]['url'],
                )));
              },
              child: Container(
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(16),
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(.1),
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(newsUrlProvider.newsUrl[index]['paper_logo']),
                    const SizedBox(height: 20,),
                    Text(newsUrlProvider.newsUrl[index]['paper_name'],
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                    ),),

                  ],
                ),
              ),
            );
          }),
    );
  }
}
