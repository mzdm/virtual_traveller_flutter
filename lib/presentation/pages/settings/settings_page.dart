import 'package:clean_settings/clean_settings.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:virtual_traveller_flutter/blocs/settings/settings_bloc.dart';
import 'package:virtual_traveller_flutter/data/data_providers/local/cache/settings_prefs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:virtual_traveller_flutter/data/models/settings.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      // TODO Add distance unit settings
      body: SettingContainer(
        sections: [
          SettingSection(
            title: 'Common',
            items: [
              SettingItem(
                title: 'Default departure location',
                displayValue: 'Boston (BOS)',
                // TODO
                onTap: () async {
                  context
                      .bloc<SettingsBloc>()
                      .add(SettingsChanged(settings: Settings.departure()));

                  // temp code for output testing
                  final sharedPrefs = await SharedPreferences.getInstance();
                  final settingsPrefsHelper = SettingsPrefs(sharedPrefs);
                  final city = 'London,LON';
                  await settingsPrefsHelper.setDeparture(city);
                  print(await settingsPrefsHelper.departure);
                },
              ),
              SettingItem(
                title: 'Language',
                displayValue: 'English',
                // TODO
                onTap: () {
                  context
                      .bloc<SettingsBloc>()
                      .add(SettingsChanged(settings: Settings.lang()));
                },
              ),
              SettingItem(
                title: 'Currency',
                displayValue: 'USD',
                // TODO
                onTap: () {
                  context
                      .bloc<SettingsBloc>()
                      .add(SettingsChanged(settings: Settings.curr()));
                },
              ),
              SettingItem(
                title: 'Temperature',
                displayValue: 'Celsius',
                // TODO
                onTap: () {
                  context
                      .bloc<SettingsBloc>()
                      .add(SettingsChanged(settings: Settings.temp()));
                },
              ),
            ],
          ),
          SettingSection(
            title: 'Interface',
            items: [
              SettingItem(
                title: 'Theme',
                displayValue: 'Dark blue',
                // TODO
                onTap: () {
                  context
                      .bloc<SettingsBloc>()
                      .add(SettingsChanged(settings: Settings.theme()));
                },
              ),
              SettingCheckboxItem(
                title: 'Virtual mode',
                description: 'Show immediate travel button',
                value: true,
                // TODO
                onChanged: (newValue) {
                  // TODO
                },
              ),
            ],
          ),
          SettingSection(
            title: 'Misc',
            items: [
              SettingItem(
                title: 'Remove local data',
                displayValue: 'Search history, set default settings ...',
                // TODO
                onTap: () {
                  // TODO
                },
              ),
              SettingItem(
                title: 'Licenses',
                onTap: () {
                  showLicensePage(
                    context: context,
                    applicationName: 'Virtual Traveller',
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
