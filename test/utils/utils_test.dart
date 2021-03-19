import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:virtual_traveller_flutter/consts/asset_names.dart';
import 'package:virtual_traveller_flutter/data/models/location.dart';
import 'package:virtual_traveller_flutter/utils/utils.dart';

// TODO: migrate to Flutter Driver
void main() {
  group('getImageAsset function', () {
    testWidgets('loads an existing image asset', (tester) async {
      const mAssetName = ImageAssetNames.hotelDetails;
      const mAssetPath = 'assets/images/$mAssetName';

      final containerKey = GlobalKey();

      await tester.pumpWidget(
        Container(
          key: containerKey,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                Utils.getImageAsset(mAssetName),
              ),
            ),
          ),
        ),
      );

      final imageContainerFinder = find.byType(Container);
      expect(imageContainerFinder, findsOneWidget);

      // checks if AssetImage assetName property contains that mAssetName
      expect(
        tester.element(imageContainerFinder).toString().contains(mAssetPath),
        true,
      );

      // or via Global Key and Render Object:
      final renderConstrainedBox =
          containerKey.currentContext!.findRenderObject() as RenderDecoratedBox;
      final boxDecoration = (renderConstrainedBox.decoration as BoxDecoration);
      expect(
        boxDecoration.toString().contains(mAssetPath),
        true,
      );
      // also equivalent to: tester.element(imageContainerFinder).renderObject.toStringDeep();
    });

    testWidgets('loads an existing image asset (alternative)', (tester) async {
      final imageKey = GlobalKey();

      // must have: excludeFromSemantics: true
      // otherwise can not retrieve RenderImage via findRenderObject
      await tester.pumpWidget(
        Image.asset(
          Utils.getImageAsset(ImageAssetNames.hotelDetails),
          key: imageKey,
          excludeFromSemantics: true,
        ),
      );

      // no exception
      expect(
        tester.takeException(),
        isNull,
      );
    });

    testWidgets('throws an exception when rendering an invalid asset image',
        (tester) async {
      final imageKey = GlobalKey();

      await tester.pumpWidget(
        Image.asset(
          Utils.getImageAsset(''),
          key: imageKey,
          excludeFromSemantics: true,
        ),
      );

      expect(
        tester.takeException(),
        isInstanceOf<FlutterError>(),
      );

      final renderImage =
          imageKey.currentContext!.findRenderObject() as RenderImage;
      expect(renderImage.image, isNull);
    });
  });

  group('getIconAsset function', () {
    // note: loading a svg image is platform specific
    testWidgets('throws an exception when loading an invalid asset icon',
        (tester) async {
      final imageKey = GlobalKey();

      await tester.pumpWidget(
        Image.asset(
          Utils.getIconAsset(''),
          key: imageKey,
          excludeFromSemantics: true,
        ),
      );

      expect(
        tester.takeException(),
        isInstanceOf<FlutterError>(),
      );

      final renderImage =
          imageKey.currentContext!.findRenderObject() as RenderImage;
      expect(renderImage.image, isNull);
    });
  });

  group('copyToClipboard function', () {
    const copyData = 'Some copy data';

    const containerKey = Key('containerKey');

    final Widget widget = MaterialApp(
      home: Scaffold(
        body: Builder(
          builder: (context) {
            return GestureDetector(
              onTap: () {
                Utils.copyToClipboard(
                  context,
                  textCopyData: copyData,
                );
              },
              behavior: HitTestBehavior.opaque,
              child: Container(
                height: 100.0,
                width: 100.0,
                key: containerKey,
              ),
            );
          },
        ),
      ),
    );

    // TODO: testing the ClipboardData may be done through Flutter Driver
    testWidgets('SnackBar is shown', (tester) async {
      await tester.pumpWidget(widget);

      // no SnackBar yet
      expect(find.textContaining(copyData), findsNothing);

      // shows SnackBar on click
      await tester.tap(find.byKey(containerKey));
      await tester.pump();
      expect(find.textContaining(copyData), findsOneWidget);
    });
  });

  group('launchUrl function', () {
    const validUrl = 'https://www.google.com/maps';

    const snackBarErrorMsg = 'Error: Can not open the website';

    const containerKey = Key('containerKey');

    final Widget Function(String) page = (String url) {
      return MaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (context) {
              return GestureDetector(
                onTap: () {
                  Utils.launchUrl(
                    context,
                    url: url,
                  );
                },
                behavior: HitTestBehavior.opaque,
                child: Container(
                  key: containerKey,
                  height: 100.0,
                  width: 100.0,
                ),
              );
            },
          ),
        ),
      );
    };

    testWidgets('valid link - SnackBar is NOT shown', (tester) async {
      await tester.pumpWidget(page(validUrl));

      // no SnackBar yet
      expect(find.textContaining(snackBarErrorMsg), findsNothing);

      // no SnackBar even on click (valid link)
      await tester.tap(find.byKey(containerKey));
      await tester.pump();
      expect(find.textContaining(snackBarErrorMsg), findsNothing);
    });

    // testWidgets('invalid link - SnackBar IS shown with an error message',
    //     (tester) async {
    //   await tester.pumpWidget(page(invalidUrl));
    //
    //   // no SnackBar yet
    //   expect(find.textContaining(snackBarErrorMsg), findsNothing);
    //
    //   // shows SnackBar with error message on click (invalid link)
    //   await tester.tap(find.byKey(containerKey));
    //   await tester.pump();
    //   expect(find.textContaining(snackBarErrorMsg), findsOneWidget);
    // });
  });

  group('launchGeoUrl function', () {
    const validLocation = Location(latitude: 51.507351, longitude: -0.127758);
    final invalidLocation = Location.unknown();

    const snackBarErrorMsg = 'Error: Can not open these coordinates.';

    const containerKey = Key('containerKey');

    final Widget Function(Location) page = (Location location) {
      return MaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (context) {
              return GestureDetector(
                onTap: () {
                  Utils.launchGeoUrl(
                    context,
                    location: location,
                  );
                },
                behavior: HitTestBehavior.opaque,
                child: Container(
                  height: 100.0,
                  width: 100.0,
                  key: containerKey,
                ),
              );
            },
          ),
        ),
      );
    };

    testWidgets('valid location - SnackBar is NOT shown', (tester) async {
      await tester.pumpWidget(page(validLocation));

      // no SnackBar yet
      expect(find.textContaining(snackBarErrorMsg), findsNothing);

      // no SnackBar even on click (valid link)
      await tester.tap(find.byKey(containerKey));
      await tester.pump();
      expect(find.textContaining(snackBarErrorMsg), findsNothing);
    });

    testWidgets(
        'invalid location - longitude and/or latitude is 0 - SnackBar IS shown with an error message',
        (tester) async {
      await tester.pumpWidget(page(invalidLocation));

      // no SnackBar yet
      expect(find.textContaining(snackBarErrorMsg), findsNothing);

      // shows SnackBar with error message on click (invalid location)
      await tester.tap(find.byKey(containerKey));
      await tester.pump();
      expect(find.textContaining(snackBarErrorMsg), findsOneWidget);
    });
  });
}
