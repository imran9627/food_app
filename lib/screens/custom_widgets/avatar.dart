import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  final double? radius;
  final Widget child;
  const Avatar({Key? key, this.radius, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      child: child,
    );
  }
}
