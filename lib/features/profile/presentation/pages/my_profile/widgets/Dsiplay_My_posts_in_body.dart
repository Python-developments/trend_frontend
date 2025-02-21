import 'package:flutter/material.dart';


class DsiplayMyPostsInBody extends StatelessWidget {
  const DsiplayMyPostsInBody({super.key});

  @override
  Widget build(final BuildContext context) {

          return Wrap(
            spacing: 1.0, // Horizontal space between items
            runSpacing: 1.0, // Vertical space between rows
            children: List.generate(
              1, // Number of photos
              (final index) => GestureDetector(
                onTap: () {},
                child: Container(
                  width: (MediaQuery.of(context).size.width - 5) / 3,
                  height: (MediaQuery.of(context).size.width - 5) /
                      3, // Keep height the same for square shape
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(''),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
