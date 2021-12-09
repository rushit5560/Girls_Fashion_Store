import 'package:flutter/material.dart';
import 'package:girls_fashion_store/common/img_url.dart';

class CategoryScreen extends StatelessWidget {

  List categoryList = [
    ImgUrl.category1,ImgUrl.category2,ImgUrl.category3,
    ImgUrl.category4,ImgUrl.category5,ImgUrl.category6,
    ImgUrl.category7,ImgUrl.category8,ImgUrl.category9,
    ImgUrl.category1,ImgUrl.category2,ImgUrl.category3,
    ImgUrl.category4,ImgUrl.category5,ImgUrl.category6,
    ImgUrl.category7,ImgUrl.category8,ImgUrl.category9,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Category',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
              onPressed: (){
                print('Clicked On Cart Button');
              },
              icon: Icon(Icons.shopping_cart_rounded,
              ),
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: categoryList.length,
          physics: BouncingScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            return Material(
              elevation: 10,
                borderRadius: BorderRadius.circular(12),
                child: GestureDetector(
                  onTap: () {
                    print('Category $index');
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(categoryList[index]),
                      )
                    ),
                  ),
                ),
            );
          },
        ),
      ),
    );
  }
}
