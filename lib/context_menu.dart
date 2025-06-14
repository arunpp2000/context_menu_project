
import 'package:flutter/material.dart';
import 'interceptor.dart';

class ContextMenu extends StatefulWidget {
  final Widget child;

  const ContextMenu({super.key, required this.child});

  @override
  State<ContextMenu> createState() => _ContextMenuState();
}

class _ContextMenuState extends State<ContextMenu> {
  final GlobalKey _childKey = GlobalKey();
  OverlayEntry? _overlayEntry;

  void _showContextMenu() {
    final RenderBox childBox = _childKey.currentContext!.findRenderObject() as RenderBox;
    final Offset childOffset = childBox.localToGlobal(Offset.zero);
    final Size childSize = childBox.size;

    final Size screenSize = MediaQuery.of(context).size;

    double left = childOffset.dx + childSize.width;
    double top = childOffset.dy;

    const menuWidth = 150.0;
    const menuHeight = 150.0;

    if (left + menuWidth > screenSize.width) {
      left = childOffset.dx - menuWidth;
    }
    if (top + menuHeight > screenSize.height) {
      top = screenSize.height - menuHeight - 10;
    }

    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        left: left,
        top: top,
        width: menuWidth,
        child: Material(
          elevation: 8,
          child: SizedBox(
            height: menuHeight,
            child: ListView(
              padding: EdgeInsets.zero,
              children: const [
                ListTile(title: Text("Create")),
                ListTile(title: Text("Edit")),
                ListTile(title: Text("Remove")),
              ],
            ),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  void dispose() {
    _removeOverlay();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WebContextMenuInterceptor(
      child: GestureDetector(
        key: _childKey,
        onSecondaryTap: () {
          _removeOverlay();
          _showContextMenu();
        },
        onTap: _removeOverlay,
        child: widget.child,
      ),
    );
  }
}
