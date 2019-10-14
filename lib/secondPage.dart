import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'src.dart';

class SecondPage extends StatefulWidget {
  String category;
  SecondPage({this.category});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SecondState();
  }
}

class _SecondState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.amber,
        title: Text(
          "نتائج البحث",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: new FutureBuilder(
        future: getPics(widget.category),
        builder: (context, snapShot) {
          Map data = snapShot.data;
          if (snapShot.hasError) {
            print(snapShot.error);
            return Text(
              "فشل الحصول علي نتيجة من السيرفر حاول مرة آخرة",
              textDirection: TextDirection.rtl,
              style: TextStyle(
                  fontSize: 24, fontWeight: FontWeight.bold, color: Colors.red),
            );

          }else if(snapShot.hasData){
            return new Center(
              child: new ListView.builder(
                  itemCount: data.length,

                  itemBuilder: (context, index){
                    return new Column(
                      children: <Widget>[
                        new Padding(padding: EdgeInsets.all(5.0)),
                        new Container(
                          child: new InkWell(
                            onTap: (){},
                            child: new Image.network('${data['hits'][index]['largeImageURL']}'),
                          ),
                        ),
                      ],
                    );
                  }),

            );

          }else if (!snapShot.hasData){
            return new Center(child: CircularProgressIndicator(),);

          }
        },

      ),
    );
  }
}

Future<Map> getPics(String category) async {
  String url =
      'https://pixabay.com/api/?key=$apiKey&q=$category&image_type=photo&pretty=true';
  http.Response response = await http.get(url);
  return json.decode(response.body);
}
