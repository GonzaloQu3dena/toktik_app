import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:toktik_app/config/helpers/human_formarts.dart';
import 'package:toktik_app/discover/entities/video_post.dart';

/// Video Buttons
///
/// This class is used to create the buttons for the video.
///
/// Gonzalo Quedena
class VideoButtons extends StatelessWidget {
  final VideoPost video;

  const VideoButtons({
    super.key,
    required this.video,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _CustomIconButton(
          value: video.likes + 1,
          iconData: Icons.favorite,
          color: Colors.red,
        ),
        const SizedBox(
          height: 20,
        ),
        _CustomIconButton(
          value: video.likes + 1,
          iconData: Icons.remove_red_eye_outlined,
        ),
        const SizedBox(
          height: 20,
        ),
        SpinPerfect(
          infinite: true,
          duration: const Duration(
            seconds: 5,
          ),
          child: _CustomIconButton(
            value: video.likes,
            iconData: Icons.play_circle_outline,
          ),
        ),
      ],
    );
  }
}

/// Custom Icon Button
///
/// This class is used to create a custom icon button.
///
/// Gonzalo Quedena
class _CustomIconButton extends StatelessWidget {
  final int value;
  final IconData iconData;
  final Color? color;

  const _CustomIconButton({
    required this.value,
    required this.iconData,
    this.color = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            iconData,
            color: color,
            size: 30,
          ),
        ),
        if (value > 0)
          Text(
            HumanFormats.humanReadbleNumber(value.toDouble()),
            style: TextStyle(
              color: color,
              fontSize: 12,
            ),
          ),
      ],
    );
  }
}
