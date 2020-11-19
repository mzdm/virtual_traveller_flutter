import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:virtual_traveller_flutter/data/models/location.dart';

class Utils {
  static String getImageAsset(String assetName) => 'assets/images/$assetName';

  static void copyToClipboard(
    BuildContext context, {
    @required String textCopyData,
    String snackBarContentMessage,
  }) {
    Clipboard.setData(
      ClipboardData(text: textCopyData),
    );
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          '\'${snackBarContentMessage ?? textCopyData}\' was copied to the clipboard.',
        ),
      ),
    );
  }

  static void launchUrl(
    BuildContext context, {
    @required String url,
  }) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Error opening website \'$url\'',
          ),
        ),
      );
    }
  }

  // Should probably be replaced with Map Launcher package.
  static void launchGeoUrl(
    BuildContext context, {
    @required Location location,
  }) async {
    final VoidCallback snackBarErrorMessage = () {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Error: Can not open these coordinates.',
          ),
        ),
      );
    };

    if (location.latitude == 0 || location.longitude == 0) {
      snackBarErrorMessage();
      return;
    }

    final geoUrl =
        'https://www.google.com/maps/search/?api=1&query=${location.latitude},${location.longitude}';
    final alternativeGeoUrl = 'geo:${location.latitude},${location.longitude}';

    if (await canLaunch(geoUrl)) {
      await launch(geoUrl);
    } else {
      if (await canLaunch(alternativeGeoUrl)) {
        await launch(alternativeGeoUrl);
      } else {
        snackBarErrorMessage();
      }
    }
  }
}
