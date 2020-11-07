import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Utils {
  static String getImageAsset(String assetName) => 'assets/images/$assetName';

  static void copyToClipboard(
    BuildContext context, {
    @required String textCopyData,
    @required String snackBarMessage,
  }) {
    Clipboard.setData(
      ClipboardData(text: textCopyData),
    );
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          '$snackBarMessage was copied to the clipboard.',
        ),
      ),
    );
  }
}
