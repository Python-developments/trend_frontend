import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trend/features/auth/presentation/pages/login_screen.dart';
import 'package:trend/features/profile/presentation/Manager/bloc/profile_bloc.dart';
import 'package:trend/features/profile/presentation/Manager/bloc/profile_event.dart';
import 'package:trend/features/profile/presentation/Manager/bloc/profile_state.dart';

class ProfileHelper {
  static void saveProfile(BuildContext context, int userId, String fullname,
      String bio, File? selectedImage) {
    if (fullname.isNotEmpty) {
      BlocProvider.of<ProfileBloc>(context)
          .add(Updatefullname(userId, fullname));
    }

    if (bio.isNotEmpty) {
      BlocProvider.of<ProfileBloc>(context).add(Updatebio(userId, bio));
    }

    if (selectedImage != null) {
      BlocProvider.of<ProfileBloc>(context)
          .add(UpdateAvatar(userId, selectedImage));
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Profile saved successfully!")),
    );
  }

  static void showDeleteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return BlocConsumer<ProfileBloc, ProfileState>(
          listener: (context, state) {
            if (state is Deletesuccess) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen2()),
              );
            }
          },
          builder: (context, state) {
            if (state is DeleteLoading) {
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              );
            } else {
              return AlertDialog(
                title: Text("Delete Confirmation"),
                content: Text("Are you sure you want to delete this Account?"),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // إغلاق الـ Dialog
                    },
                    child: Text(
                      "Cancel",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      BlocProvider.of<ProfileBloc>(context).add(Delete());
                    },
                    child: Text(
                      "Delete",
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ],
              );
            }
          },
        );
      },
    );
  }

  static String getMentionedNamae(String content) {
    int firstSpaceIndex = content.indexOf(" ");
    if (firstSpaceIndex == -1) {
      return content;
    }
    return content.substring(0, firstSpaceIndex);
  }

  static String getWithoutMentionedNamae(String content) {
    int firstSpaceIndex = content.indexOf(" ");
    if (firstSpaceIndex == -1) {
      return content;
    }
    return content.substring(firstSpaceIndex);
  }

  static String getTimeAgoShort(DateTime createdAt) {
    final currentTime = DateTime.now();
    final difference = currentTime.difference(createdAt);

    if (difference.inDays > 0) {
      return '${difference.inDays}d'; // e.g. "1 d"
    } else if (difference.inHours > 0) {
      return '${difference.inHours}h'; // e.g. "5 h"
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}m'; // e.g. "10 m"
    } else {
      return '${difference.inSeconds}s'; // e.g. "30 s"
    }
  }
}
