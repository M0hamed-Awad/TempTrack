import 'dart:ui';

import 'package:flutter/material.dart';

class ColoredBackground extends StatelessWidget {
  const ColoredBackground({
    super.key,
    required this.childWidget,
  });

  final Widget childWidget;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 3,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColorDark,
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height / 3,
          margin: EdgeInsets.only(
            top: MediaQuery.of(context).size.height / 3,
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height / 3,
          margin: EdgeInsets.only(
            top: (MediaQuery.of(context).size.height / 3) * 2,
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColorLight,
          ),
        ),
        BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 100,
            sigmaY: 100,
          ),
          child: Container(
            color: Colors.transparent,
          ),
        ),
        childWidget,
      ],
    );
  }
}
