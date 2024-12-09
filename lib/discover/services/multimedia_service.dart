import 'package:dio/dio.dart';

/// Multimedia Service
/// 
/// A service class to interact with the multimedia API. Is responsible for fetching video data.
/// 
/// Gonzalo Quedena
class MultimediaService {
  final Dio _dio = Dio();
  late final String apiKey;
  late final String baseUrl;

  MultimediaService({
    required this.apiKey,
    required this.baseUrl,
  });

  /// Get videos by Id
  /// 
  /// Fetches a video by its ID.
  Future<Map<String, dynamic>> getVideoByIdAsync(int videoId) async {
    _dio.options.headers['Authorization'] = apiKey;

    try {
      final response = await _dio.get(
        '$baseUrl/videos/$videoId',
      );

      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception(
            'Failed to load video, status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  /// Get videos by category
  /// 
  /// Fetches videos by a given category.
  Future<Map<String, dynamic>> getVideosByCategory(String category) async {
    _dio.options.headers['Authorization'] = apiKey;

    try {
      final response = await _dio.get(
        '$baseUrl/search?query=$category',
      );

      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception(
            'Failed to load videos, status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
