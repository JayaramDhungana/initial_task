import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:initial_task/provider/favourite_provider.dart';

Stack hotelsDataShowingWidgets({
  required String imageUrl,
  required String hotelName,
  required double ratings,
  required int raters,
  required String description,
  required WidgetRef ref,
  required int index,
}) {
  bool isFavourite;
  List favouriteList = ref.watch(favouriteProvider).favouriteIndexListOfHotel;

  if (favouriteList.contains(index)) {
    isFavourite = true;
  } else {
    isFavourite = false;
  }
  return Stack(
    children: [
      Container(
        height: 500,
        width: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
              height: 250,
              width: 250,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image(image: AssetImage(imageUrl), fit: BoxFit.fill),
              ),
            ),
            Text(hotelName),
            Row(
              children: [
                Text(ratings.toString()),
                SizedBox(width: 5),
                for (int i = 0; i < 5; i++) ...{
                  Container(
                    height: 12,
                    width: 12,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(width: 2),
                },
                SizedBox(width: 5),

                Text("(${raters.toString()})"),
              ],
            ),
            Text(description),
          ],
        ),
      ),
      Positioned(
        right: 10,
        top: 10,

        child: InkWell(
          onTap: () {
            ref.read(favouriteProvider).addToFavouriteHotels(index);
          },
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Icon(
              isFavourite ? Icons.favorite : Icons.favorite_outline,
              color: isFavourite ? Colors.red : Colors.black,
              size: 30,
            ),
          ),
        ),
      ),
    ],
  );
}
