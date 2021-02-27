import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:virtual_traveller_flutter/ui/pages/home/local_widgets/rounded_card.dart';

class DestinationLoadingShimmer extends StatelessWidget {
  const DestinationLoadingShimmer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 8,
      itemBuilder: (_, __) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: DestinationRoundedCard(cityCode: ''),
        );
      },
    );
  }
}
