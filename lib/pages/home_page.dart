import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
const appbarScrollOffset = 100;

class HomePage extends StatefulWidget{
  // const HomePage({Key? key}):super(key: key);
  @override
  _HomePageState createState() =>_HomePageState();
}

class _HomePageState extends State<HomePage>{
  final List<Map> _imgList = [
    {'url': 'https://t7.baidu.com/it/u=1956604245,3662848045&fm=193&f=GIF'},
    {'url': 'https://t7.baidu.com/it/u=2529476510,3041785782&fm=193&f=GIF'},
    {'url': 'https://t7.baidu.com/it/u=727460147,2222092211&fm=193&f=GIF'},
  ];
  double appBarAlpha = 0;
  _onScroll(offset) {
    double alpha = offset/appbarScrollOffset;
    if(alpha < 0) {
      alpha = 0;
    } else if(alpha > 1) {
      alpha = 1;
    }
    setState(() {
      appBarAlpha=alpha;
    });
    // ignore: avoid_print
    print(appBarAlpha);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
        MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: NotificationListener(
            onNotification: (scrollNotification) {
              if(scrollNotification is ScrollUpdateNotification && scrollNotification.depth == 0) {
                _onScroll(scrollNotification.metrics.pixels);
              }
              return true;
            },
            child: ListView(children: <Widget>[
              SizedBox(
                height: 160,
                child: Swiper(
                  itemBuilder: (BuildContext context,int index){
                    return Image.network(_imgList[index]['url'],fit: BoxFit.fill);
                  },
                  autoplay: true,
                  itemCount: _imgList.length,
                  pagination: const SwiperPagination(),
                  // control: const SwiperControl(),
                ),
              ),
              const SizedBox(
                height: 800,
                child: ListTile(title: Text('测试'))
              )
            ])
          )
        ),
        Opacity(
          opacity: appBarAlpha,
          child: Container(
            height: 80,
            decoration: const BoxDecoration(color: Colors.white),
            child: const Center(
              child: Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text('首页'),
              ),
            )
          ),
        )
      ])
    );
  }
}