import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trend/data/models/auth/user_info_model.dart';
import 'package:trend/features/profile/presentation/Pages/edit_profile%20copy/Widget/Block_tile.dart';
import 'package:trend/features/profile/presentation/Pages/edit_profile%20copy/Widget/CustomBioTile.dart';
import 'package:trend/features/profile/presentation/Pages/edit_profile%20copy/Widget/Delete_tile.dart';
import 'package:trend/features/profile/presentation/Pages/edit_profile%20copy/Widget/custom_app_bar.dart';
import 'package:trend/features/profile/presentation/Pages/edit_profile%20copy/Widget/logout_tile.dart';
import 'package:trend/features/profile/presentation/Pages/edit_profile%20copy/Widget/profile_avatar.dart';
import 'package:trend/features/profile/presentation/Pages/edit_profile%20copy/Widget/profile_info_tile.dart';

class EditPage extends StatefulWidget {
  const EditPage({required this.user, super.key, this.onTap});

  final  UserInfoModel user;
  final void Function()? onTap;
  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  File? _selectedImage; // لتخزين الصورة المختارة
  final ImagePicker _picker = ImagePicker(); // لإنشاء مثيل لالتقاط الصور
  late String username = '';
  late String fullname = '';
  late String bio = '';
  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _selectedImage = File(image.path);
      });
    } else {}
  }

  Future<void> _pickImageFromCamera() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        _selectedImage = File(image.path);
      });
    } else {}
  }

  Future<void> pickAvatarImage() async {
    await _pickImageFromCamera();
  }

  bool is_visible = false;
  bool isLoading = false;
  @override
  Widget build(final BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: ProfileAppBar(
          title: 'Edit my profile',
          userId: widget.user.id,
          fullname: fullname,
          bio: bio,
          selectedImage: _selectedImage,
          onPressed: () {
          },
        ),
        body: Column(
          children: [
            SizedBox(
              height: 20.sp,
            ),
            ProfileAvatar(
              onTap: widget.onTap,
              avatarUrl: widget.user.avatar??'',
              selectedImage: _selectedImage,
              pickImageFromCamera: _pickImageFromCamera,
              pickImage: _pickImage,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20.sp,
                  ),
                  Text(
                    'Personal Informations',
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
                  ),
                  SizedBox(
                    height: 5.sp,
                  ),
                  ProfileInfoTile(
                    property: fullname,
                    userpro: widget.user.fullName??'',
                    onChanged: (final newFullName) {
                      setState(() {
                        fullname = newFullName;
                      });
                    },
                    onCancel: () {
                      setState(() {
                        fullname = '';
                      });
                    },
                    userid: widget.user.id,
                  ),
                  CustomBioTile(
                    userid: widget.user.id,
                    bio: bio, // Pass the current bio
                    onBioChanged: (final newBio) {
                      setState(() {
                        bio = newBio;
                      });
                    },
                    userBio:
                        widget.user.profile.bio??'', // Pass the initial bio from the user
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: Text(
                      'Other',
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
                    ),
                  ),
                  blockTile(
                    id: widget.user.id,
                  ),
                  DeleteTile(),
                  LogoutTile(),
                ],
              ),
            ),
          ],
        ),
    );
  }
}
