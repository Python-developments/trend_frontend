import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final String imagePath;
  final String title;
  final String fullname;
  final Function() onTap;

  const CustomListTile({
    required this.imagePath, required this.title, required this.fullname, required this.onTap, super.key,
  });

  @override
  Widget build(final BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(0),
      leading: Image.asset(imagePath),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 15,
          color: Colors.black,
          fontWeight: FontWeight.w400,
        ),
      ),
      trailing: Text(
        fullname.isEmpty
            ? 'Default Full Name'
            : fullname, // Replace with default name if empty
        style: TextStyle(
          fontSize: 15,
          color: Colors.black,
          fontWeight: FontWeight.w400,
        ),
      ),
      onTap: onTap,
    );
  }
}
