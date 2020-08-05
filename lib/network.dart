import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:video_player/video_player.dart';

onlinevideos() {
  return SamplePlayer(); // TODO Online video code return
}

class SamplePlayer extends StatefulWidget {
  SamplePlayer({Key key}) : super(key: key);

  @override
  _SamplePlayerState createState() => _SamplePlayerState();
}

class _SamplePlayerState extends State<SamplePlayer> {
  FlickManager flickManager;
  @override
  void initState() {
    super.initState();
    flickManager = FlickManager(
      autoPlay: false,
      videoPlayerController: VideoPlayerController.network(
        "https://github.com/Navinkl/navin/blob/master/irfan.mp4",
      ),
    );
  }

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlickVideoPlayer(flickManager: flickManager),
    );
  }
}

var onlinesongs = Playlist(
  audios: [
    Audio.network(
      'https://raw.githubusercontent.com/Navinkl/navin/master/Opening_Credits___Game_of_Thrones___Season_8_(HBO)(256kbps)%5B1%5D.mp3',
      metas: Metas(
        title: 'Games of Thrones',
      ),
    ),
    Audio.network(
      'https://raw.githubusercontent.com/Navinkl/navin/master/Pubg_AWM_Sound_Ringtone_%5BDownload_Link%5D(256kbps)%5B1%5D.mp3',
      metas: Metas(
        title: 'PUBG AWM shot',
      ),
    ),
  ],
);

online() {
  // TODO Online Audio Code
  var audio = AssetsAudioPlayer();
  return Container(
    child: Stack(
      children: <Widget>[
        Container(
          width: double.infinity,
          height: 400,
          decoration: BoxDecoration(
            border: Border.all(
              width: 3,
              color: Colors.black,
            ),
          ),
          child: onlinevideos(),
        ),
        Container(
          margin: EdgeInsets.only(top: 400),
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'SONGS',
                style: TextStyle(
                  fontStyle: FontStyle.normal,
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                  height: -1,
                  decoration: TextDecoration.underline,
                  decorationStyle: TextDecorationStyle.dashed,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                    iconSize: 50,
                    icon: Icon(
                      Icons.play_arrow,
                      size: 60,
                    ),
                    onPressed: () async {
                      try {
                        await audio.open(onlinesongs,
                            showNotification: true,
                            loopMode: LoopMode.playlist);
                        // audio.previous();
                      } catch (t) {
                        // mp3 unreachable
                      }
                    },
                  ),
                  IconButton(
                    iconSize: 50,
                    icon: Icon(
                      Icons.pause_circle_filled,
                      size: 60,
                    ),
                    onPressed: () {
                      audio.playOrPause();
                    },
                  ),
                  IconButton(
                    iconSize: 50,
                    icon: Icon(
                      Icons.skip_next,
                      size: 60,
                    ),
                    onPressed: () {
                      audio.next();
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
