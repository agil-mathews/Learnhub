import 'package:flutter/material.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:video_player/video_player.dart';

class SamplePlayer extends StatefulWidget {
 
  final String? previewUrl;
  const SamplePlayer({super.key, required this.previewUrl});

 

  @override
  // ignore: library_private_types_in_public_api, no_logic_in_create_state
  _SamplePlayerState createState() => _SamplePlayerState(previewUrl: '');
}

class _SamplePlayerState extends State<SamplePlayer> {
  late FlickManager flickManager;
   final String previewUrl;

  _SamplePlayerState({required this.previewUrl});


  
  @override
  void initState() {
    super.initState();
    _initializePlayer(widget.previewUrl);
  }

   void _initializePlayer(String? url) {
    flickManager = FlickManager(
      videoPlayerController: VideoPlayerController.networkUrl(Uri.parse(url!)),
      autoPlay: false,
    );
  }

    @override
  void didUpdateWidget(SamplePlayer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.previewUrl != widget.previewUrl) {
      setState(() {
        flickManager.dispose();
        _initializePlayer(widget.previewUrl);
      });
    }
  }

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230,
      child: FlickVideoPlayer(flickManager: flickManager,
     
      ),);
        
            
  }
}