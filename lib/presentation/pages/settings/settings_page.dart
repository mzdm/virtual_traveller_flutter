import 'package:clean_settings/clean_settings.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: SettingContainer(
        sections: [
          SettingSection(
            title: 'Common',
            items: [
              SettingItem(
                title: 'Default departure location',
                displayValue: 'Boston (BOS)',
                // TODO
                priority: ItemPriority.disabled,
                onTap: () {},
              ),
              SettingItem(
                title: 'Language',
                displayValue: 'English',
                // TODO
                priority: ItemPriority.disabled,
                onTap: () {},
              ),
              SettingItem(
                title: 'Currency',
                displayValue: 'USD',
                // TODO
                priority: ItemPriority.disabled,
                onTap: () {},
              ),
              SettingItem(
                title: 'Temperature',
                displayValue: 'Celsius',
                // TODO
                priority: ItemPriority.disabled,
                onTap: () {},
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
                priority: ItemPriority.disabled,
                onTap: () {},
              ),
              SettingCheckboxItem(
                title: 'Virtual mode',
                description: 'Show immediate travel button',
                value: true,
                // TODO
                priority: ItemPriority.disabled,
                onChanged: (newValue) {},
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
                priority: ItemPriority.disabled,
                onTap: () {},
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
