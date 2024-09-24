import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theming/app_colors.dart';

class AddToCartCircle extends StatefulWidget {
  const AddToCartCircle({
    super.key,
  });

  @override
  State<AddToCartCircle> createState() => _AddToCartCircleState();
}

class _AddToCartCircleState extends State<AddToCartCircle> {
  bool isInCart=false;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 14,
      backgroundColor: AppColors.darkBlue,
      child: GestureDetector(onTap: () {
        setState(() {
          isInCart=!isInCart;
        });
      },child: Icon(isInCart? Icons.check:Icons.add,size: 24.r,color: AppColors.mainWhite,)),
    );
  }
}
