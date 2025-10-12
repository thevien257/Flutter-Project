import 'package:flutter/material.dart';
import 'MyIconButton.dart';

class MyIconButtonsCard extends StatelessWidget {
  final VoidCallback onLike;
  final VoidCallback onShare;
  final VoidCallback onBookmark;
  final VoidCallback onComment;
  final int likeCount;

  const MyIconButtonsCard({
    super.key,
    required this.onLike,
    required this.onShare,
    required this.onBookmark,
    required this.onComment,
    required this.likeCount,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.all(8),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'ICON BUTTON',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MyIconButton(
                  icon: Icons.favorite,
                  color: Colors.red,
                  onPressed: onLike,
                  label: 'Likes: $likeCount',
                ),
                MyIconButton(
                  icon: Icons.share,
                  color: Colors.blue,
                  onPressed: onShare,
                ),
                MyIconButton(
                  icon: Icons.bookmark,
                  color: Colors.orange,
                  onPressed: onBookmark,
                ),
                MyIconButton(
                  icon: Icons.comment,
                  color: Colors.green,
                  onPressed: onComment,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
