import 'dart:ui';

import 'package:flutter/material.dart';

class ButtonWidets extends StatelessWidget {
  Function()? tasZ;
  IconData pic;
  ButtonWidets({super.key, required this.tasZ, required this.pic});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: tasZ,
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.grey.shade200.withOpacity(0.3)),
            child: Center(child: Icon(pic)),
          ),
        ),
      ),
    );
  }
}
