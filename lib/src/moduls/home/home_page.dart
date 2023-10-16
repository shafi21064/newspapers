import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        title: Text(
          'News Paper',
          style: TextStyle(
          color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 25.sp,
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
                height: 100.h,
                width: 100.w,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(.1),
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 50.h,
                        width: 100.w,
                        child: Image.network(newsUrlProvider.newsUrl[index]['paper_logo'])),
                    SizedBox(height: 20.h,),
                    Text(newsUrlProvider.newsUrl[index]['paper_name'],
                      style: TextStyle(
                        fontSize: 18.sp,
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
