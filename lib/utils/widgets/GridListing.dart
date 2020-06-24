import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:saws/model/Models.dart';
import 'package:saws/utils/Widget.dart';

import '../Colors.dart';
import '../Constant.dart';

class GridListing extends StatelessWidget {
  List<Category> mFavouriteList;
  var isScrollable=false;

  GridListing(this.mFavouriteList,this.isScrollable);
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return  GridView.builder(
        scrollDirection: Axis.vertical,
        physics: isScrollable?ScrollPhysics():NeverScrollableScrollPhysics(),
        itemCount: mFavouriteList.length,
        gridDelegate:
        new SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,crossAxisSpacing: 16,mainAxisSpacing: 16),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: (){

            },
            child: Container(
              alignment: Alignment.center,
              decoration: boxDecoration(radius: 10,showShadow: true,bgColor: White),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: width/7.5,
                    width: width/7.5,
                    margin: EdgeInsets.only(bottom: 4,top: 8),
                    padding: EdgeInsets.all(width/30),
                    decoration: boxDecoration(bgColor: mFavouriteList[index].color,radius: 10),
                    child: SvgPicture.asset(mFavouriteList[index].icon,color: White,),
                  ),
                  text(mFavouriteList[index].name,fontSize: textSizeMedium)
                ],
              ),
            ),
          );
        });
  }
}