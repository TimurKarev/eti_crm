import 'package:cloud_firestore/cloud_firestore.dart';

class ChuiLossListModel {
  final List<String> list;
  ChuiLossListModel({this.list});

  factory ChuiLossListModel.fromMap(
      QuerySnapshot data) {

    if (data == null) {
      return null;
    }
    List<String> _list = new List<String>();
    data.docs.forEach((doc) {
      _list.add(doc.data()['losses_case_name']);
    });
    return ChuiLossListModel(list: _list);
  }

  List<String> getList() => list;
}