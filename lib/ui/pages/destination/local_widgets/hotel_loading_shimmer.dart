import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class HotelLoadingShimmer extends StatelessWidget {
  const HotelLoadingShimmer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: 20,
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[350]!,
          highlightColor: Colors.grey[100]!,
          child: SizedBox(
            height: 130.0,
            child: Card(
              color: Colors.transparent,
              elevation: 1.5,
              child: ListTile(
                title: Text(
                  'Hotel name',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                trailing: Icon(
                  Icons.star,
                  size: 15.0,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
