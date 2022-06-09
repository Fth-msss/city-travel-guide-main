import 'package:city_travel_guide/model/yoru.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class YorumList extends StatefulWidget {


  @override
  State<YorumList> createState() => _YorumListState();
}

class _YorumListState extends State<YorumList> {
  @override
  Widget build(BuildContext context) {

    final yorums = Provider.of<List<Yorum>>(context);



    return Container();
  }
}
