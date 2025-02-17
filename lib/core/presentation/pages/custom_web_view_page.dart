/*
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:trend/core/presentation/app_style.dart';
import 'package:trend/core/presentation/arguments/web_view_page_arguments.dart';
import 'package:trend/core/presentation/widgets/custom_app_bar.dart';

@RoutePage()
class CustomWebViewPage extends StatefulWidget {

  final WebViewPageArguments args;
  const CustomWebViewPage({required this.args,final Key? key}) : super(key: key);

  @override
  State<CustomWebViewPage> createState() => _CustomWebViewPageState();
}

class _CustomWebViewPageState extends State<CustomWebViewPage> {

  late WebViewController controller ;

  @override
  void initState() {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(AppStyle.white)
      ..enableZoom(true)
      ..loadRequest(Uri.parse(widget.args.link));
    super.initState();
  }

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          barTitle: widget.args.title,
          isColorfulBar: true,
          context: context,
      ),
      body: WebViewWidget(controller: controller),
    );
  }

}
*/
