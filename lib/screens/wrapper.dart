import 'package:eti_crm/models/user.dart';
import 'package:flutter/material.dart';

import 'package:eti_crm/screens/home/home.dart';
import 'package:provider/provider.dart';

import 'authenticate/authenticate.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<EtiUser>(context);
    //print(user);

    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
