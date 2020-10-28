import 'package:flutter/material.dart';
import 'home_screen.dart';

class CategoriesScreen extends StatefulWidget {
  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  _showFormInDialog(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (param) {
          return AlertDialog(
            actions: [
              FlatButton(

                onPressed: () {  },
                child: Text('cancel'),

              ),
              FlatButton(

                onPressed: () {  },
                child: Text('save'),

              ),
            ],
            title: Text('category form'),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Category name',
                      hintText: 'input category name',
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Category description',
                      hintText: 'input category description',
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: RaisedButton(
          elevation: 0.0,
          color: Colors.red,
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).push(
                new MaterialPageRoute(builder: (context) => new HomeScreen()));
          },
        ),
        title: Text(
          'TO-DO',
        ),
      ),
      body: Center(
        child: Text(
          'Welcome to categories screen !',
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showFormInDialog(context);
        },
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}
