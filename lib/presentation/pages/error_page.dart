import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mauzy_food/presentation/widgets/platform_widget.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      androidBuilder: _buildAndroid,
      iosBuilder: _buildIos,
    );
  }

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Error Page'),
      ),
      body: const Center(
        child: Text('404 Not Found'),
      ),
    );
  }

  Widget _buildIos(BuildContext context) {
    return const CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Error Page'),
      ),
      child: Center(
        child: Text('404 Not Found'),
      ),
    );
  }
}
