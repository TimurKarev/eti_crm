import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eti_crm/datas/table_data.dart';
import 'package:eti_crm/models/chui_loss_list_model.dart';

import 'firestore_path.dart';
import 'firestore_srvice.dart';

class ChuiLossListVM {

  final _service = FirestoreService.instance;
  // void createFirstTable() async {
  //   await chuiCasesCollection
  //       .doc('losses')
  //       .collection('losses_collection')
  //       .doc('bktp_time_losses')
  //       .set({
  //         "losses_case_name": "Время на производство БКТП"
  //       });
  //
  //   await chuiCasesCollection
  //       .doc('losses')
  //       .collection('losses_collection')
  //       .doc('YBP_time_losses')
  //       .set({
  //         "losses_case_name": "Время на производство УВР"
  //       });
  //
  //   await chuiCasesCollection
  //       .doc('losses')
  //       .collection('losses_collection')
  //       .doc('bktp_time_losses')
  //       .collection('loss_tables_collection')
  //       .doc('loss_table')
  //       .set(TableData.table_data);
  // }

  Stream<List<ChuiLossListItemModel>> getChuiLossListModel() =>
      _service.collectionStream(
        path: FirestorePath.chui_losses_collection(),
        builder: (data) => ChuiLossListItemModel.fromMap(data),
      );
}