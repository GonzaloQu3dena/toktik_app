import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:toktik_app/config/theme/app_theme.dart';
import 'package:toktik_app/discover/providers/discover_provider.dart';
import 'package:toktik_app/discover/screens/discover_screen.dart';
import 'package:toktik_app/discover/services/multimedia_service.dart';

Future<void> main() async {
  //await dotenv.load(fileName: ".env");
//
  //final multimediaService = MultimediaService(
  //  apiKey: dotenv.env['API_KEY']!,
  //  baseUrl: dotenv.env['API_URL']!,
  //);
//
  //try {
  //  final videoData = await multimediaService.getVideosByCategory('nature');
  //  print('Videos related to "nature": $videoData');
  //} catch (e) {
  //  print('Error: $e');
  //}

  await dotenv.load(fileName: ".env");

  final multimediaService = MultimediaService(
    apiKey: dotenv.env['API_KEY']!,
    baseUrl: dotenv.env['API_URL']!,
  );

  return runApp(
    MyApp(
      multimediaService: multimediaService,
    ),
  );
}

class MyApp extends StatelessWidget {
  final MultimediaService multimediaService;

  const MyApp({
    super.key,
    required this.multimediaService,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          lazy: false,
          create: (_) => DiscoverProvider(
            multimediaService: multimediaService,
          )..fetchVideosByCategory('nature'),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme().theme(),
        title: 'TokTik App',
        home: const DiscoverScreen(),
      ),
    );
  }
}
