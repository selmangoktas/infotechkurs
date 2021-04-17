import 'package:flutter/material.dart';
import 'package:infotechkurs/ders9/foto-api.dart';

class ApiGetView extends StatefulWidget {
  @override
  _ApiGetViewState createState() => _ApiGetViewState();
}

class _ApiGetViewState extends State<ApiGetView> {
  final TextEditingController _controller = TextEditingController();

  Future<Album> _futureAlbum;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8.0),
        child: (_futureAlbum == null)
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextField(
                    controller: _controller,
                    decoration: InputDecoration(hintText: 'Enter Title'),
                  ),
                  ElevatedButton(
                    child: Text('Create Data'),
                    onPressed: () {
                      setState(() {
                        _futureAlbum = createAlbum(_controller.text);
                      });
                    },
                  ),
                ],
              )
            : FutureBuilder<Album>(
                future: _futureAlbum,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(snapshot.data.title);
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }

                  return CircularProgressIndicator();
                },
              ),
      ),
    );
  }
}
