import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Utils {
  static const Offset RTL = Offset(1, 0);
  static const Offset LTR = Offset(-1, 0);
  static const Offset UTD = Offset(0, -1);
  static const Offset DTU = Offset(0, 1);

  static Route createRoute(dest, Offset dir) {
    return PageRouteBuilder(
      transitionDuration: Duration(milliseconds: 400),
      opaque: false,
      pageBuilder: (context, animation, secondaryAnimation) => dest,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = dir;
        var end = Offset.zero;
        var curve = Curves.fastOutSlowIn;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  static Route createPopUpRoute(dest) {
    return PageRouteBuilder(
        transitionDuration: Duration(milliseconds: 400),
        pageBuilder: (context, animation, secondaryAnimation) => dest,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          double begin = 0;
          double end = 1;
          var curve = Curves.fastOutSlowIn;

          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

          return ScaleTransition(
            scale: animation.drive(tween),
            child: child,
          );
        },
        opaque: false);
  }

  static showLoadingDialog(BuildContext context, String title) {
    showDialog(
      context: context,
      barrierDismissible: kDebugMode,
      builder: (BuildContext context) {
        return PopScope(
          canPop: false,
          child: SimpleDialog(
            contentPadding: const EdgeInsets.all(4),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            backgroundColor: Colors.white70,
            children: <Widget>[
              Container(
                color: Colors.transparent,
                padding: const EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    SizedBox(
                      width: 16,
                    ),
                    Text(
                      title,
                      style: const TextStyle(fontSize: 16),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  static Future<bool>? showdialog(
      BuildContext context, String title, String message) async {
    FocusScope.of(context).unfocus();
    return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            /*TextButton(
              child: Text("No"),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),*/
            TextButton(
              child: Text("Ok"),
              onPressed: () {
                Navigator.of(context).pop(true);
                // return true;
              },
            ),
          ],
        );
      },
    );
  }

  static Future<bool>? showSuccessDialog(BuildContext context, String title,
      String message, Color? color, Color bg, onOkPressed) async {
    return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Text(
            title,
            style: TextStyle(color: color ?? Colors.green),
          ),
          content: Text(
            message,
            style: TextStyle(fontSize: 14),
          ),
          actions: <Widget>[
            TextButton(
              child: Text("Ok"),
              onPressed: onOkPressed,
            ),
          ],
        );
      },
    );
  }

  static Future<dynamic>? showErrorDialog(
      BuildContext context, String title, String message) async {
    return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Text(
            title,
            style: TextStyle(color: Colors.red),
          ),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: Text("Ok"),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      },
    );
  }

  static String formattedDateTime(int timestamp) {
    DateTime i = DateTime.fromMillisecondsSinceEpoch(timestamp);
    return "${[
      "Jan",
      "Feb",
      "Mar",
      "Apr",
      "May",
      "Jun",
      "Jul",
      "Aug",
      "Sep",
      "Oct",
      "Nov",
      "Dec"
    ][i.month - 1]} ${i.day}, ${i.year} at ${i.hour}:${i.minute}:${i.second} ${i.timeZoneName} UTC${i.timeZoneOffset.isNegative ? "-" : "+"}${i.timeZoneOffset.inMinutes ~/ 60}:${(i.timeZoneOffset.inMinutes % 60).toInt()}";
  }
}
