import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../core/theming/app_colors.dart';

class AddToFavouriteCircle extends StatefulWidget {
  const AddToFavouriteCircle({
    super.key,
  });

  @override
  State<AddToFavouriteCircle> createState() => _AddToFavouriteCircleState();
}

class _AddToFavouriteCircleState extends State<AddToFavouriteCircle> {
  bool isInFavourites = false;
  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 10.h,
        right: 10.h,
        child: CircleAvatar(
          radius: 17,
          backgroundColor: AppColors.lightGrey,
          child: GestureDetector(
              onTap: () {
                setState(() {
                  isInFavourites = !isInFavourites;
                });
              },
              child: Icon(
                FontAwesomeIcons.heart,
                size: 22.r,
                color: isInFavourites
                    ? AppColors.mainRed
                    : AppColors.darkBlue,
              )),
        ));
  }
}
