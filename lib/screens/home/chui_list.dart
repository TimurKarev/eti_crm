import 'package:eti_crm/models/chui_loss_list_model.dart';
import 'package:eti_crm/services/firestore_database.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class ChuiList extends StatefulWidget {
  @override
  _ChuiListState createState() => _ChuiListState();
}

class _ChuiListState extends State<ChuiList> {

  @override
  Widget build(BuildContext context) {
    ChuiLossListModel c = Provider.of<ChuiLossListModel>(context) ?? [];
    //TODO: make check for empty value
    return ListView.builder(
          itemCount: c.getList().length,
          itemBuilder: (context, index) {
            return Text(c.getList()[index]);
          }
        );
  }
}
