import 'package:eti_crm/models/chui_loss_list_model.dart';
import 'package:eti_crm/services/firestore_database.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class ChuiLossList extends StatefulWidget {
  @override
  _ChuiLossListState createState() => _ChuiLossListState();
}

class _ChuiLossListState extends State<ChuiLossList> {

  @override
  Widget build(BuildContext context) {

    //TODO: make check for empty value
    return ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            return Text('4');
          }
        );
  }
}
