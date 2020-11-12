import 'package:flutter/material.dart';
import 'package:gestao_usuario/app/utils/color.dart';

class CustomFlatButton extends StatelessWidget {
  CustomFlatButton({
    @required this.text,
    @required this.onPressed,
    this.heroTag,
    this.width,
    this.textStyle,
    this.backgroundColor: primaryColor,
    this.padding: const EdgeInsets.symmetric(
      horizontal: 80,
      vertical: 14,
    ),
    this.border,
  });

  final String text;
  final Function onPressed;
  final String heroTag;
  final double width;
  final TextStyle textStyle;
  final Color backgroundColor;
  final EdgeInsets padding;
  final Border border;

  @override
  Widget build(BuildContext context) {
    final Widget button = Material(
      type: MaterialType.transparency,
      child: InkWell(
        borderRadius: BorderRadius.circular(4),
        child: Ink(
          width: width,
          padding: padding,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(4),
            border: border,
          ),
          child: Text(
            text ?? "",
            textAlign: TextAlign.center,
          ),
        ),
        onTap: onPressed,
      ),
    );

    if (heroTag != null) {
      return Hero(
        transitionOnUserGestures: true,
        tag: heroTag,
        child: button,
      );
    }

    return button;
  }
}
