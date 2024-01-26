import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mauzy_food/bloc/theme/theme_bloc.dart';
import 'package:mauzy_food/common/styles.dart';

void showCustomSnackbar(BuildContext context,
    {String? title, String? content}) {
  final isDarkMode = BlocProvider.of<ThemeBloc>(context).state.isDarkmode;
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        content ?? 'Coming Soon!',
        style: textStyle.copyWith(color: isDarkMode ? blackColor : whiteColor),
      ),
      duration: const Duration(milliseconds: 1000),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      backgroundColor: isDarkMode ? blueColor : purpleColor,
      action: SnackBarAction(
        label: 'OK',
        onPressed: () {},
      ),
    ),
  );
}
