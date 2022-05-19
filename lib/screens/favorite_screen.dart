import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking/screens/property_details.dart';
import 'package:hotel_booking/screens/root_app.dart';

import 'package:hotel_booking/theme/color.dart';
import 'package:hotel_booking/utils/data.dart';
import 'package:hotel_booking/utils/data2.dart';

import 'package:hotel_booking/widgets/feature_item.dart';


class Favorite extends StatefulWidget {
  Favorite({ Key? key }) : super(key: key);
   static const routeName= 'favorite_screen';
     static List favoriteDataList = [];
  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
   
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
            leading: IconButton(icon: Icon(Icons.arrow_back_ios, color: green,),
         onPressed: () => Get.back()),
            title:  Text('Favorite', style: TextStyle(fontSize: 22, color: Colors.black),),
         
           ),
            SliverList(delegate: SliverChildListDelegate([
            
           SizedBox(height: 10,),
            
          Favorite.favoriteDataList.isEmpty? const Center(child: Text('you have no favorites yet !'),) :
             getFeature()

            ]
            )) ],
      ),
      
    );
  }
  getFeature() {
    return CarouselSlider(
      options: CarouselOptions(
        height: 300,
        enlargeCenterPage: true,
        disableCenter: true,
        viewportFraction: .75,
        enableInfiniteScroll: false,
      ),
      items: List.generate(
        Favorite.favoriteDataList.length,
        (index) => FeatureItem( data: Favorite.favoriteDataList[index],
        onTapFavorite:  () {
            setState(() {
              features[index]['is_favorited']= !features[index]['is_favorited'];
               });
              
                features[index]["is_favorited"] ?  Favorite.favoriteDataList.add(features[index]["id"]) :
                 Favorite.favoriteDataList.remove(Favorite.favoriteDataList[index]);
               
             
          },
          onTap: ()=> Get.to(DetailsScreen(house:  houseList[index])),
        )
      ),
    );
  }
  



  
}