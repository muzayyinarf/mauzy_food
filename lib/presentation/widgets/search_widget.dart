import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mauzy_food/bloc/theme/theme_bloc.dart';
import 'package:mauzy_food/common/styles.dart';
import 'package:mauzy_food/presentation/widgets/platform_widget.dart';

class SearchWidget extends StatelessWidget {
  final void Function(String)? onSubmitted;

  const SearchWidget({super.key, this.onSubmitted});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: PlatformWidget(
        androidBuilder: _buildAndroid,
        iosBuilder: _buildIos,
      ),
    );
  }

  Widget _buildIos(context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return CupertinoTextField(
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.search,
          style: textStyle.copyWith(
              color: state.isDarkmode ? whiteColor : blackColor),
          cursorColor: CupertinoColors.systemGrey,
          placeholder: 'Type your search here',
          prefix: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              CupertinoIcons.search,
              color: CupertinoColors.systemGrey,
            ),
          ),
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: state.isDarkmode ? backgroundDarkModeColor : backgroundColor,
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(
              color: state.isDarkmode ? blueColor : purpleColor,
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
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.search,
          cursorColor: Colors.grey.shade700,
          showCursor: true,
          onSubmitted: onSubmitted,
          style: TextStyle(color: state.isDarkmode ? whiteColor : blackColor),
          decoration: InputDecoration(
            hintText: 'Type your search here',
            prefixIcon: const Icon(Icons.search),
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
