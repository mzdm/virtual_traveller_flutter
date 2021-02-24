import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DestinationRoundedCard extends StatelessWidget {
  const DestinationRoundedCard({
    Key? key,
    required this.cityCode,
    this.assetNum,
    this.onTap,
  })  : super(key: key);

  final String cityCode;
  final int? assetNum;
  final VoidCallback? onTap;

  String? get assetName => assetNum == null
      ? null
      : 'assets/images/most_popular_destination$assetNum.jpg';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 240.0,
      child: Card(
        elevation: 0.0,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                image: assetName != null
                    ? DecorationImage(
                        image: AssetImage(assetName!),
                        fit: BoxFit.cover,
                      )
                    : null,
              ),
            ),
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: onTap,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(20.0, 0.0, 12.0, 0.0),
                  width: double.infinity,
                  height: 60.0,
                  color: Colors.black.withOpacity(0.35),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cityCode,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
