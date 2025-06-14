
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:html' as html;

class WebContextMenuInterceptor extends StatefulWidget {
  final Widget child;

  const WebContextMenuInterceptor({super.key, required this.child});

  @override
  State<WebContextMenuInterceptor> createState() => _WebContextMenuInterceptorState();
}

class _WebContextMenuInterceptorState extends State<WebContextMenuInterceptor> {
  @override
  void initState() {
    super.initState();
    if (kIsWeb) {
      html.document.onContextMenu.listen((event) {
        event.preventDefault();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
