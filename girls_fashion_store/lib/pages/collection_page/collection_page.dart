import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:girls_fashion_store/common/custom_color.dart';
import 'package:girls_fashion_store/common/img_url.dart';
import 'collection_model.dart';

class CollectionPage extends StatefulWidget {

  @override
  _CollectionPageState createState() => _CollectionPageState();
}

class _CollectionPageState extends State<CollectionPage> {
  List<CollectionInfo> collectionLists = [
    CollectionInfo(
      productImg: ImgUrl.product1,
      productName: 'Product Name Here',
      productPrice: '200',
      isFavorite: false,
    ),
    CollectionInfo(
      productImg: ImgUrl.product2,
      productName: 'Product Name Here',
      productPrice: '200',
      isFavorite: false,
    ),
    CollectionInfo(
      productImg: ImgUrl.product3,
      productName: 'Product Name Here',
      productPrice: '200',
      isFavorite: false,
    ),
    CollectionInfo(
      productImg: ImgUrl.product4,
      productName: 'Product Name Here',
      productPrice: '200',
      isFavorite: false,
    ),
    CollectionInfo(
      productImg: ImgUrl.product1,
      productName: 'Product Name Here',
      productPrice: '200',
      isFavorite: false,
    ),
    CollectionInfo(
      productImg: ImgUrl.product2,
      productName: 'Product Name Here',
      productPrice: '200',
      isFavorite: false,
    ),
    CollectionInfo(
      productImg: ImgUrl.product3,
      productName: 'Product Name Here',
      productPrice: '200',
      isFavorite: false,
    ),
    CollectionInfo(
      productImg: ImgUrl.product4,
      productName: 'Product Name Here',
      productPrice: '200',
      isFavorite: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          ' Collection',
          style: TextStyle(color: Colors.black),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: collectionLists.length,
          physics: BouncingScrollPhysics(),
          // shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 6/7,
          ),
          itemBuilder: (context, index){
            return Padding(
              padding: const EdgeInsets.all(3),
              child: Material(
                elevation: 8,
                borderRadius: BorderRadius.circular(10),
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
                                  image: AssetImage(collectionLists[index].productImg),
                                ),
                              ),
                              spacer(10),
                              Text(
                                collectionLists[index].productName,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,

                                ),
                              ),
                              spacer(3),
                              RatingBar.builder(
                                itemCount: 5,
                                ignoreGestures: true,
                                unratedColor: CustomColor.kLightOrangeColor,
                                allowHalfRating: true,
                                itemSize: 20,
                                minRating: 1,
                                glow: false,
                                initialRating: 3,
                                itemBuilder: (context, _) {
                                  return Icon(
                                    Icons.star_rounded,
                                    color: CustomColor.kOrangeColor,
                                  );
                                },
                                onRatingUpdate: (rating) {
                                  print(rating);
                                },
                              ),
                              spacer(3),
                              Text(
                                '\$${collectionLists[index].productPrice}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: CustomColor.kPinkColor,
                                ),
                              )
                            ],
                          ),
                          Positioned(
                            right: -10,
                            child: Container(
                              child: IconButton(
                                onPressed: () {
                                  // print('Clicked On Favorite Button');
                                  setState(() {
                                    collectionLists[index].isFavorite = !collectionLists[index].isFavorite!;
                                    print('$index : ${collectionLists[index].isFavorite}');
                                  });
                                },
                                icon: collectionLists[index].isFavorite! ? Icon(Icons.favorite_rounded) : Icon(Icons.favorite_border_rounded),
                                color: CustomColor.kPinkColor,
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
            );
          },
        ),
      ),
    );
  }

  Widget spacer(double value) {
    return SizedBox(height: value);
  }
}
