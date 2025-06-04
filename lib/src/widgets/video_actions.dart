import 'package:flutter/material.dart';

import '../core/models/video_model.dart';

class VideoActions extends StatelessWidget {
  final VideoModel video;
  final VoidCallback onLike;
  final VoidCallback onSave;
  final VoidCallback onDownload;

  const VideoActions({
    super.key,
    required this.video,
    required this.onLike,
    required this.onSave,
    required this.onDownload,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _ActionButton(
          icon: video.isLiked ? Icons.favorite : Icons.favorite_border,
          label: video.likes.toString(),
          color: video.isLiked ? Colors.red : Colors.white,
          onTap: onLike,
        ),
        const SizedBox(height: 16),
        _ActionButton(
          icon: video.isSaved ? Icons.bookmark : Icons.bookmark_border,
          label: 'Save',
          onTap: onSave,
        ),
        const SizedBox(height: 16),
        _ActionButton(
          icon: Icons.download,
          label: 'Download',
          onTap: onDownload,
        ),
      ],
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color? color;
  final VoidCallback onTap;

  const _ActionButton({
    required this.icon,
    required this.label,
    this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: color ?? Colors.white,
            size: 32,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: color ?? Colors.white,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
