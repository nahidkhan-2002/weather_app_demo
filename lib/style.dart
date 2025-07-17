import 'package:flutter/material.dart';

BoxDecoration boxdecorationunique = BoxDecoration(
  // ignore: deprecated_member_use
  gradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomLeft,
    colors: [
      Color(0xFF3D2E5F), // Top: dark navy
      Color(0xFF533595), // Middle: violet
      Color(0xFF9D52AC),
      // Bottom: magenta/purple
    ],
    stops: [0.0, 0.5, 1.0],
  ),
  borderRadius: BorderRadius.circular(300),
);

BoxDecoration boxDecorationregular = BoxDecoration(
  // ignore: deprecated_member_use
  gradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFF533595),
      Color(0xFF3D2E5F), // Top: dark navy
      // Top: dark navy
      // Middle: violet
      // Bottom: magenta/purple
    ],
    stops: [0.1, 1.0],
  ),
  borderRadius: BorderRadius.circular(300),
);

BoxShadow shadowstyle = BoxShadow(
  color: Colors.black26,
  blurRadius: 6,
  offset: Offset(0, 2),
);
