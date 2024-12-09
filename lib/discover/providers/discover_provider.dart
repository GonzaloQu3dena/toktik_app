import 'package:flutter/material.dart';
import 'package:toktik_app/discover/infrastructure/models/video_model.dart';
import 'package:toktik_app/discover/services/multimedia_service.dart';
import 'package:toktik_app/discover/entities/video_post.dart';

class DiscoverProvider extends ChangeNotifier {
  final MultimediaService multimediaService;

  DiscoverProvider({
    required this.multimediaService,
  });

  // List to store video data
  List<VideoPost> videos = [];

  // Boolean to track loading state
  bool isLoading = false;

  // Method to fetch videos by category
  Future<void> fetchVideosByCategory(String category) async {
    isLoading = true;
    notifyListeners();

    try {
      // Fetch video data from the multimedia service
      final Map<String, dynamic> responseData =
          await multimediaService.getVideosByCategory(category);

      // Access only the "videos" key and cast to List<Map<String, dynamic>>
      final List<Map<String, dynamic>> videoData =
          List<Map<String, dynamic>>.from(responseData['videos']);

      // Map the video data to VideoPost entities
      videos = videoData
          .map(
            (json) => VideoModel.fromJsonMap(json).toVideoPostEntity(),
          )
          .toList();
    } catch (e) {
      // Handle error
      //print('Error fetching videos: $e');
    } finally {
      
      isLoading = false;
      notifyListeners();
    }
  }
}
