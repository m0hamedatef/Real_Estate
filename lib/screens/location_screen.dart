import 'package:flutter/material.dart';
import 'package:hotel_booking/theme/color.dart';


class Location extends StatefulWidget {
  const Location({ Key? key }) : super(key: key);

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  
  @override
  Widget build(BuildContext context) {
    
   return Scaffold(
      backgroundColor: appBgColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: appBarColor,
            pinned: true,
            snap: true,
            toolbarHeight: 80,
            floating: true,
            leading: Icon(Icons.place, color: greenO,),
            title:  Text('Near by ', style:  TextStyle(fontSize: 22, color: Colors.black),)
         
           ),
            SliverList(delegate: SliverChildListDelegate([
            
           SizedBox(height: 10,),
            Center(child: Text('open location'),)
            ]
            )) ],
      ),
    );
  }
}