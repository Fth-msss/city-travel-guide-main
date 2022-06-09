import 'package:city_travel_guide/firebase/shard/loading.dart';
import 'package:city_travel_guide/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:city_travel_guide/firebase/shard/constants.dart';


class Register extends StatefulWidget {

  final Function toggleView;
  Register({this.toggleView});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth= AuthService();
  final _formkey = GlobalKey<FormState>();
  bool loading = false;
  // text field state
  String email = '';
  String password= '';
  String error='';

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text('register to app'),
        actions: <Widget>[
          FlatButton.icon (
            icon: Icon(Icons.person),
            label: Text('sign in'),
            onPressed: (){
              widget.toggleView();
            },
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 50.0),
        child: Form(
          key: _formkey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0,),
              TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: 'Email'),
                  validator: (val) =>val.isEmpty ? 'Enter an email':null,
                  onChanged: (val){
                    setState(()=> email = val);

                  }

              ),
              SizedBox(height: 20.0,),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Password'),
                obscureText: true,
                validator: (val) =>val.length<6 ? 'pw must be 6+ chars long':null,
                onChanged: (val){
                  setState(()=> password = val);
                },
              ),
              SizedBox(height: 20.0,),
              RaisedButton(
                color:Colors.pink[400],
                child: Text(
                  'register',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async{
                  if (_formkey.currentState.validate()){
                    setState(()=> loading = true);
                    dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                    if(result==null){
                      setState((){
                        error='plas supply valid email';
                        loading = false;
                      });
                    }
                  }
                },
              ),
              SizedBox(height: 12.0,),
              Text(
                error,
                style: TextStyle(color: Colors.red,fontSize: 14.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}
