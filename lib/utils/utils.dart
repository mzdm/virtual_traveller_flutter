import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:virtual_traveller_flutter/data/models/location.dart';

class Utils {
  /// Returns the asset path of an image named [assetName].
  ///
  /// The [assetName] must have included a file extension (.png, .svg, ...).
  static String getImageAsset(String assetName) => 'assets/images/$assetName';

  /// Returns the asset path of an icon named [assetName].
  ///
  /// The [assetName] must have included a file extension (.png, .svg, ...).
  static String getIconAsset(String assetName) => 'assets/icons/$assetName';

  /// Copies the text content of the [textCopyData] parameter
  /// to the [Clipboard].
  static void copyToClipboard(
    BuildContext context, {
    @required String textCopyData,
  }) {
    Clipboard.setData(
      ClipboardData(text: textCopyData),
    );
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          '\'$textCopyData\' was copied to the clipboard.',
        ),
      ),
    );
  }

  /// Opens the given [url] in a native browser, on web in the new tab.
  static void launchUrl(
    BuildContext context, {
    @required String url,
    String queryParam,
  }) async {
    if (queryParam != null) {
      // escape '&' character for the correct search query
      queryParam = queryParam.replaceAll('&', '%26');
      url = '$url$queryParam';
    }

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Error: Can not open the website \'$url\'.',
          ),
        ),
      );
    }
  }

  /// Opens a map app pointed to the [location] (geographic coordinates).
  /// On the web/desktop it opens in a new tab in a browser.
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

    // if the location coord could not have been retrieved
    // then it is set to null
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
