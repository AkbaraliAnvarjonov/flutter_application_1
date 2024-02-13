import 'dart:ui';

import 'package:flutter/material.dart';

class ModalProgressHUD extends StatelessWidget {
  const ModalProgressHUD({
    super.key,
    this.inAsyncCall = false,
    this.progressIndicator = const CircularProgressIndicator.adaptive(),
    required this.child,
  });

  final bool inAsyncCall;
  final Widget progressIndicator;
  final Widget child;

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          Positioned.fill(
            child: IgnorePointer(ignoring: inAsyncCall, child: child),
          ),
          if (inAsyncCall)
            Align(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 4,
                  sigmaY: 4,
                ),
                child: progressIndicator,
              ),
            ),
        ],
      );
}
