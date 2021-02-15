import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eti_crm/models/chui_loss_list_model.dart';
import 'package:eti_crm/models/chui_loss_table_model.dart';
import 'package:eti_crm/screens/chui/chui_loss_list.dart';
import 'package:eti_crm/services/auth.dart';
import 'package:eti_crm/services/chui_loss_table_view_model.dart';
import 'package:eti_crm/services/firestore_database.dart';
import 'package:eti_crm/services/global_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class Home extends ConsumerWidget  {

//  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    //final prov = watch(vmProvider);
   // prov.setTable(ChuiLossTableModel(), 'bktp_time_losses');
    return  Container(
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text('Brew Crew'),
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          actions: <Widget>[
            TextButton.icon(
              icon: Icon(Icons.person),
              label: Text('logout'),
              onPressed: () async {
                //await _auth.signOut();
              },
            ),
          ],
        ),
        body: ChuiLossList(),
      ),
    );
  }
}
