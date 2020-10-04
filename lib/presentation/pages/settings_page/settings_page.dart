import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

// TODO: splash effect not showing up
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
                // TODO
                onTap: () {},
              ),
              SettingsTile(
                leading: Icon(Icons.monetization_on),
                title: 'Currency',
                subtitle: 'USD',
                // TODO
                onTap: () {},
              ),
              SettingsTile(
                leading: Icon(Icons.thermostat_outlined),
                title: 'Temperature',
                subtitle: 'Celsius',
                // TODO
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
                // TODO
                onTap: () {},
              ),
              SettingsTile.switchTile(
                leading: Icon(Icons.flight_takeoff),
                title: 'Virtual mode',
                subtitle: 'Show immediate travel button',
                switchValue: true,
                // TODO
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
                // TODO
                onTap: () {},
              ),
              SettingsTile(
                leading: Icon(Icons.privacy_tip),
                title: 'Licenses',
                // TODO
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
