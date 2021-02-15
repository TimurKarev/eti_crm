import 'package:eti_crm/models/chui_loss_table_model.dart';

import 'firestore_path.dart';
import 'firestore_service.dart';

class ChuiLossTableVM {
  final _service = FirestoreService.instance;

  Stream<ChuiLossTableModel> getChuiLossTableModel(id) =>
      _service.documentStream(
          path: FirestorePath.chui_loss_table_document(id),
          builder: (data) => ChuiLossTableModel.fromMap(data)
      );

  Future<void> setTable(ChuiLossTableModel table, path) => _service.setData(
    path: FirestorePath.chui_loss_table_document(path),
    data: table.createSample(),
  );
}