class FirestorePath {

  static String chui_losses_collection() =>
      'chuiCasesCollection/losses/losses_collection';

  static String chui_loss_table_document(String doc) =>
      '/chuiCasesCollection/losses/losses_collection/$doc/loss_tables_collection/loss_table';
}