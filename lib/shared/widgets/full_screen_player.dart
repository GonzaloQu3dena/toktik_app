import 'package:flutter/material.dart';
import 'package:toktik_app/shared/widgets/video_background.dart';
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

        return GestureDetector(
          onTap: () {
            if (controller.value.isPlaying) {
              controller.pause();
              return;
            }
            controller.play();
          },
          child: AspectRatio(
            aspectRatio: controller.value.aspectRatio,
            child: Stack(
              children: [
                VideoPlayer(controller),
                VideoBackground(
                  stops: const [0.8, 1.0],
                ),
                Positioned(
                  bottom: 50,
                  left: 20,
                  child: _VideoCaption(caption: widget.caption),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

class _VideoCaption extends StatelessWidget {
  final String caption;

  const _VideoCaption({required this.caption});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final titleStyle = Theme.of(context).textTheme.titleLarge;

    return SizedBox(
      width: size.width * 0.6,
      child: Text(
        caption,
        maxLines: 2,
        style: titleStyle,
      ),
    );
  }
}
