import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:girls_fashion_store/common/api_url.dart';
import 'package:girls_fashion_store/controllers/category_screen_controller/category_screen_controller.dart';
import 'package:girls_fashion_store/models/category_screen_model/category_model.dart';
import 'package:girls_fashion_store/screens/category_collection_screen/category_collection_screen.dart';

final categoryScreenController = Get.find<CategoryScreenController>();

class CategoryListModule extends StatelessWidget {
  const CategoryListModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: categoryScreenController.categoryLists.length,
      physics: BouncingScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        Datum categorySingleItem =
            categoryScreenController.categoryLists[index];
        return _categoryListTile(categorySingleItem);
      },
    );
  }

  Widget _categoryListTile(Datum categorySingleItem) {
    final imgUrl = ApiUrl.ApiMainPath + "${categorySingleItem.showimg}";
    return Material(
      elevation: 10,
      borderRadius: BorderRadius.circular(12),
      child: GestureDetector(
        onTap: () {
          Get.to(()=> CategoryCollectionScreen(),
            arguments: [
              categorySingleItem.categoryId,
              categorySingleItem.categoryName,
            ],
          );
        },
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage('$imgUrl'),
            ),
          ),
        ),
      ),
    );
  }
}
