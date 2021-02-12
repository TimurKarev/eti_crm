import 'package:eti_crm/models/chui_loss_list_model.dart';
import 'package:flutter/material.dart';

class ChuiLossTable extends StatefulWidget {

  ChuiLossListItemModel model;
  ChuiLossTable({this.model});

  @override
  _ChuiLossTableState createState() => _ChuiLossTableState();
}

class _ChuiLossTableState extends State<ChuiLossTable> {
  @override
  Widget build(BuildContext context) {
    final name = widget.model.name;
    return Text('$name');
  }
}
