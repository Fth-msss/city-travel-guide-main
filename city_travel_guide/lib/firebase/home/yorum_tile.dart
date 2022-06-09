import 'package:flutter/material.dart';
import 'package:city_travel_guide/model/yoru.dart';

class YorumTile extends StatelessWidget {
 final Yorum yorum;
 YorumTile({this.yorum});

  @override
  Widget build(BuildContext context) {
    return Padding(padding:
    EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20, 0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.brown[yorum.strength],
          ),
          title:Text(yorum.name),
          subtitle:Text(' ${yorum.sugars} stars'),
        ),
      ),
    );
  }
}
