import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  // 플러터 엔진이 초기화되었는지 확인 (웹뷰 등 네이티브 기능 사용 시 필수)
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MaterialApp(
    home: WebViewApp(),
    debugShowCheckedModeBanner: false, // 오른쪽 상단 디버그 띠 제거
  ));
}

class WebViewApp extends StatefulWidget {
  const WebViewApp({super.key});

  @override
  State<WebViewApp> createState() => _WebViewAppState();
}

class _WebViewAppState extends State<WebViewApp> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    // 웹뷰 컨트롤러 설정
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted) // JS 허용 (구글 등 대부분 사이트 필수)
      ..setBackgroundColor(const Color(0x00000000))
      ..loadRequest(Uri.parse('https://www.maru.or.kr')); // 보여주고 싶은 주소
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('마루밑다락방'),
        backgroundColor: Colors.blue,
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}