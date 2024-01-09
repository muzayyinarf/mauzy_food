import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mauzy_food/common/extensions.dart';
import 'package:mauzy_food/presentation/widgets/platform_widget.dart';

import '../widgets/neumorphic_button.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool darkMode = false;
  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      androidBuilder: _buildAndroid,
      iosBuilder: _buildIos,
    );
  }

  Scaffold _buildAndroid(context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text('Settings Page'),
      ),
      body: _buildList(),
    );
  }

  Widget _buildIos(context) {
    return CupertinoPageScaffold(
      backgroundColor: Colors.grey.shade100,
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Settings'),
      ),
      child: SafeArea(
        child: _buildList(),
      ),
    );
  }

  ListView _buildList() {
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
            color: Colors.grey.shade100,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade300,
                offset: const Offset(4.0, 4.0),
                blurRadius: 6.0,
              ),
              const BoxShadow(
                color: Colors.white,
                offset: Offset(-4.0, -4.0),
                blurRadius: 6.0,
              ),
            ],
          ),
          child: Icon(
            Icons.person,
            size: 40,
            color: Colors.grey.shade700,
          ),
        ),
        16.sh,
        NeumorphicButton(
          onTap: () {},
          child: const ListTile(
            leading: Icon(
              Icons.shopping_bag,
              color: Colors.grey,
            ),
            title: Text('Pesanan'),
          ),
        ),
        16.sh,
        NeumorphicButton(
          onTap: () {},
          child: const ListTile(
            leading: Icon(
              Icons.language,
              color: Colors.grey,
            ),
            title: Text('Pilihan Bahasa'),
          ),
        ),
        16.sh,
        NeumorphicButton(
          onTap: () {},
          child: ListTile(
            leading: const Icon(
              Icons.dark_mode,
              color: Colors.grey,
            ),
            title: const Text('Dark mode'),
            trailing: Switch(
              value: darkMode,
              onChanged: (value) {
                darkMode = value;
                setState(() {});
              },
            ),
          ),
        ),
        16.sh,
        NeumorphicButton(
          onTap: () {},
          child: const ListTile(
            leading: Icon(
              Icons.location_on,
              color: Colors.grey,
            ),
            title: Text('Alamat favorit'),
          ),
        ),
        16.sh,
        NeumorphicButton(
          onTap: () {},
          child: const ListTile(
            leading: Icon(
              Icons.star,
              color: Colors.grey,
            ),
            title: Text('Beri rating'),
          ),
        ),
      ],
    );
  }
}
