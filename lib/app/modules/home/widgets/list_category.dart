import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ladangsantara/app/common/shape/rounded_container.dart';
import 'package:ladangsantara/app/common/ui/heading_text.dart';
import 'package:ladangsantara/app/common/ui/xpicture.dart';
import 'package:ladangsantara/app/modules/recipe/views/recipe_detail_view.dart';
import 'package:ladangsantara/app/themes/theme.dart';

class ListRecipe extends StatelessWidget {
  const ListRecipe({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          HeadingText(
            leftText: "Rekomendasi Resep",
            rightText: "Lihat Semua",
            fontSize: 14,
          ),
          const SizedBox(height: 10),
          RoundedContainer(
            height: 120,
            width: Get.width,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemExtent: 120,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Get.to(
                      () => const RecipeDetailView(),
                      fullscreenDialog: true,
                    );
                  },
                  child: RoundedContainer(
                    color: ThemeApp.primaryColor,
                    margin: const EdgeInsets.only(right: 10),
                    hasBorder: true,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        XPicture(
                          imageUrl: "",
                          sizeHeight: 80,
                          assetImage: "assets/images/sample-recipe.jpeg",
                          sizeWidth: Get.width,
                          radius: 0,
                        ),
                        const SizedBox(height: 5),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Text(
                            "Resep asd dka jldkjaldksad${index + 1}",
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
