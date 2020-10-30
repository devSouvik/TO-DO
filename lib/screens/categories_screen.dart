import 'package:flutter/material.dart';
import 'package:todo_app/services/category_service.dart';
import 'package:todo_app/models/category.dart';
import 'home_screen.dart';

class CategoriesScreen extends StatefulWidget {
  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {

  var _categoryName = TextEditingController();
  var _categoryDescription = TextEditingController();

  var _category = Category();
  var _categoryService = CategoryService();

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

                onPressed: () async {
                  // print('category name: , ${_categoryName.text}');
                  // print('category name: , ${_categoryDescription.text}');

                  _category.name = _categoryName.text;
                  _category.description = _categoryDescription.text;
                  var result = await _categoryService.saveCategory(_category);
                  print(result);
                },
                child: Text('save'),

              ),
            ],
            title: Text('category form'),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  TextField(
                    controller: _categoryName,
                    decoration: InputDecoration(
                      labelText: 'Category name',
                      hintText: 'input category name',
                    ),
                  ),
                  TextField(
                    controller: _categoryDescription,
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

class _Category {
}
