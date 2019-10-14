import 'package:flutter/material.dart';
import 'secondPage.dart';

class FirstPage extends StatelessWidget {
  var _categoryNameController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("صوري"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Material(
        color: Colors.white,
        child: new Center(
          child: new ListView(
            children: <Widget>[
              Padding(padding: EdgeInsets.all(40.0)),
              new Image.asset(
                'assets/image.png',
                width: 200,
                height: 200,
              ),
              new ListTile(
                title: TextFormField(
                  textDirection: TextDirection.rtl,
                  controller: _categoryNameController,
                  decoration: new InputDecoration(
                    labelText: " اكتب ما تريد البحث عنه هنا",
                    hintText: "مثل، عربية او سماء ...",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    contentPadding:
                    const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ListTile(
                title: new Material(
                  color: Colors.amber,
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(30.0),
                  child: new MaterialButton(
                    onPressed: () {
                      Navigator.of(context).push(
                          new MaterialPageRoute(builder: (context){
                            return new SecondPage(category: _categoryNameController.text,);
                          })
                      );
                    },
                    child: Text(
                      'أبحث هنا',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
