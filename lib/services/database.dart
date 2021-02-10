import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eti_crm/datas/table_data.dart';

class DatabaseService {
  // collection reference
  final CollectionReference chuiCasesCollection =
        FirebaseFirestore.instance.collection('chuiCasesCollection');

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

  Future<QuerySnapshot> queryTest() async {
    return await chuiCasesCollection
        .doc('losses')
        .collection('losses_collection')
        .get();

    }
}