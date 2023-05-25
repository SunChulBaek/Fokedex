import 'package:flutter/material.dart';
import 'package:flutter_template/ui/common/pokemon_progress_indicator.dart';
import 'package:go_router/go_router.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewParam {
  WebViewParam({required this.title, required this.url});

  String title;
  String url;
}

class WebViewScreen extends StatefulWidget {
  const WebViewScreen({
    required this.param,
    super.key
  });

  static const routeName = "/webview";

  final WebViewParam param;

  @override
  State<StatefulWidget> createState() => _WebViewState();
}

class _WebViewState extends State<WebViewScreen> {
  bool isLoading = true;
  WebViewController controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted);

  @override
  void initState() {
    super.initState();
    controller.loadRequest(Uri.parse(widget.param.url));
    controller.setNavigationDelegate(
      NavigationDelegate(
        onPageFinished: (String url) {
          setState(() {
            isLoading = false;
          });
        }
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.pop();
          },
        ),
        title: Text(widget.param.title)
      ),
      body: Stack(
        children: <Widget>[
          WebViewWidget(controller: controller),
          isLoading ? const Center(child: PokemonProgressIndicator(size: 30)) : Stack()
        ]
      )
    );
  }
}