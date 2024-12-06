import 'package:flutter/material.dart';

/// Calcula la altura visible de la pantalla excluyendo el BottomNavBar y el SafeArea.
double getVisibleHeight(BuildContext context, {double bottomNavBarHeight = 72}) {
  final mediaQuery = MediaQuery.of(context);
  return mediaQuery.size.height - mediaQuery.padding.top - bottomNavBarHeight;
}
