import 'package:flutter/material.dart';
import 'package:infotechkurs/sqllite/helper/database_helper.dart';
import 'package:infotechkurs/sqllite/models/user.dart';

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
      appBar: AppBar(),
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
            ListView.builder(
              shrinkWrap: true,
              itemCount: userList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(userList[index].name ?? 'boş veri geldi'),
                );
              },
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
