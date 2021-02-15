import 'package:eti_crm/models/chui_loss_table_model.dart';
import 'package:eti_crm/services/global_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final chuiLossTableProvider = StreamProvider.autoDispose.family<ChuiLossTableModel, String>((ref, id) {
  final data = ref.watch(vmProvider);
  return data.getChuiLossTableModel(id);
});


class ChuiLossTable extends ConsumerWidget {

  final model;
  ChuiLossTable({this.model});

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final stream = watch(chuiLossTableProvider('bktp_time_losses'));
    if (stream.data == null) {
      return Text('Загрузка');
    } else {
      ChuiLossTableModel model = stream.data.value;
      return SingleChildScrollView(
        child: DataTable(
            columns: [for (var col in model.columns) DataColumn(label: Text(col))],
            rows: [ for (var row in model.rows)
              DataRow(cells: [for (var cell in row)  DataCell(Text(cell.toString())),
              ]),
            ],
          ),
      );
    }
  }
}
