/// Video Post
/// 
/// This class is used to represent a entity of a video post.
/// 
/// Gonzalo Quedena
class VideoPost {
  final String caption;
  final String videoUrl;
  final int likes;
  final int views;

  VideoPost({
    required this.caption,
    required this.videoUrl,
    this.likes = 0,
    this.views = 0,
  });
}
