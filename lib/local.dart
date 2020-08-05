import 'package:task1/network.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:video_player/video_player.dart';

offlinevideos() {
  return SamplePlayer();
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
      videoPlayerController: VideoPlayerController.asset(
        "video/joker.mp4",
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

myApp() {
  var assetsAudioPlayer = AssetsAudioPlayer();

  network() {
    return online();
  }

  var offlinesongs = Playlist(
    audios: [
      Audio(
        'audio/1.mp3',
        metas: Metas(
          title: 'Falling',
          artist: 'Trevor Daniels',
        ),
      ),
      Audio(
        'audio/2.mp3',
        metas: Metas(
          title: 'Nagpuri',
          artist: 'Unknown',
        ),
      ),
    ],
  );

  offline() {
    //TODO Whole Offline Function
    return Stack(
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
          child: offlinevideos(), //TODO offlineVideo Function
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
                  fontSize: 25,
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
                        await assetsAudioPlayer.open(offlinesongs,
                            showNotification: true,
                            loopMode: LoopMode.playlist);
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
                      assetsAudioPlayer.playOrPause();
                    },
                  ),
                  IconButton(
                    iconSize: 50,
                    icon: Icon(
                      Icons.skip_next,
                      size: 60,
                    ),
                    onPressed: () {
                      assetsAudioPlayer.next();
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
      // ),
    );
  }

  var mydesign = Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.redAccent[500],
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.account_balance_wallet),
          onPressed: () => print(''),
        ),
        IconButton(
          icon: Icon(Icons.account_circle),
          onPressed: () => print(''),
        ),
      ],
      leading: IconButton(
        icon: Icon(Icons.play_circle_filled),
        onPressed: () => print(''),
      ),
      elevation: 15,
      title: Text(
        'NMX Player',
      ),
      bottom: TabBar(
        indicatorWeight: 1,
        indicatorColor: Colors.redAccent,
        tabs: [
          Tab(text: 'OFFLINE'),
          Tab(text: 'ONLINE'),
        ],
      ),
    ),
    body: TabBarView(
      children: [
        offline(),
        network(),
      ],
    ),
  );

  return MaterialApp(
    home: DefaultTabController(
      length: 2,
      child: mydesign,
    ),
    debugShowCheckedModeBanner: false,
  );
}
