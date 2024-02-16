import 'package:demo_app/styles/theme.color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Tdialog {
  //-------Dialog Info........
  static Future<dynamic> infoDialog(
    BuildContext context,
    Widget detail,
    Function accept,
    Function cancel,
  ) {
    return showCupertinoDialog(
      context: context,
      builder: (_) => CupertinoAlertDialog(
        content: detail,
        actions: [
          CupertinoButton(
            child: Text(
              "Cancel",
              style: TextStyle(
                  color: ThemeColorApp().primaryColor,
                  fontFamily: 'Prompt',
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0),
            ),
            onPressed: () {
              cancel();
            },
          ),
          CupertinoButton(
            child: Text(
              "Ok",
              style: TextStyle(
                  color: ThemeColorApp().primaryColor,
                  fontFamily: 'Prompt',
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0),
            ),
            onPressed: () {
              accept();
            },
          )
        ],
      ),
    );
  }

  //-------Dialog success........
  static Future<dynamic> successDialog(
    BuildContext context,
    String title,
    String detail,
    Function func,
  ) {
    return showCupertinoDialog(
      context: context,
      builder: (_) => CupertinoAlertDialog(
        content: Container(
          alignment: Alignment.center,
          height: 100.0,
          child: Text(
            detail,
            style: TextStyle(
                color: ThemeColorApp().secondaryColor,
                fontFamily: 'Prompt',
                fontWeight: FontWeight.w100,
                fontSize: 16.0),
          ),
        ),
        actions: [
          // Close the dialog
          CupertinoButton(
            child: Text(
              "Ok",
              style: TextStyle(
                  color: ThemeColorApp().primaryColor,
                  fontFamily: 'Prompt',
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0),
            ),
            onPressed: () {
              func();
            },
          )
        ],
      ),
    );
  }

  //-------Dialog Error........
  static Future<dynamic> errorDialog(
    BuildContext context,
    String detail,
    Function func,
  ) {
    return showCupertinoDialog(
      context: context,
      builder: (_) => CupertinoAlertDialog(
        content: Container(
          alignment: Alignment.center,
          height: 240.0,
          width: 240,
          child: Text(
            detail,
            style: TextStyle(
                color: ThemeColorApp().secondaryColor,
                fontFamily: 'Prompt',
                fontWeight: FontWeight.w100,
                fontSize: 16.0),
          ),
        ),
        actions: [
          // Close the dialog
          CupertinoButton(
            child: Text(
              "Ok",
              style: TextStyle(
                  color: ThemeColorApp().primaryColor,
                  fontFamily: 'Prompt',
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0),
            ),
            onPressed: () {
              func();
            },
          )
        ],
      ),
    );
  }
}
