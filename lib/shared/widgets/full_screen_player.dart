import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

/// Full Screen Player
///
/// This widget is used to display a full screen player.
///
/// Gonzalo Quedena
class FullScreenPlayer extends StatefulWidget {
  final String url;
  final String caption;

  const FullScreenPlayer({
    super.key,
    required this.url,
    required this.caption,
  });

  @override
  State<FullScreenPlayer> createState() => _FullScreenPlayerState();
}

/// Full Screen Player State
///
/// This class is used to manage the state of the FullScreenPlayer widget.
///
/// Gonzalo Quedena
class _FullScreenPlayerState extends State<FullScreenPlayer> {
  late VideoPlayerController controller;

  /// Init State
  ///
  /// This method is used to initialize the state of the widget.
  @override
  void initState() {
    super.initState();

    controller = VideoPlayerController.asset(widget.url)
      ..setVolume(0)
      ..setLooping(true)
      ..play();
  }

  /// Dispose
  ///
  /// This method is used to dispose the controller. Avoiding memory leaks.
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: controller.initialize(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(
            child: CircularProgressIndicator(
              strokeWidth: 2,
            ),
          );
        }

        return AspectRatio(
          aspectRatio: controller.value.aspectRatio,
          child: VideoPlayer(controller),
        );
      },
    );
  }
}
