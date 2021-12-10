import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:girls_fashion_store/common/api_url.dart';
import 'package:girls_fashion_store/common/app_color.dart';
import 'package:girls_fashion_store/common/custom_widget.dart';
import 'package:girls_fashion_store/controllers/collection_screen_controller/collection_screen_controller.dart';
import 'package:girls_fashion_store/models/collection_screen_model/collection_model.dart';

final collectionScreenController = Get.find<CollectionScreenController>();

class CollectionListModule extends StatelessWidget {
  CollectionListModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: collectionScreenController.collectionLists.length,
      physics: BouncingScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 6 / 7,
      ),
      itemBuilder: (context, index) {
        Datum1 collectionSingleItem =
            collectionScreenController.collectionLists[index];
        return _collectionListTile(collectionSingleItem);
      },
    );
  }

  Widget _collectionListTile(Datum1 collectionSingleItem) {
    final imgUrl = ApiUrl.ApiMainPath + "${collectionSingleItem.showimg}";
    return Padding(
      padding: const EdgeInsets.all(3),
      child: Material(
        elevation: 8,
        borderRadius: BorderRadius.circular(10),
        child: GestureDetector(
          onTap: () {},
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          height: 120,
                          child: Image(
                            image: NetworkImage('$imgUrl'),
                          ),
                        ),
                        SpacerHeight(10),
                        Text(
                          collectionSingleItem.productname,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SpacerHeight(3),
                        RatingBar.builder(
                          itemCount: 5,
                          ignoreGestures: true,
                          unratedColor: AppColor.kLightOrangeColor,
                          allowHalfRating: true,
                          itemSize: 20,
                          minRating: 1,
                          glow: false,
                          initialRating: 3,
                          itemBuilder: (context, _) {
                            return Icon(
                              Icons.star_rounded,
                              color: AppColor.kOrangeColor,
                            );
                          },
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                        SpacerHeight(3),
                        Text(
                          '\$${collectionSingleItem.productcost}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColor.kPinkColor,
                          ),
                        )
                      ],
                    ),
                    Positioned(
                      right: -10,
                      child: Container(
                        child: IconButton(
                          onPressed: () {
                            // collectionScreenController.collectionLists[index].isFavorite = !collectionScreenController.collectionLists[index].isFavorite!;
                            //   print('$index : ${collectionScreenController.collectionLists[index].isFavorite}');
                          },
                          icon: /*collectionScreenController.collectionLists[index].isFavorite! ? Icon(Icons.favorite_rounded) :*/ Icon(
                              Icons.favorite_border_rounded),
                          color: AppColor.kPinkColor,
                          iconSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
