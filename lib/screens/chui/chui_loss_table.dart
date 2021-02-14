import 'package:eti_crm/models/chui_loss_list_model.dart';
import 'package:eti_crm/models/chui_loss_table_model.dart';
import 'package:eti_crm/services/firestore_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final chuiLossTableProvider = StreamProvider.autoDispose.family<ChuiLossTableModel, String>((ref, id) =>
    ChuiLossListVM().getChuiLossTableModel(id));


class ChuiLossTable extends ConsumerWidget {

  final model;
  ChuiLossTable({this.model});

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final stream = watch(chuiLossTableProvider('bktp_time_losses'));

    if (stream.data == null){
      return Text('dksl;a');
    } else {
      ChuiLossTableModel model = stream.data.value;
      final row_num = model.rows.length;
      return DataTable(
        columns: [for (var col in model.columns) DataColumn(label: Text(col))],
        rows: [ for (var row in model.rows)
          DataRow(cells: [for (var cell in row)  DataCell(Text(cell.toString())),
          ]),
        ],
      );
    }
  }
}
