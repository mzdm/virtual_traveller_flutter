import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:virtual_traveller_flutter/utils/utils.dart';

class ImageSliverAppBar extends StatelessWidget {
  const ImageSliverAppBar({
    Key? key,
    required this.title,
    this.assetName,
    this.twoLineTitle = false,
    this.actions = const <Widget>[],
  })  : super(key: key);

  final String? assetName;
  final String title;
  final bool twoLineTitle;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 56,
      pinned: true,
      actions: actions,
      elevation: twoLineTitle ? 0.0 : Theme.of(context).appBarTheme.elevation,
      flexibleSpace: Stack(
        children: [
          assetName == null
              ? const SizedBox()
              : Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        Utils.getImageAsset(assetName!),
                      ),
                    ),
                  ),
                ),
          FlexibleSpaceBar(
            title: Align(
              alignment: AlignmentDirectional.bottomStart,
              child: Text(
                title,
                maxLines: twoLineTitle ? 2 : 1,
                overflow: TextOverflow.ellipsis,
                style: twoLineTitle
                    ? TextStyle(
                        fontSize: 16.0,
                      )
                    : null,
              ),
            ),
            titlePadding: EdgeInsetsDirectional.only(
              start: 72.0,
              end: 50.0,

              /// Responsive bottom padding of the Text Label in the SliverAppBar.
              ///
              /// On the Hotel Detail Page there might be a case when the name of the
              /// hotel is so long that it takes 2 lines but the bottom padding moves
              /// it too much to the top of the screen (when the SliverAppBar is collapsed).
              ///
              /// So it doesn't look very nice that's why there are these conditions checks.
              /// We check current width of the screen and the text length
              /// if it isn't potentially 2 line
              /// (very possible on small screens and with length of text 35 and more).
              bottom: MediaQuery.of(context).size.width <= 720 &&
                      title.length >= 35 &&
                      twoLineTitle
                  ? 12.0
                  : 16.0,
            ),
          ),
        ],
      ),
    );
  }
}
