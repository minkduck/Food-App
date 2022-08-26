import 'package:flutter/material.dart';
import 'package:food_delivery/utils/app_layout.dart';
import 'package:gap/gap.dart';

class NoDataPage extends StatelessWidget {
  final String text;
  final String imgPath;
  const NoDataPage({Key? key,
    required this.text,
    required this.imgPath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(imgPath,
          height: AppLayout.getSize(context).height*0.22,
          width: AppLayout.getSize(context).width*0.22,
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: AppLayout.getSize(context).height*0.0175,
            color: Theme.of(context).disabledColor
          ),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
