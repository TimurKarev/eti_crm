import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eti_crm/models/chui_loss_list_model.dart';
import 'package:eti_crm/screens/home/chui_list.dart';
import 'package:eti_crm/services/auth.dart';
import 'package:eti_crm/services/firestore_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class Home extends StatelessWidget {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return  StreamProvider<ChuiLossListModel>.value(
      value: DatabaseService().chuiLossListModel,
      child: Container(
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
                await _auth.signOut();
              },
            ),
          ],
        ),
        body: ChuiList(),
      ),
      ),
    );
  }
}
