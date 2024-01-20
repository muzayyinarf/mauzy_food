import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mauzy_food/presentation/widgets/platform_widget.dart';

class SearchWidget extends StatelessWidget {
  final void Function(String)? onSubmitted;

  const SearchWidget({
    Key? key,
    this.onSubmitted,
  }) : super(key: key);

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
    return CupertinoTextField(
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.search,
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
        color: CupertinoColors.white,
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: CupertinoColors.black,
          width: 1,
        ),
      ),
      onSubmitted: onSubmitted,
    );
  }

  Widget _buildAndroid(context) {
    return TextField(
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.search,
      cursorColor: Colors.grey.shade700,
      showCursor: true,
      onSubmitted: onSubmitted,
      decoration: const InputDecoration(
        hintText: 'Type your search here',
        prefixIcon: Icon(Icons.search),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 1),
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 1),
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 1),
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
      ),
    );
  }
}
