import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterViewProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text('ARtırmak için tıklayınız'),
              Text(context.watch()),
              InkWell(
                onTap: () {
                  
                },
                child: Container(
                  color: Colors.blue,
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  child: Text('Artir'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
