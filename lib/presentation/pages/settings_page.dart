import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mauzy_food/bloc/scheduling/scheduling_bloc.dart';
import 'package:mauzy_food/bloc/theme/theme_bloc.dart';
import 'package:mauzy_food/common/extensions.dart';
import 'package:mauzy_food/common/styles.dart';
import 'package:mauzy_food/presentation/widgets/custom_dialog.dart';
import 'package:mauzy_food/presentation/widgets/custom_snackbar.dart';
import 'package:mauzy_food/presentation/widgets/platform_widget.dart';

import '../widgets/neumorphic_button.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      androidBuilder: _buildAndroid,
      iosBuilder: _buildIos,
    );
  }

  Widget _buildAndroid(context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor:
              state.isDarkmode ? backgroundDarkModeColor : backgroundColor,
          appBar: AppBar(
            title: const Text('Settings Page'),
          ),
          body: _buildList(),
        );
      },
    );
  }

  Widget _buildIos(context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return CupertinoPageScaffold(
          backgroundColor:
              state.isDarkmode ? backgroundDarkModeColor : backgroundColor,
          navigationBar: const CupertinoNavigationBar(
            middle: Text('Settings'),
          ),
          child: SafeArea(
            child: _buildList(),
          ),
        );
      },
    );
  }

  Widget _buildList() {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, theme) {
        return ListView(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 20,
          ),
          children: [
            Container(
              width: 100.0,
              height: 100.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: theme.isDarkmode
                    ? backgroundDarkModeColor
                    : backgroundColor,
                boxShadow: [
                  BoxShadow(
                    color: theme.isDarkmode
                        ? shadow2DarkModeColor
                        : Colors.grey.shade300,
                    offset: const Offset(4.0, 4.0),
                    blurRadius: 6.0,
                  ),
                  BoxShadow(
                    color:
                        theme.isDarkmode ? shadow1DarkModeColor : Colors.white,
                    offset: const Offset(-4.0, -4.0),
                    blurRadius: 6.0,
                  ),
                ],
              ),
              child: Icon(
                Icons.person,
                size: 40,
                color: theme.isDarkmode ? blueColor : purpleColor,
              ),
            ),
            16.sh,
            BlocBuilder<SchedulingBloc, SchedulingState>(
              builder: (context, state) {
                return NeumorphicButton(
                  onTap: () async {
                    if (Platform.isAndroid) {
                      context.read<SchedulingBloc>().add(
                          SchedulingEvent.toogleScheduling(!state.isScheduled));
                    } else {
                      customDialog(context);
                    }
                  },
                  child: ListTile(
                    leading: Icon(
                      Icons.notifications,
                      color: theme.isDarkmode ? blueColor : purpleColor,
                    ),
                    title: Text(
                      'Restaurant Notification',
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: theme.isDarkmode
                            ? whiteColor
                            : backgroundDarkModeColor,
                      ),
                    ),
                    trailing: Switch(
                      activeColor: blueColor,
                      inactiveThumbColor: purpleColor,
                      value: state.isScheduled,
                      onChanged: (value) {
                        if (Platform.isAndroid) {
                          context
                              .read<SchedulingBloc>()
                              .add(SchedulingEvent.toogleScheduling(value));
                          if (value) {
                            showCustomSnackbar(context,
                                content: 'Notification restaurant activated');
                          } else {
                            showCustomSnackbar(context,
                                content:
                                    'Deactivated restaurant notification.');
                          }
                        } else {
                          customDialog(context);
                        }
                      },
                    ),
                  ),
                );
              },
            ),
            16.sh,
            NeumorphicButton(
              onTap: () async => customDialog(context),
              child: ListTile(
                leading: Icon(
                  Icons.shopping_bag,
                  color: theme.isDarkmode ? blueColor : purpleColor,
                ),
                title: Text(
                  'Pesanan',
                  style: context.textTheme.bodyMedium?.copyWith(
                    color:
                        theme.isDarkmode ? whiteColor : backgroundDarkModeColor,
                  ),
                ),
              ),
            ),
            16.sh,
            NeumorphicButton(
              onTap: () async => customDialog(context),
              child: ListTile(
                leading: Icon(
                  Icons.language,
                  color: theme.isDarkmode ? blueColor : purpleColor,
                ),
                title: Text(
                  'Pilihan Bahasa',
                  style: context.textTheme.bodyMedium?.copyWith(
                    color:
                        theme.isDarkmode ? whiteColor : backgroundDarkModeColor,
                  ),
                ),
              ),
            ),
            16.sh,
            BlocBuilder<ThemeBloc, ThemeState>(
              builder: (context, state) {
                return NeumorphicButton(
                  onTap: () async {
                    context
                        .read<ThemeBloc>()
                        .add(ThemeEvent.toogleTheme(!state.isDarkmode));
                  },
                  child: ListTile(
                      leading: Icon(
                        Icons.dark_mode,
                        color: theme.isDarkmode ? blueColor : purpleColor,
                      ),
                      title: Text(
                        'Dark mode',
                        style: context.textTheme.bodyMedium?.copyWith(
                          color: theme.isDarkmode
                              ? whiteColor
                              : backgroundDarkModeColor,
                        ),
                      ),
                      trailing: Switch(
                        activeColor: blueColor,
                        inactiveThumbColor: purpleColor,
                        value: state.isDarkmode,
                        onChanged: (value) {
                          context
                              .read<ThemeBloc>()
                              .add(ThemeEvent.toogleTheme(value));
                        },
                      )),
                );
              },
            ),
            16.sh,
            NeumorphicButton(
              onTap: () async => customDialog(context),
              child: ListTile(
                leading: Icon(
                  Icons.location_on,
                  color: theme.isDarkmode ? blueColor : purpleColor,
                ),
                title: Text(
                  'Alamat favorit',
                  style: context.textTheme.bodyMedium?.copyWith(
                    color:
                        theme.isDarkmode ? whiteColor : backgroundDarkModeColor,
                  ),
                ),
              ),
            ),
            16.sh,
            NeumorphicButton(
              onTap: () async => customDialog(context),
              child: ListTile(
                leading: Icon(
                  Icons.star,
                  color: theme.isDarkmode ? blueColor : purpleColor,
                ),
                title: Text(
                  'Beri rating',
                  style: context.textTheme.bodyMedium?.copyWith(
                    color:
                        theme.isDarkmode ? whiteColor : backgroundDarkModeColor,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
