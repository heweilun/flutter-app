import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:convert';

class SearchPage extends StatefulWidget{
  // const SearchPage({Key? key}):super(key: key);
  @override
  _SearchPageState createState() =>_SearchPageState();
}

class _SearchPageState extends State<SearchPage>{
  String showResult = '';
  List _list = [];
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          InkWell(
            onTap: () {
              dioGetTest();
              setState(() {
                showResult = '请求';
              });
            },
            child: const Text('点击', style: TextStyle(fontSize: 26),),
          ),
          Text(showResult),
          SizedBox(
            height: 200,
            child: ListView.builder(
            //数据的长度，有几个渲染几个，动态的进行渲染
            itemCount: _list.length,
            itemBuilder: (BuildContext context, int i) {
              return Text('${_list[i]["nm"]}');
            }
          ))
          
        ],
      )
    );
  }
  dioGetTest() async {
    //可以指定Response类型，也可以使用var
    Response response =
        await Dio().get('http://m.maoyan.com/ajax/movieOnInfoList');
    //得到数据并转换格式
    Map<String, dynamic> responseData = json.decode(response.toString());
    // print(responseData["movieList"]);
    
    setState(() {
      //movieList是获取到的数据中的键名
      _list = responseData["movieList"];
    });
  }
}