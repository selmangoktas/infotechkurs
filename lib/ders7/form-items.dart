import 'package:flutter/material.dart';

class FormItemsView extends StatefulWidget {
  @override
  _FormItemsViewState createState() => _FormItemsViewState();
}

class _FormItemsViewState extends State<FormItemsView> {
  String textValue;
  String textFormValue;
  String _email;
  String _password;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Bilgileri'),
      ),
      body: Column(
        children: [
          Container(
            child: TextField(
              onChanged: (value) {
                setState(() {
                  textValue = value;
                });
              },
            ),
          ),
          Form(
            key: formKey,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(bottom: 5),
                  child: TextFormField(
                    //keyboardType: TextInputType.number,
                    //obscureText: true,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.pink,
                          width: 4,
                        ),
                      ),
                    ),
                    validator: (value) {
                      final pattern = "a@a";
                      final regExp = RegExp(pattern);
                      if (value.isNotEmpty) {
                        if (!regExp.hasMatch(value))
                          return 'lütfen geçerli bir mail giriniz.';
                        else
                        return null;
                      }
                      else 
                      {
                      return 'Lütfen boş alan bırakmayınız ';
                      }

                     /* if (value.length < 6)
                        return '6 dan fazla karakter giriniz';
                      else
                        return null;*/
                    },
                   
                    onChanged: (value) {
                      setState(() {
                        _email = value;
                      });
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 5),
                  child: TextFormField(
                    //keyboardType: TextInputType.number,
                    //obscureText: true,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.pink,
                          width: 4,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value.length < 6)
                        return '6 dan fazla karakter giriniz';
                      else
                        return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        _password = value;
                      });
                    },
                  ),
                ),
              Container(),
              ],
            ),
          ),
          Text(
            textValue == null ? '' : textValue.toString(),
          ),
          InkWell(
            onTap: () {
              final isValid = formKey.currentState.validate();
              print(isValid);
              formKey.currentState.save();
              print(_email);
              print(_password);

              final snackBar = SnackBar(
                backgroundColor: Colors.green,
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('basarılı'),
                    SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.purple,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Colors.white,
                          ),
                        )),
                  ],
                ),
              );

              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
            child: Container(
              height: 50,
              width: 100,
              color: Colors.red,
              child: Center(
                child: Text(
                  'Submit',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
    
  
  

