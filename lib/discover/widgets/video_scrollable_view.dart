import 'package:flutter/material.dart';
import 'package:toktik_app/discover/entities/video_post.dart';
import 'package:toktik_app/discover/widgets/full_screen_player.dart';
import 'package:toktik_app/discover/widgets/video_buttons.dart';

/// Video Scrollable View
/// 
/// This widget is used to display a list of videos in a scrollable view. 
class VideoScrollableView extends StatelessWidget {
  final List<VideoPost> videos;

  const VideoScrollableView({
    super.key,
    required this.videos,
  });

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      physics: const ClampingScrollPhysics(),
      itemCount: videos.length,
      itemBuilder: (context, index) {
        final videoPost = videos[index];

        return Stack(
          children: [

            SizedBox.expand(
              child: FullScreenPlayer(
                url: videoPost.videoUrl,
                caption: videoPost.caption,
              ),
            ),

            Positioned(
              bottom: 40,
              right: 20,
              child: VideoButtons(
                video: videoPost,
              ),
            ),
          ],
        );
      },
    );
  }
}
