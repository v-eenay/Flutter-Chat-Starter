import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  const UserTile({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cardThemeShape = theme.cardTheme.shape as RoundedRectangleBorder?;
    final borderRadius = cardThemeShape?.borderRadius as BorderRadius? ??
        BorderRadius.circular(15);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          elevation: theme.cardTheme.elevation ?? 5,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius,
          ),
          color: theme.cardColor,
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: theme.cardColor,
              borderRadius: borderRadius,
            ),
            child: Row(
              children: [
                Icon(Icons.person,
                    color: theme.iconTheme.color?.withOpacity(0.7)),
                const SizedBox(width: 20),
                Text(
                  text,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: theme.textTheme.bodyLarge?.color?.withOpacity(0.9),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
