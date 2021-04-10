import 'package:flutter/material.dart';

class OdevFormView extends StatefulWidget {
  @override
  _OdevFormViewState createState() => _OdevFormViewState();
}

class _OdevFormViewState extends State<OdevFormView> {
  var tarih;
  var uyar;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Text('Tarih'),
            ),
            InkWell(
              onTap: () {
                showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2021),
                  lastDate: DateTime(2025),
                ).then((value) {
                  tarih = value;
                  if (tarih < DateTime.now()) {
                    uyar = "GEçerli bir tarhi seciniz";
                  } else
                    uyar = "uygun tarih";

                  print('$uyar');

                  setState(() {});
                });
              },
              child: Container(
                padding: EdgeInsets.all(5),
                color: Colors.purple,
                width: 150,
                height: 50,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Tarih Seçiniz',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Text('$uyar'),
          ],
        ),
      ),
    );
  }
}
