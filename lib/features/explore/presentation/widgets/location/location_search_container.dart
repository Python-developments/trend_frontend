/*
import 'package:flutter/material.dart';


import '../../../data/models/local/location_details.dart';

class LocationSearchContainer extends StatelessWidget {
  const LocationSearchContainer({Key? key, required this.model})
      : super(key: key);
  final LocationDetails model;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppStyle.white,
      child: ListTile(
        contentPadding:
            EdgeInsets.symmetric(horizontal: 13, vertical: 7),
        leading: CircleAvatar(
          backgroundColor:AppStyle.black.shade100 ,
            radius: 24, 
          child: Icon(Icons.location_on_outlined),
        ),
        title: Text(
          model.location_name,
          style: AppStyle.styleBold16,
        ),
        subtitle: Text(
          model.description,
          style: AppStyle.textTheme!.bodySmall!.copyWith(
              color: AppStyle.black.shade400,
          )),
        ),
        horizontalTitleGap: 14,
        minTileHeight: 60,
        onTap: () {
          // Handle item tap
        },
      ),
    );
  }
}
*/
