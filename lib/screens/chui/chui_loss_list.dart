import 'package:eti_crm/models/chui_loss_list_model.dart';
import 'package:eti_crm/screens/chui/chui_loss_table.dart';
import 'package:eti_crm/services/firestore_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final chuiLossListProvider = StreamProvider<List<ChuiLossListItemModel>>((ref) =>
    ChuiLossListVM().getChuiLossListModel());

class ChuiLossList extends ConsumerWidget {

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final stream = watch(chuiLossListProvider);
    if (stream.data == null){
      return Text('Загрузка');
    } else {
      //TODO: make check for empty value
      return ListView.builder(
          itemCount: stream.data.value.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(stream.data.value[index].name),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                  return ChuiLossTable(model: stream.data);
                }),
              );
            },
          );
        }
      );
    }
  }
}
