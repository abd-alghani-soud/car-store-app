import 'package:car_store_app/core/constants/my_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentGeometry.bottomCenter,
      child: Center(
        child: SpinKitFadingCircle(
          color:MyColor.primaryColor,
          size: 60.0,
        ),
      ),
    );
  }
}
