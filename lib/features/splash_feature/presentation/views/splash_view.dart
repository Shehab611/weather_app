import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:video_player/video_player.dart';
import '../../../../core/utils/app_router.dart';
import '../../../../core/utils/get_current_location.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  late VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    super.initState();
    videoPlayerInit();
    navigateToHome(context);
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: VideoPlayer(_videoPlayerController),
    );
  }

  void videoPlayerInit() {
    _videoPlayerController = VideoPlayerController.asset(
        'assets/videos/Pastel_Clouds_Opener_360p.mp4')
      ..initialize().then((_) {
        setState(() {});
        _videoPlayerController.setPlaybackSpeed(1.5);
        _videoPlayerController.play();
      });
  }


  void navigateToHome(context) {
    Future.delayed(
        const Duration(
          seconds: 2,
        ), () {
      getLocation().then((value) => GoRouter.of(context).pushReplacement(
          AppRouter.kWeatherHomeView,
          extra: value));
    });
  }
}
