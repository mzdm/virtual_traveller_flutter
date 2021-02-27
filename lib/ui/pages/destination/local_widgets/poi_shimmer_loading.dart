import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:virtual_traveller_flutter/data/models/poi.dart';
import 'package:virtual_traveller_flutter/ui/pages/destination/local_widgets/expansion_card.dart';

class PoiShimmerLoading extends StatelessWidget {
  const PoiShimmerLoading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 10,
        itemBuilder: (_, __) {
          return ExpansionCard(
            poiName: '',
            poiCategory: CategoryPOI.BEACH_PARK,
          );
        },
      ),
    );
  }
}
