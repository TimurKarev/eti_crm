import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eti_crm/datas/table_data.dart';
import 'package:eti_crm/models/chui_loss_list_model.dart';

import 'firestore_path.dart';

class DatabaseService {
  // collection reference
  final CollectionReference chuiCasesCollection =
        FirebaseFirestore.instance.collection('chuiCasesCollection');
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future updateUserData() async {
    return await chuiCasesCollection
        .doc('bktp_production_headers')
        .collection('loss_tables')
        .doc('loss_table')
        .set(TableData.table_data);
  }

  void createFirstTable() async {
    await chuiCasesCollection
        .doc('losses')
        .collection('losses_collection')
        .doc('bktp_time_losses')
        .set({
          "losses_case_name": "Время на производство БКТП"
        });

    await chuiCasesCollection
        .doc('losses')
        .collection('losses_collection')
        .doc('YBP_time_losses')
        .set({
          "losses_case_name": "Время на производство УВР"
        });

    await chuiCasesCollection
        .doc('losses')
        .collection('losses_collection')
        .doc('bktp_time_losses')
        .collection('loss_tables_collection')
        .doc('loss_table')
        .set(TableData.table_data);
  }

  Future<QuerySnapshot> queryChuiLossList() async {
    return await chuiCasesCollection
        .doc('losses')
        .collection('losses_collection')
        .get();
  }

  Stream<ChuiLossListModel> get chuiLossListModel {
    return _firestore.collection(FirestorePath.chui_losses_collection())
        .snapshots()
        .map(_getChuiLossListModelFromSnapshot);
  }

  ChuiLossListModel _getChuiLossListModelFromSnapshot(
                                      QuerySnapshot snapshot)
  {
      //print(snapshot.docs.toList());
      List<String> list = new List<String>();
      snapshot.docs.forEach((doc) {
        //print(doc.id);
        list.add(doc.data()['losses_case_name']);
      });
      final c = ChuiLossListModel(list: list);
      //print(c.getList());
      return c;
  }
}