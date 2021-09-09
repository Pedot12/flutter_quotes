import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quotes/widgets/failure_widget.dart';

void showFailureDialog({
   BuildContext context,
   Function close,
   String message,
}) {
  showGeneralDialog(
    barrierLabel: 'Filter',
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.5),
    useRootNavigator: false,
    context: context,
    transitionBuilder: (_, __, ___, ____) => Scaffold(
      backgroundColor: Colors.transparent,
      body: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Align(
          alignment: Alignment.center,
          child: FailureWidget(close: close, message: message),
        ),
      ),
    ),
    transitionDuration: const Duration(milliseconds: 100),
    pageBuilder: (_, __, ___) => Container(),
  );
}
