import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mauzy_food/bloc/theme/theme_bloc.dart';
import 'package:mauzy_food/common/extensions.dart';
import 'package:mauzy_food/common/styles.dart';
import 'package:mauzy_food/routes/names_route.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    context.read<ThemeBloc>().add(const ThemeEvent.getTheme());
    _loadHomePage();
  }

  Future<void> _loadHomePage() async {
    await Future.delayed(
      const Duration(seconds: 3),
      () {
        context.goNamed(Routes.home);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor:
              state.isDarkmode ? backgroundDarkModeColor : backgroundColor,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const FlutterLogo(
                  size: 200,
                  curve: Curves.bounceIn,
                  style: FlutterLogoStyle.horizontal,
                ),
                20.sh,
                Text(
                  'Mauzy Food',
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      color: state.isDarkmode ? whiteColor : Colors.black),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
