import 'package:baroneza/src/data/lines_repository_impl.dart';
import 'package:baroneza/src/domain/interactor/get_lines_interactor.dart';
import 'package:baroneza/src/presentation/bloc/company_view_model.dart';
import 'package:baroneza/src/presentation/bloc/line_view_model.dart';
import 'package:baroneza/src/presentation/bloc/lines_bloc.dart';
import 'package:baroneza/src/presentation/bloc/list_item.dart';
import 'package:baroneza/src/presentation/di/dependencies.dart';
import 'package:baroneza/src/presentation/helper/Strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ListLines extends StatefulWidget {
  @override
  _ListLinesState createState() => _ListLinesState();
}

class _ListLinesState extends State<ListLines> {
  var bloc =  Dependencies.get<LinesBloc>();

  @override
  void initState() {
    super.initState();
    FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
    _firebaseMessaging.getToken().then((token) {
      Firestore.instance
          .collection('tokens')
          .document(token)
          .setData({"token": token});
    });
  }

  @override
  Widget build(BuildContext context) {
    bloc.getAllLines();
    return Scaffold(
      appBar: AppBar(
        title: Text("Ligado nos Trens"),
      ),
      body: StreamBuilder(
          stream: bloc.outAllLines,
          builder: (_, AsyncSnapshot<List<ListItem>> snapshot) {
            if (snapshot.hasData) {
              return RefreshIndicator(
                onRefresh: _onRefresh,
                child: ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      final item = snapshot.data[index];
                      if (item is CompanyViewModel) {
                        return CompanyWidget(item);
                      } else if (item is LineViewModel) {
                        return LineWidget(item);
                      }
                    }),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }

  Future<Null> _onRefresh() async {
    bloc.getAllLines();
    return null;
  }
}

class CompanyWidget extends StatelessWidget {
  final CompanyViewModel _companyViewModel;

  const CompanyWidget(this._companyViewModel);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: <Widget>[
          Image.network(_companyViewModel.company.image, width: 32, height: 32),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(_companyViewModel.company.name,
                style: TextStyle(fontSize: 32.0, color: Colors.grey)),
          )
        ],
      ),
    );
  }
}

class LineWidget extends StatelessWidget {
  final LineViewModel _lineViewModel;

  const LineWidget(this._lineViewModel);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Card(
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16),
                child: Container(
                    decoration: BoxDecoration(
                        color: Strings.toColor((_lineViewModel.line.color)),
                        shape: BoxShape.circle),
                    height: 60,
                    width: 60,
                    child: Center(
                        child: Text(_lineViewModel.line.id,
                            style: TextStyle(
                                fontSize: 25.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold)))),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(_lineViewModel.line.name,
                        style: TextStyle(
                            fontSize: 25.0,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Text(_lineViewModel.line.status.name)
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0, bottom: 16.0),
                    child: Container(
                        constraints: new BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width - 120),
                        child: Text(_lineViewModel.line.status.description)),
                  )
                ],
              )
            ],
          ),
        ),
        Positioned.fill(
            child: new Material(
                color: Colors.transparent,
                child: new InkWell(
                  onTap: () => null,
                )))
      ],
    );
  }
}
