import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:virtual_traveller_flutter/consts/asset_names.dart';
import 'package:virtual_traveller_flutter/utils/utils.dart';

// TODO: migrate to Flutter Driver
void main() {
  group('getImageAsset function', () {
    testWidgets('renders existing image asset', (tester) async {
      const mAssetName = ImageAssetNames.hotelDetails;
      const mAssetPath = 'assets/images/$mAssetName';

      final GlobalKey key = GlobalKey();

      await tester.pumpWidget(
        Container(
          key: key,
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
          key.currentContext.findRenderObject() as RenderDecoratedBox;
      final boxDecoration = (renderConstrainedBox.decoration as BoxDecoration);
      expect(
        boxDecoration.toString().contains(mAssetPath),
        true,
      );
      // also equivalent to: tester.element(imageContainerFinder).renderObject.toStringDeep();
    });

    testWidgets('throws an exception when rendering unknown asset image',
        (tester) async {
      final GlobalKey key = GlobalKey();

      await tester.pumpWidget(
        Image.asset(
          Utils.getImageAsset(''),
          key: key,
          excludeFromSemantics: true,
        ),
      );

      expect(
        tester.takeException(),
        isInstanceOf<FlutterError>(),
      );

      // note that height and width is > 0
      // probably due to that is is not actually rendered?
      final RenderImage renderImage =
          key.currentContext.findRenderObject() as RenderImage;
      expect(renderImage.image, isNull);

      final Finder imageFinder = find.byType(Image);
      expect(
        tester.element(imageFinder).toStringShallow().contains('pixels: null'),
        true,
      );
    });

    testWidgets('renders existing image asset (partial alternative)',
        (tester) async {
      final GlobalKey key = GlobalKey();

      // must have: excludeFromSemantics: true
      // otherwise can not retrieve RenderImage via findRenderObject
      await tester.pumpWidget(
        Image.asset(
          Utils.getImageAsset(ImageAssetNames.hotelDetails),
          key: key,
          excludeFromSemantics: true,
        ),
      );

      // note that renderImage.image is null
      // probably due to that is is not actually rendered?
      final RenderImage renderImage =
          key.currentContext.findRenderObject() as RenderImage;
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

    final GlobalKey containerKey = GlobalKey();

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
    testWidgets('_____', (tester) async {
      // TODO
    });
  });

  group('launchGeoUrl function', () {
    testWidgets('_____', (tester) async {
      // TODO
    });
  });
}
