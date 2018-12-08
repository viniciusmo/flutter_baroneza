import 'package:baroneza/src/data/lines_repository_impl.dart';
import 'package:baroneza/src/presentation/bloc/company_view_model.dart';
import 'package:baroneza/src/presentation/bloc/lines_bloc.dart';
import 'package:baroneza/src/presentation/bloc/list_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListLines extends StatefulWidget {
  @override
  _ListLinesState createState() => _ListLinesState();
}

class _ListLinesState extends State<ListLines> {
  @override
  Widget build(BuildContext context) {
    var bloc = LinesBloc(LinesRepositoryImpl());
    bloc.getAllLines();
    return Scaffold(
      appBar: AppBar(
        title: Text("Situação linhas"),
      ),
      body: StreamBuilder(
          stream: bloc.outAllLines,
          builder: (_, AsyncSnapshot<List<ListItem>> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    final item = snapshot.data[index];
                    if (item is CompanyViewModel) {
                      return Header();
                    } else {
                      return NewWidget();
                    }
                  });
            }else{
              return Text("Loading");
            }
          }),
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
