import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ManageMenus extends StatefulWidget {
  @override
  _ManageMenusState createState() => _ManageMenusState();
}

class _ManageMenusState extends State<ManageMenus> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
  getData() async {
    return await Firestore.instance.collection('foods').getDocuments();
  }
}
