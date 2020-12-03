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
    testWidgets('renders existing image asset', (tester) async {
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

      final Finder imageContainerFinder = find.byType(Container);
      expect(imageContainerFinder, findsOneWidget);

      // checks if AssetImage assetName property contains that mAssetName
      expect(
        tester.element(imageContainerFinder).toString().contains(mAssetPath),
        true,
      );

      // or via Global Key and Render Object:
      final RenderDecoratedBox renderConstrainedBox =
          containerKey.currentContext.findRenderObject() as RenderDecoratedBox;
      final boxDecoration = (renderConstrainedBox.decoration as BoxDecoration);
      expect(
        boxDecoration.toString().contains(mAssetPath),
        true,
      );
      // also equivalent to: tester.element(imageContainerFinder).renderObject.toStringDeep();
    });

    testWidgets('throws an exception when rendering unknown asset image',
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

      // note that height and width is > 0
      // probably due to that is is not actually rendered?
      final renderImage =
          imageKey.currentContext.findRenderObject() as RenderImage;
      expect(renderImage.image, isNull);

      final Finder imageFinder = find.byType(Image);
      expect(
        tester.element(imageFinder).toStringShallow().contains('pixels: null'),
        true,
      );
    });

    testWidgets('renders existing image asset (alternative)', (tester) async {
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

      // note that renderImage.image is null
      // probably due to that is is not actually rendered
      final renderImage =
          imageKey.currentContext.findRenderObject() as RenderImage;
      expect(renderImage.size.width > 0, true);
      expect(renderImage.size.height > 0, true);

      // no exception
      expect(
        tester.takeException(),
        isNull,
      );
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
    const invalidUrl = null;

    const snackBarErrorMsg = 'Error: Can not open the website';

    const containerKey = Key('containerKey');

    final Function(String) page = (String url) {
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

    testWidgets('valid link - SnackBar is NOT shown', (tester) async {
      await tester.pumpWidget(page(validUrl));

      // no SnackBar yet
      expect(find.textContaining(snackBarErrorMsg), findsNothing);

      // no SnackBar even on click (valid link)
      await tester.tap(find.byKey(containerKey));
      await tester.pump();
      expect(find.textContaining(snackBarErrorMsg), findsNothing);
    });

    testWidgets('invalid link - SnackBar IS shown with an error message',
        (tester) async {
      await tester.pumpWidget(page(invalidUrl));

      // no SnackBar yet
      expect(find.textContaining(snackBarErrorMsg), findsNothing);

      // shows SnackBar with error message on click (invalid link)
      await tester.tap(find.byKey(containerKey));
      await tester.pump();
      expect(find.textContaining(snackBarErrorMsg), findsOneWidget);
    });
  });

  group('launchGeoUrl function', () {
    const validLocation = Location(latitude: 51.507351, longitude: -0.127758);
    const invalidLocation = Location(latitude: 0, longitude: 14.5);

    const snackBarErrorMsg = 'Error: Can not open these coordinates.';

    const containerKey = Key('containerKey');

    final Function(Location) page = (Location location) {
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
