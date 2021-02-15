import 'package:equatable/equatable.dart';
import 'package:eti_crm/datas/table_data.dart';

class ChuiLossTableModel extends Equatable {

  final columns;
  final rows;

  ChuiLossTableModel({this.columns, this.rows});

  factory ChuiLossTableModel.fromMap(Map<String, dynamic> data) {

    if (data == null) {
      print('NULL');
      return null;
    }

    final table = data['table'];
    //print("table  " + table.toString());
    List<dynamic> cols = table['columns'];

    List<dynamic> rows = table['rows'];

    List<List<dynamic>> out_rows =
      List<List<dynamic>>.filled(
          rows.length,
          List<dynamic>.filled(cols.length, 'Empty')
      );

    for (var r=0; r<rows.length; r++) {
      List<dynamic> cells = List<dynamic>.filled(cols.length, 'Empty');
      for (var i = 0; i<cols.length; i++) {
        try {
          cells[i] = rows[r][cols[i]];
        } catch (e){
          print (e.toString());
        }
      }
      out_rows[r] = cells;
    }
    return ChuiLossTableModel(columns: cols, rows: out_rows);
  }

  Map<String, dynamic> createSample() {
    return TableData.table_data;
  }

  @override
  // TODO: implement props
  List<Object> get props => [columns, rows];

  @override
  bool get stringify => true;


}