import 'package:dialog/my_dialog.dart';
import 'package:flutter/material.dart';

class MyDialog extends StatelessWidget {
  final Color dialogBackgroundColor;
  final Color avatarColor;
  final Widget negativeActionChild;
  final Widget positiveActionChild;

  final Color negativeActionColor;
  final Color positiveActionColor;

  final Widget title;

  final Widget body;

  final GestureTapCallback positiveActionOnPress;
  final GestureTapCallback negativeActionOnPress;

  const MyDialog({
    this.avatarColor = const Color.fromARGB(255, 151, 177, 190),
    required this.negativeActionChild,
    required this.positiveActionChild,
    this.dialogBackgroundColor = Colors.white,
    this.negativeActionColor = const Color.fromARGB(255, 151, 177, 190),
    this.positiveActionColor = const Color.fromARGB(255, 151, 177, 190),
    this.title = const SizedBox(),
    this.body = const SizedBox(),
    required this.positiveActionOnPress,
    required this.negativeActionOnPress,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;

    var dialogHeight = height * 0.4;
    var dialogWidth = width * 0.8;
    return Center(
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          ClipPath(
            clipper: DialogClipper(),
            child: Container(
              width: dialogWidth,
              height: dialogHeight,
              decoration: BoxDecoration(
                  color: dialogBackgroundColor,
                  borderRadius: BorderRadius.circular(10)),
            ),
          ),
          Positioned(
            top: dialogHeight * 0.35,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: dialogWidth * 0.8,
                maxHeight: dialogHeight * 0.1,
              ),
              child: Builder(
                builder: (context) => title,
              ),
            ),
          ),
          Positioned(
            top: dialogHeight * 0.5,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: dialogWidth * 0.8,
                maxHeight: dialogHeight * 0.35,
              ),
              child: Builder(
                builder: (context) => body,
              ),
            ),
          ),
          Positioned(
            left: dialogWidth * 0.315,
            bottom: dialogHeight * 0.7,
            child: Container(
              width: dialogWidth * 0.36,
              height: dialogHeight * 0.36,
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: avatarColor),
            ),
          ),
          Positioned(
            left: dialogWidth * 0.13,
            top: dialogHeight * 0.95,
            child: GestureDetector(
              onTap: negativeActionOnPress,
              child: DialogButton(
                  width: dialogWidth * 0.26,
                  height: dialogWidth * 0.09,
                  color: negativeActionColor,
                  child: Center(child: negativeActionChild)),
            ),
          ),
          Positioned(
              left: dialogWidth * 0.61,
              top: dialogHeight * 0.95,
              child: GestureDetector(
                onTap: positiveActionOnPress,
                child: DialogButton(
                    width: dialogWidth * 0.26,
                    height: dialogWidth * 0.09,
                    color: positiveActionColor,
                    child: Center(child: positiveActionChild)),
              )),
        ],
      ),
    );
  }
}
