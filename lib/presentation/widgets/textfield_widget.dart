import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mauzy_food/bloc/theme/theme_bloc.dart';
import 'package:mauzy_food/common/styles.dart';
import 'package:mauzy_food/presentation/widgets/platform_widget.dart';

class TextFieldWidget extends StatelessWidget {
  final String hint;
  final int? maxLines;
  final TextEditingController? controller;
  final void Function(String)? onSubmitted;

  const TextFieldWidget({
    super.key,
    required this.hint,
    this.maxLines = 1,
    this.onSubmitted,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      androidBuilder: _buildAndroid,
      iosBuilder: _buildIos,
    );
  }

  Widget _buildIos(context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return CupertinoTextField(
          controller: controller,
          keyboardType: TextInputType.text,
          cursorColor: CupertinoColors.systemGrey,
          maxLines: maxLines,
          placeholder: hint,
          padding: const EdgeInsets.all(10.0),
          style: textStyle.copyWith(
              color: state.isDarkmode ? whiteColor : blackColor),
          decoration: BoxDecoration(
            color: state.isDarkmode ? backgroundDarkModeColor : backgroundColor,
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(
              color: state.isDarkmode ? blueColor : blackColor,
              width: 1,
            ),
          ),
          onSubmitted: onSubmitted,
        );
      },
    );
  }

  Widget _buildAndroid(context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return TextField(
          controller: controller,
          keyboardType: TextInputType.text,
          cursorColor: Colors.grey.shade700,
          showCursor: true,
          onSubmitted: onSubmitted,
          maxLines: maxLines,
          style: textStyle.copyWith(
              color: state.isDarkmode ? whiteColor : blackColor),
          decoration: InputDecoration(
            hintText: hint,
            border: OutlineInputBorder(
              borderSide: BorderSide(
                  color: state.isDarkmode ? whiteColor : blackColor, width: 1),
              borderRadius: const BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: state.isDarkmode ? whiteColor : blackColor, width: 1),
              borderRadius: const BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: state.isDarkmode ? blueColor : purpleColor, width: 1),
              borderRadius: const BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
          ),
        );
      },
    );
  }
}
