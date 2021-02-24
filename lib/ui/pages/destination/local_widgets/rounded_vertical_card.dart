import 'package:flutter/material.dart';
import 'package:virtual_traveller_flutter/utils/utils.dart';

class RoundedVerticalCard extends StatelessWidget {
  const RoundedVerticalCard({
    Key? key,
    required this.title,
    required this.assetName,
    required this.onTap,
  })  : super(key: key);

  final String title;
  final String assetName;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 170.0,
      height: 230.0,
      child: Card(
        elevation: 0.0,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.grey,
                image: DecorationImage(
                  image: AssetImage(
                    Utils.getImageAsset(assetName),
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: onTap,
              ),
            ),
            IgnorePointer(
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
