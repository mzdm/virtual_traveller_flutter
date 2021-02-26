import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';
import 'package:virtual_traveller_flutter/consts/local_keys.dart';

import '../test_helpers.dart';

void main() {
  group('Navigating through Bottom Navigation Bar items', () {
    late FlutterDriver driver;

    // Connect to the Flutter driver before running any tests.
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    // Close the connection to the driver after the tests have completed.
    tearDownAll(() async {
      await driver.close();
    });

    // Define the Finders and use them to locate widgets from the test suite.
    final waveSettingsIconFinder = find.byValueKey(LocalKeys.waveSettingsIcon);

    // custom delays not required to be there - just to see page transitions on the real device
    test(
      '1) Home Page: go to the Settings Page by clicking to Settings icon in the wave',
      () async {
        await driver.tap(waveSettingsIconFinder);
        await delay_650ms();
        await driver.waitFor(find.text('Interface'));
      },
    );

    test(
      '2) Settings Page: go to the Home Page (wait 1s then find)',
      () async {
        await driver.tap(find.text('Home'));
        await delay_custom(milliseconds: 1000);
        await driver.waitFor(find.text('I would like to visit ...'));
      },
    );

    test(
      '3) Home Page: click to the same page (Home Page) and stay at the same page',
      () async {
        await driver.waitFor(find.text('I would like to visit ...'));
        await driver.tap(find.text('Home'));
        await delay_650ms();
        await driver.waitFor(find.text('Home'));
        await driver.waitFor(find.text('I would like to visit ...'));
      },
    );

    test(
      '4) Home Page: iterate through all other Bottom Nav Bar pages to back to the Home Page',
      () async {
        await driver.tap(find.text('Watchlist'));
        await delay_650ms();
        await driver.waitFor(find.text('Destination Watchlist'));

        await driver.tap(find.text('Flights'));
        await delay_650ms();
        await driver.waitFor(find.text('Search Flights'));

        await driver.tap(find.text('Settings'));
        await delay_650ms();
        await driver.waitFor(find.text('Interface'));

        await driver.tap(find.text('Home'));
        await delay_650ms();
        await driver.waitFor(find.text('I would like to visit ...'));
      },
    );

    test(
      '5) Home Page: go to the Watchlist Page',
      () async {
        await driver.tap(find.text('Watchlist'));
        await delay_650ms();
        await driver.waitFor(find.text('Destination Watchlist'));
      },
    );

    test(
      '6) Watchlist Page: go to the San Francisco Destination Info Page and go back to the Watchlist Page',
      () async {
        await driver.tap(find.text('San Francisco'));
        await delay_650ms();
        await driver.waitFor(find.text('Points of Interests'));

        await driver.tap(find.byTooltip('Back'));
        await delay_650ms();
        await driver.waitFor(find.text('Destination Watchlist'));

        // Bottom Nav Bar items visible
        await driver.waitFor(find.text('Home'));
        await driver.waitFor(find.text('Flights'));
        await driver.waitFor(find.text('Settings'));
      },
    );

    test(
      '7) Watchlist Page: go to the initial page (Home)',
      () async {
        await driver.tap(find.text('Home'));
        await delay_650ms();
        await driver.waitFor(find.text('I would like to visit ...'));
      },
    );
  });
}
