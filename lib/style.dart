import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
  borderRadius: BorderRadius.circular(50),
);
BoxDecoration cardDecoration = BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomLeft,
    colors: [Color(0xFF3D2E8F), Color(0xFF9D52AC)],
    stops: [0.1, 1.0],
  ),
  borderRadius: BorderRadius.circular(20),
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
  borderRadius: BorderRadius.circular(50),
);

BoxShadow shadowstyle = BoxShadow(
  color: const Color.fromARGB(84, 0, 0, 0),
  blurRadius: 6,
  offset: Offset(0, 2),
);

BoxDecoration cardstyle_2 = BoxDecoration(
  // ignore: deprecated_member_use
  gradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomLeft,
    colors: [
      Color(0xFF3E2D8F),
      Color(0xFF9D52AC), // Top: dark navy
      // Top: dark navy
      // Middle: violet
      // Bottom: magenta/purple
    ],
    stops: [0.1, 1.0],
  ),
  border: Border.all(
    color: Color(0xFFF7CBFD), // Black stroke
    width: 1,
  ),
  boxShadow: [shadowstyle],
  borderRadius: BorderRadius.circular(20),
);

TextStyle opensansregular(double value) => GoogleFonts.openSans(
  color: Colors.white,
  fontSize: value,
  fontWeight: FontWeight.w400,
  letterSpacing: 0.47,
);

TextStyle opensanssemibold(double value) => GoogleFonts.openSans(
  color: Colors.white,
  fontSize: value,
  fontWeight: FontWeight.w600,
  letterSpacing: 0.47,
);

TextStyle poppinsregular(double value) => GoogleFonts.poppins(
  color: Colors.white,
  fontSize: value,
  fontWeight: FontWeight.w400,
  letterSpacing: 0.47,
);
