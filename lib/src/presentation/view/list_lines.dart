import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListLines extends StatefulWidget {
  ListLines({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ListLinesState createState() => _ListLinesState();
}

class _ListLinesState extends State<ListLines> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return Header();
            } else {
              return NewWidget();
            }
          },
          itemCount: 3),
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: <Widget>[
          Image.network(
              "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e5/CPTM_icon.svg/1024px-CPTM_icon.svg.png",
              width: 30,
              height: 30),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text("CPTM METRO",
                style: TextStyle(fontSize: 32.0, color: Colors.grey)),
          )
        ],
      ),
    );
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
                decoration:
                    BoxDecoration(color: Colors.grey, shape: BoxShape.circle),
                height: 60,
                width: 60,
                child: Center(
                    child: Text("1",
                        style: TextStyle(
                            fontSize: 25.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)))),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("DIAMANTE",
                  style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold)),
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text("Operacional teste"),
              ),
            ],
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Container(
                    decoration: BoxDecoration(color: Colors.green),
                    height: 80,
                    width: 5),
              ],
            ),
          )
        ],
      ),
    );
  }
}
