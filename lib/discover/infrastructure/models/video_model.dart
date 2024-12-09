import 'package:toktik_app/discover/entities/video_post.dart';

/// Video Model
///
/// A model class to represent a video entity. This class is used to map the JSON response from the API to a Dart object.
///
/// Gonzalo Quedena
class VideoModel {
  int id;
  String fileType;
  String link;
  int likes;
  int views;

  VideoModel({
    required this.id,
    required this.fileType,
    required this.link,
    this.likes = 0,
    this.views = 0,
  });

  /// fromJsonMap
  ///
  /// A factory constructor that creates a VideoModel instance from a JSON map.
  factory VideoModel.fromJsonMap(Map<String, dynamic> json) {
    // Extract the video files from the JSON response
    final List<dynamic> videoFiles = json['video_files'] ?? [];

    // Get the first video file from the list
    final Map<String, dynamic>? firstVideoFile =
        videoFiles.isNotEmpty ? videoFiles.first : null;

    // Return a new VideoModel instance
    return VideoModel(
      id: json["id"] ?? 0,
      fileType: firstVideoFile?["file_type"] ?? "no file type",
      link: firstVideoFile?["link"] ?? "no link",
      likes: firstVideoFile?["likes"] ?? 0,
      views: firstVideoFile?["views"] ?? 0,
    );
  }

  /// toJson
  ///
  /// A method that converts a VideoModel instance to a JSON map.
  Map<String, dynamic> toJson() => {
        "id": id,
        "file_type": fileType,
      };

  /// toVideoPostEntity
  ///
  /// A method that converts a VideoModel instance to a VideoPost entity.
  VideoPost toVideoPostEntity() => VideoPost(
        caption: fileType,
        videoUrl: link,
        likes: likes,
        views: views,
      );
}
