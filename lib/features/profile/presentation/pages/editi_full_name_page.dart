import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:trend/features/profile/presentation/Pages/edit_profile%20copy/Widget/LineLimitInputFormatter.dart';

@RoutePage()
class EditFullNamePage extends StatefulWidget {
  const EditFullNamePage({required this.Fullname, required this.userid, super.key});
  final int userid;
  final String Fullname;

  @override
  State<EditFullNamePage> createState() => _EditFullNamePageState();
}

class _EditFullNamePageState extends State<EditFullNamePage> {
  final TextEditingController _controller = TextEditingController();

  String newfullname = '';
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    // إضافة نص افتراضي
    _controller.text = widget.Fullname;
  }

  @override
  Widget build(final BuildContext context) {
    return  Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text('Edit Fullname'),
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
                  newfullname = data;
                });
              },
              maxLength: 30,
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
                LengthLimitingTextInputFormatter(30),
                LineLimitInputFormatter(1),
              ],
              maxLines: 3,
            ),

    ));
  }
}
