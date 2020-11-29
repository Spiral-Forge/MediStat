import 'package:dbapp/shared/colors.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color:AppColors.mediLGrey,
      child:Center(
        child:SpinKitChasingDots(
          color:AppColors.mediBlue,
          size:50.0,
        )
      )
    );
  }
}