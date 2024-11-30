import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GlassmorphicAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const GlassmorphicAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: AppBar(
          title: Image.asset('lib/assets/images/logo.png',
          width: 100,
          height: 50,
          ),
          backgroundColor: Colors.black.withOpacity(0.0), // Semi-transparente
          elevation: 0,
          actions: [
            IconButton(
                icon: const Icon(Icons.favorite_border),
                onPressed: () {
                  context.push('/favorites');
                }),
            IconButton(
                icon: const Icon(Icons.map_outlined),
                onPressed: () {
                  context.push('/map');
                })
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
