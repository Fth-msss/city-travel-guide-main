import 'package:flutter/material.dart';
import 'package:city_travel_guide/firebase/shard/constants.dart';

class SettingsForm extends StatefulWidget {

  @override
  State<SettingsForm> createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formkey = GlobalKey<FormState>();
  final List<String> sugars = ['1','2','3','4','5'];

  //form values
  String _currentName;
  String _currentSugars;
  int _currentStrength;
  String _currentYorumContent;


  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Column(
        children: <Widget>[
          Text('yorum yap', style: TextStyle(fontSize: 18.0)),
          SizedBox(height: 20.0),
          TextFormField(
            decoration: textInputDecoration.copyWith(hintText: 'name'),
            validator: (val)=> val.isEmpty ? 'pls enter your name' :null,
            onChanged: (val)=>setState(()=>_currentName=val),
          ),
          SizedBox(height:20.0),

          TextFormField(
            decoration: textInputDecoration.copyWith(hintText: 'yorum'),
            validator: (val)=> val.isEmpty ? 'pls yorum yapin' :null,
            onChanged: (val)=>setState(()=>_currentYorumContent=val),
          ),
          SizedBox(height:20.0),

          DropdownButtonFormField<String>(
            hint: Text('yıldız'),
            items: sugars.map((sugar) {
              return DropdownMenuItem(
                value: sugar,
                child: Text("$sugar yıldız"),
              );
            }).toList(),
            onChanged: (val) => setState(() => _currentSugars = val),
          ),

          RaisedButton(
            color: Colors.pink[400],
            child: Text(
              'Update',
              style: TextStyle(color:Colors.white),
            ),
            onPressed: () async{
              print(_currentName);
              print(_currentSugars);
              print(_currentYorumContent);
            },

          )
        ],
      ),


    );
  }
}
