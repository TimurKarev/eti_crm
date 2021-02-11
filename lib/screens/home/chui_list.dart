import 'package:eti_crm/services/database.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChuiList extends StatefulWidget {
  Future<QuerySnapshot> chui =  DatabaseService().queryChuiLossList();

  @override
  _ChuiListState createState() => _ChuiListState();
}

class _ChuiListState extends State<ChuiList> {

  @override
  Widget build(BuildContext context) {

    widget.chui.then((value) {
      QuerySnapshot qs = value;
      if (qs.docs.length > 0) {
        qs.docs.forEach((element) {
          print(element.id);
        });
      }
    });

    return Container(
        child: RaisedButton(
            onPressed: () {
            },
            child: Text('Action')
        )
    );
  }
}
