import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infotechkurs/sqllite/helper/database_helper.dart';
import 'package:infotechkurs/sqllite/models/user.dart';
import 'package:infotechkurs/sqllite/theme/app_darkTheme.dart';
import 'package:infotechkurs/sqllite/theme/app_lightTheme.dart';
import 'package:infotechkurs/sqllite/theme/theme_state.dart';

class SqlViewPage extends StatefulWidget {
  @override
  _SqlViewPageState createState() => _SqlViewPageState();
}

class _SqlViewPageState extends State<SqlViewPage> {
  DatabaseHelper databaseHelper = DatabaseHelper();
  var data;

  List<User> userList = [];
  getAllUser() {
    userList.clear();
    databaseHelper.getUser().then((users) {
      //print(users);
      setState(() {
        for (var item in users) {
          userList.add(User.fromMap(item));
        }
      });
    });
  }

  //User newUser = User('Selman');

  @override
  void initState() {
    getAllUser();
    //databaseHelper.addUser(newUser);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Sql Lite '),
        actions: [
          GetBuilder<ThemeState>(
            builder: (val) {
              return InkWell(
                onTap: () {
                  val.changeTheme(
                    val.currentTheme == appLightTheme
                        ? appDarkTheme
                        : appLightTheme,
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Icon(
                    val.currentTheme == appLightTheme
                        ? Icons.lightbulb
                        : Icons.lightbulb_outline,
                    color: Colors.white,
                  ),
                ),
              );
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              child: TextFormField(
                decoration: InputDecoration(hintText: 'Yeni Kullanıcı Ekle'),
                onChanged: (value) {
                  setState(() {
                    data = value;
                  });
                },
              ),
            ),
            SingleChildScrollView(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: userList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(userList[index].name ?? 'boş veri geldi'),
                  );
                },
              ),
            ),
            FloatingActionButton(
              onPressed: () {
                databaseHelper.addUser(User(data));
                getAllUser();
              },
              tooltip: 'ekleme',
            )
          ],
        ),
      ),
    );
  }
}
