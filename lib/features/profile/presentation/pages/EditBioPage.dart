import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:trend/features/profile/presentation/Pages/edit_profile%20copy/Widget/LineLimitInputFormatter.dart';

@RoutePage()
class EditBioPage extends StatefulWidget {
  const EditBioPage({required this.bio, required this.userid, super.key});
  final int userid;
  final String bio;

  @override
  State<EditBioPage> createState() => _EditBioPageState();
}

class _EditBioPageState extends State<EditBioPage> {
  final TextEditingController _controller = TextEditingController();
  String newbio = '';
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    // إضافة نص افتراضي
    _controller.text = widget.bio;
  }

  @override
  Widget build(final BuildContext context) {
    return  Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text('Edit bio'),
            centerTitle: true,
            actions: [
              TextButton(
                onPressed: () async {
                },
                child: Text('Save'),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              onChanged: (final data) {
                setState(() {
                  newbio = data;
                });
              },
              maxLength: 80,
              controller: _controller,
              decoration: const InputDecoration(
                filled: true,
                fillColor: Color(0xffFAFAFA),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffFAFAFA)),
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffFAFAFA)),
                ),
              ),
              inputFormatters: [
                LengthLimitingTextInputFormatter(80),
                LineLimitInputFormatter(3),
              ],
              maxLines: 3,
            ),
          ),
    );
  }
}
