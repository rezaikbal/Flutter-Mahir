import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const API_KEY = "api_key=cd45fc4a5ba70bca58dff50e93884d4f";

const BASE_IMAGE_URL = 'https://image.tmdb.org/t/p/w500';

const BASE_URL = "https://api.themoviedb.org/3";

///colors
const Color kRichBlack = Color(0xFF191414);
const Color kFordBlue = Color(0xFF001d3d);

const Color kGreen = Color(0xFF1DB954);
const Color kGreen2 = Color(0xFF1ED761);
const Color Grey = Color(0xFF4b5358);
const Color kGrey = Color(0xFF303030);
const Color kYellow = Color(0XFFFF9529);

///style text
final TextStyle Heading5 =
    GoogleFonts.poppins(fontSize: 23, fontWeight: FontWeight.w400);
final TextStyle Heading6 = GoogleFonts.poppins(
    fontSize: 19, fontWeight: FontWeight.w500, letterSpacing: 0.15);
final TextStyle subtitle = GoogleFonts.poppins(
    fontSize: 15, fontWeight: FontWeight.w400, letterSpacing: 0.15);
final TextStyle bodyText = GoogleFonts.poppins(
    fontSize: 13, fontWeight: FontWeight.w400, letterSpacing: 0.25);

///text theme
final textTheme = TextTheme(
  headline5: Heading5,
  headline6: Heading6,
  subtitle1: subtitle,
  bodyText2: bodyText,
);

const kColorScheme = ColorScheme(
    primary: kGreen,
    secondary: kGreen2,
    surface: kRichBlack,
    background: kRichBlack,
    error: Colors.red,
    onPrimary: kRichBlack,
    onSecondary: Colors.white,
    onSurface: Colors.white,
    onBackground: Colors.white,
    onError: Colors.white,
    brightness: Brightness.dark);
