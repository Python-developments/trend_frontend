import 'package:flutter/material.dart';

import 'package:trend/shared/const/app_links.dart';

class PostsInUserBody extends StatelessWidget {
  const PostsInUserBody({required this.userid, super.key});
  final int userid;

  @override
  Widget build(final BuildContext context) {

            return GridView.builder(
              padding: EdgeInsets.only(top: 10),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // Number of items per row
                crossAxisSpacing: 1.0, // Space between columns
                mainAxisSpacing: 1.0, // Space between rows
              ),
              shrinkWrap: true, // Prevents GridView from expanding infinitely
              physics: const NeverScrollableScrollPhysics(), // Disable inner scrolling
              itemCount: 0, // Number of items in the grid
              itemBuilder: (final context, final index) {
                return GestureDetector(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage('${ApiEndpoints.baseUrl}/media/posts/images/image_cropper_1738583991667.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
            );
          }
            /*return GridView.builder(
                itemCount: 9,
                padding: EdgeInsets.only(top: 10),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // Number of items per row
                  crossAxisSpacing: 1.0, // Space between columns
                  mainAxisSpacing: 1.0, // Space between rows
                ),
                shrinkWrap: true, // Prevents GridView from expanding infinitely
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2),
                      child: Skeletonizer.zone(
                        enabled: true,
                        effect: ShimmerEffect(
                          duration: const Duration(milliseconds: 1500),
                          baseColor: AppStyle.black.shade100,
                          highlightColor: AppStyle.white,
                        ),
                        child: Card(
                          margin: const EdgeInsets.all(0),
                          elevation: 0,
                          color: AppStyle.white,
                          child: ListTile(
                            leading: Bone.circle(size: 60),
                            title: Bone.text(words: 2),
                            subtitle: Bone.text(),
                          ),
                        ),
                      ),
                    ));
        });}*/

}
