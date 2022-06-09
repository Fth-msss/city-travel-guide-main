import 'package:city_travel_guide/firebase/authenticator/authenticate.dart';
import 'package:city_travel_guide/firebase/home/home.dart';
import 'package:flutter/material.dart';
import 'package:city_travel_guide/model/user.dart';
import 'package:provider/provider.dart';



class Wrapper extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    final user = Provider.of<Userer>(context);
    print(user);

    //return either home or auth widget
    if (user== null){
      return Authenticate();
    }else{
      return Home();
    }

  }
}
