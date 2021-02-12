import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class ChuiLossListItemModel extends Equatable {
  final name;
  final pathToTable;
  ChuiLossListItemModel({this.name, this.pathToTable});

  factory ChuiLossListItemModel.fromMap(
                        Map<String, dynamic> data)  {

    if (data == null) {
      return null;
    }

    final name = data['losses_case_name'];
    if (name == null) {
      return null;
    }

  final pathToTable = data['path_to_loss_table'];

  return ChuiLossListItemModel(name: name, pathToTable: pathToTable);
  }

  @override
  // TODO: implement props
  List<Object> get props => [name, pathToTable];

  @override
  bool get stringify => true;
}