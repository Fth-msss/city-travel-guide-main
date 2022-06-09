import 'package:city_travel_guide/firebase/home/settings_form.dart';
import 'package:city_travel_guide/model/yoru.dart';
import 'package:city_travel_guide/services/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:city_travel_guide/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:city_travel_guide/services/database.dart';
import 'package:city_travel_guide/firebase/home/yorum_list.dart';

class Home extends StatelessWidget {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {

    void _showSettingsPanel(){
      showModalBottomSheet(context: context, builder:(context){
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 60.0),
          child: SettingsForm(),
        );
      });

    }

    return StreamProvider<List<Yorum>>.value(
      value: DatabaseService().yorums,
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text('why'),
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(icon:Icon(Icons.person),//put this button on app
            label:Text('logout'),
            onPressed:() async {
              await _auth.signOut();

            },
            ),
            FlatButton.icon(
              icon :Icon(Icons.settings),
             label:Text('settings'),
             onPressed:()=> _showSettingsPanel(),
            ),

          ],
        ),
        body: YorumList(),
      ),
    );
  }
}
