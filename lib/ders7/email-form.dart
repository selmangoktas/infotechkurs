import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EmailViewPage extends StatefulWidget {
  @override
  _EmailViewPageState createState() => _EmailViewPageState();
}

class _EmailViewPageState extends State<EmailViewPage> {
  File _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  final _formKey = GlobalKey<FormState>();
  var _adsoyad;
  var _email;
  var _pass;
  var _pass1;
  var _uyari;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Bilgileri'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: ListView(children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: getImage,
                  child: Container(
                    height: 200,
                    width: 200,
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.teal,
                      borderRadius:
                          BorderRadius.all(Radius.elliptical(200, 200)),
                      border: Border.all(
                        color: Colors.teal,
                        width: 4.0,
                      ),
                    ),
                    child: _image == null
                        ? Center(
                            child: Text(
                            'Lütfen Resim Seçiniz.',
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ))
                        : CircleAvatar(
                            backgroundImage: FileImage(_image),
                            radius: 200.0,
                          ),
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.vpn_key_sharp),
                    hintText: 'Ad Soyad giriniz',
                    labelText: 'Ad Soyad',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.pink,
                        width: 2,
                      ),
                    ),
                  ),

                  validator: (value) {
                    _adsoyad = value;
                    if (value.length < 3) {
                      _uyari = '3 Karakterden fazla giriniz';
                    } else {
                      _uyari = null;
                    }
                    return _uyari;
                  },
                  // decoration: InputDecoration(),
                  onSaved: (value) {
                    _adsoyad = value;
                    setState(() {
                      if (value.length < 3) {
                        _uyari = '3 karakterden fazla bilgi giriniz.';
                      } else {
                        _uyari = null;
                      }
                    });
                  },
                ),
                SizedBox(
                  height: 5,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.email),
                    hintText: 'E-mail adresinizi giriniz',
                    labelText: 'E-mail',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.pink,
                        width: 2,
                      ),
                    ),
                  ),

                  validator: (value) {
                    _email = value;
                    final pattern =
                        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                    RegExp regex = RegExp(pattern);
                    if (!value.isNotEmpty && !regex.hasMatch(value)) {
                      _uyari = "Uygun email giriniz";
                    } else {
                      _uyari = null;
                    }
                    return _uyari;
                  },
                  // decoration: InputDecoration(),
                  onSaved: (value) {
                    _email = value;
                    setState(() {
                      if (value.length < 3) {
                        _uyari = "Geçerli uzunlukta bir email giriniz.";
                      } else {
                        _uyari = null;
                      }
                    });
                  },
                ),
                SizedBox(
                  height: 5,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.vpn_key_sharp),
                    hintText: 'Parolanızı giriniz',
                    labelText: 'Parola',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.pink,
                        width: 2,
                      ),
                    ),
                  ),

                  validator: (value) {
                    _pass = value;
                    if (value.length < 3) {
                      _uyari = "3 Karakterden fazla parola giriniz";
                    } else {
                      _uyari = null;
                    }
                    return _uyari;
                  },
                  // decoration: InputDecoration(),
                  onSaved: (value) {
                    _pass = value;
                    setState(() {
                      if (value.length < 3) {
                        _uyari = "3 karakterden fazla bilgi giriniz.";
                      } else {
                        _uyari = null;
                      }
                    });
                  },
                ),
                SizedBox(
                  height: 5,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.vpn_key_sharp),
                    hintText: 'Parolanızı giriniz',
                    labelText: 'Parola',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.pink,
                        width: 2,
                      ),
                    ),
                  ),

                  validator: (value) {
                    _pass1 = value;
                    if (value.length < 3) {
                      _uyari = "3 Karakterden fazla parola giriniz";
                    } else {
                      if (_pass != _pass1) {
                        _uyari = "Lütfen aynı parolayı giriniz.";
                      } else
                        _uyari = null;
                    }
                    return _uyari;
                  },
                  // decoration: InputDecoration(),
                  onSaved: (value) {
                    _pass1 = value;
                    setState(() {
                      if (value.length < 3) {
                        _uyari = "3 karakterden fazla bilgi giriniz.";
                      } else {
                        _uyari = null;
                      }
                    });
                  },
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width * .8,
                  height: MediaQuery.of(context).size.height * .08,
                  child: InkWell(
                    onTap: () {
                      final isValid = _formKey.currentState.validate();
                      print(isValid);
                      _formKey.currentState.save();
                      print(_email);
                      print(_pass);
                      print(_adsoyad);
                      if (_formKey.currentState.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return Scaffold(
                                appBar: AppBar(),
                                body: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    alignment: Alignment.topLeft,
                                    width:
                                        MediaQuery.of(context).size.width * .9,
                                    height:
                                        MediaQuery.of(context).size.height * .5,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Aşağıdaki bilgileri onaylıyor musunuz? ',
                                          style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text('$_adsoyad'),
                                        Text('$_email'),
                                        Text('$_pass'),
                                        Image.file(_image,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .5),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('$_uyari'),
                          ),
                        );
                      }
                    },
                    child: Text(
                      'Kaydet',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
