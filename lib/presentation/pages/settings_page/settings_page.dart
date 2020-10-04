import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: SettingsList(
        sections: [
          SettingsSection(
            title: 'Common',
            tiles: [
              SettingsTile(
                leading: Icon(Icons.language),
                title: 'Language',
                subtitle: 'English',
                onTap: () {},
              ),
              SettingsTile(
                leading: Icon(Icons.monetization_on),
                title: 'Currency',
                subtitle: 'USD',
                onTap: () {},
              ),
              SettingsTile(
                leading: Icon(Icons.thermostat_outlined),
                title: 'Temperature',
                subtitle: 'Celsius',
                onTap: () {},
              ),
            ],
          ),
          SettingsSection(
            title: 'Interface',
            tiles: [
              SettingsTile(
                leading: Icon(Icons.brightness_6),
                title: 'Theme',
                subtitle: 'Dark blue',
                onTap: () {},
              ),
              SettingsTile.switchTile(
                leading: Icon(Icons.flight_takeoff),
                title: 'Virtual mode',
                subtitle: 'Show immediate travel button',
                switchValue: true,
                onToggle: (bool value) {},
              ),
            ],
          ),
          SettingsSection(
            title: 'Misc',
            tiles: [
              SettingsTile(
                leading: Icon(Icons.delete),
                title: 'Remove locally saved data',
                subtitle: 'Search history, set default settings ...',
                onTap: () {},
              ),
              SettingsTile(
                leading: Icon(Icons.privacy_tip),
                title: 'Licenses',
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
