import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mauzy_food/bloc/theme/theme_bloc.dart';
import 'package:mauzy_food/common/styles.dart';

customDialog(BuildContext context, {String? title, String? content}) {
  final isDarkMode = BlocProvider.of<ThemeBloc>(context).state.isDarkmode;
  if (Platform.isIOS) {
    showCupertinoDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text(
            title ?? 'Coming Soon!',
            style: textStyle.copyWith(
              color: isDarkMode ? whiteColor : blackColor,
            ),
          ),
          content: Text(
            content ?? 'This feature will be coming soon!',
            style: textStyle.copyWith(
              color: isDarkMode ? whiteColor : blackColor,
            ),
          ),
          actions: [
            CupertinoDialogAction(
              child: Text(
                'Ok',
                style: textStyle.copyWith(
                  color: isDarkMode ? whiteColor : blackColor,
                ),
              ),
              onPressed: () {
                context.pop();
              },
            ),
          ],
        );
      },
    );
  } else {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'Coming Soon!',
            style: textStyle.copyWith(
              color: isDarkMode ? whiteColor : blackColor,
            ),
          ),
          content: Text(
            'This feature will be coming soon!',
            style: textStyle.copyWith(
              color: isDarkMode ? whiteColor : blackColor,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                context.pop();
              },
              child: Text(
                'Ok',
                style: textStyle.copyWith(
                  color: isDarkMode ? whiteColor : blackColor,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
