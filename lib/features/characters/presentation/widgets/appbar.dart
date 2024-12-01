import 'dart:ui';
import 'package:flutter/material.dart';

class GlassmorphicAppBar extends StatelessWidget implements PreferredSizeWidget {

  const GlassmorphicAppBar({super.key, required this.appBar});

  final AppBar appBar;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: appBar,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
