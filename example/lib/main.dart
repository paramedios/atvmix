// ignore_for_file: public_member_api_docs

// FOR MORE EXAMPLES, VISIT THE GITHUB REPOSITORY AT:
//
//  https://github.com/ryanheise/audio_service
//
// This example implements a minimal audio handler that renders the current
// media item and playback state to the system notification and responds to 4
// media actions:
//
// - play
// - pause
// - seek
// - stop
//
// To run this example, use:
//
// flutter run

import 'dart:async';
import 'dart:io';

import 'package:audio_service/audio_service.dart';
import 'package:audio_service_example/common.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart';
import 'package:url_strategy/url_strategy.dart';
import '/screens/home.dart';
import './widgets/credit_card.dart';
import './widgets/mock_data.dart';
import './env.dart';
import './page_transitions.dart';
import './models/student.dart';

// You might want to provide this using dependency injection rather than a
// global variable.
late AudioHandler _audioHandler;

Future<void> main() async {
  _audioHandler = await AudioService.init(
    builder: () => AudioPlayerHandler(),
    config: const AudioServiceConfig(
      androidNotificationChannelId: 'com.ryanheise.myapp.channel.audio',
      androidNotificationChannelName: 'Audio playback',
      androidNotificationOngoing: true,
    ),
  );
  runApp(const MyApp());
}

//  void main()=> runApp(
//     MaterialApp(
//      debugShowCheckedModeBanner: false,
//     home: HomePage()
// )
// );


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AUDIO SERVICIO PRUEBA',

      theme: ThemeData(
        colorScheme: ColorScheme(
          brightness: Brightness.light,
          surface: Colors.yellow,
          onSurface: Colors.black,
          // Colors that are not relevant to AppBar in DARK mode:
          primary: Colors.grey,
          onPrimary: Colors.grey,
          primaryVariant: Colors.blue,
          secondary: Colors.grey,
          secondaryVariant: Colors.grey,
          onSecondary: Colors.blue,
          background: Colors.grey,
          onBackground: Colors.grey,
          error: Colors.grey,
          onError: Colors.grey,
        ),
      ),
      // theme: ThemeData(
      //     primarySwatch: Colors.lightBlue
      // ),
      home:  MainScreen(),

    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String mainProfilePic = "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
    String otherProfilePic = "https://img.rawpixel.com/s3fs-private/rawpixel_images/website_content/368-mj-2516-02.jpg?w=800&dpr=1&fit=default&crop=default&q=65&vib=3&con=3&usm=15&bg=F4F4F3&ixlib=js-2.2.1&s=9f3d0ad657bbca1c0f2db36ad7deb323";

    return Scaffold(
     backgroundColor: Colors.black,

      appBar: AppBar(
        brightness: Brightness.dark,
        automaticallyImplyLeading: false,


        // leading: Builder(
        //   builder: (context) => IconButton(
        //     icon: new Icon(Icons.settings),
        //     onPressed: () => Scaffold.of(context).openDrawer(),
        //   ),
        // ),

        backgroundColor: Colors.grey[900],
        // title: Text(
        //   'RADIO SI',
        //   style: TextStyle(color: Color(0xffF02E65)), //<-- SEE HERE
        // ),
        title:
        Padding(
          padding: const EdgeInsets.all(30),
          child:        Image.network(
            "https://i0.wp.com/www.radiosi.com.ar/static/sia.png",
            fit: BoxFit.fill,

            height: 30,
          ),
        ),


        actions: [
          Builder(builder: (context) => // Ensure Scaffold is in context






    Padding(
    padding: const EdgeInsets.all(3),
      child:    CircleAvatar(
            radius: 30,
            backgroundColor: Color(0xFF1894EA),
            child: IconButton(
              icon: Icon(Icons.menu),

              color: Color(0xFFFFFFFF),
              iconSize: 20.0,
                onPressed: () => Scaffold.of(context).openDrawer()
            ),

          ),
          )),

        ],


        //
        //
        // actions: [
        //   Builder(builder: (context) => // Ensure Scaffold is in context
        //   IconButton(
        //       icon: Icon(Icons.menu),
        //       onPressed: () => Scaffold.of(context).openDrawer()
        //   )),
        // ],






        // actions: [
        //
        //   new Center(
        //       child:new Text(
        //         "aa",
        //         textScaleFactor: 1.5,
        //         style: new TextStyle(
        //           fontSize: 12.0,
        //           color: Colors.white,
        //         ),
        //       )),
        //   new IconButton(
        //     icon: new Icon(Icons.close),
        //     tooltip: 'Closes applssaication',
        //       onPressed: () => Scaffold.of(context).openDrawer(),
        //   ),
        //
        //   new IconButton(
        //     icon: new Image.asset('images/icons/logout.png'),
        //     tooltip: 'Closes application',
        //     onPressed: () => exit(0),
        //   ),
        //
        // ],
      ),




      //
      // appBar: new AppBar(
      //   title: new Text("a"),
      //   actions: [
      //
      //     new Center(
      //         child:new Text(
      //           "aa",
      //           textScaleFactor: 1.5,
      //           style: new TextStyle(
      //             fontSize: 12.0,
      //             color: Colors.white,
      //           ),
      //         )),
      //     new IconButton(
      //       icon: new Icon(Icons.close),
      //       tooltip: 'Closes applssaication',
      //       onPressed: () => exit(0),
      //     ),
      //
      //     new IconButton(
      //       icon: new Image.asset('images/icons/logout.png'),
      //       tooltip: 'Closes application',
      //       onPressed: () => exit(0),
      //     ),
      //
      //   ],
      // ),

      body:  Home(),


      // body: ListView.builder(
      //     itemCount: 15,
      //
      //     itemBuilder: (BuildContext context,int index){
      //
      //       if(index%4 == 0){
      //         return CreditCard(data: creditCardData);
      //
      //
      //       } else {
      //         return ListTile(
      //             leading: const Icon(Icons.list),
      //
      //             title:Text("List item $index")
      //         );
      //
      //       }
      //
      //
      //     }
      // ),
        drawer: new Drawer(
            child:  ListView(
              children: <Widget>[
                UserAccountsDrawerHeader(
                  accountName: Text("JoDDDhn Doe"),
                  accountEmail: Text("johnDDdoe@email.com"),
                  currentAccountPicture: GestureDetector(
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(mainProfilePic),
                      ),
                      onTap: () => print("Current User")
                  ),

                  //.. This line of code provides the usage of multiple accounts
                  /* otherAccountsPictures: <Widget>[
              GestureDetector(
                onTap: ()=> switchUser(),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(otherProfilePic)
                ),
              ),
            ], */

                  decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage("https://png.pngtree.com/thumb_back/fh260/background/20190828/pngtree-dark-vector-abstract-background-image_302715.jpg")
                    ),
                  ),
                ),
                ListTile(
                    title: Text("Home Page"),
                    trailing: Icon(Icons.menu),
                    onTap: () {
                      Navigator.of(context).pop();

                    }
                ),

                ListTile(
                    title: Text("About Page"),
                    trailing: Icon(Icons.info),
                    onTap: () {
                      Navigator.of(context).pop();

                    }
                ),

                ListTile(
                    title: Text("Settings Page"),
                    trailing: Icon(Icons.security),
                    onTap: () {
                      Navigator.of(context).pop();

                    }
                ),
                Divider(thickness: 1.0,),
                ListTile(
                  title: Text("Close"),
                  trailing: Icon(Icons.cancel),
                  onTap: () => Navigator.of(context).pop(),
                ),
              ],
            )
        ),
      persistentFooterButtons: <Widget>[

        Container(
            decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(17)),

            child: Row(

          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: <Widget>[

            StreamBuilder<bool>(
              stream: _audioHandler.playbackState
                  .map((state) => state.playing)
                  .distinct(),

              builder: (context, snapshot) {
                final playing = snapshot.data ?? false;
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
////                    _button(Icons.fast_rewind, _audioHandler.rewind),
                    if (playing)
                      _butEon(Icons.pause,0xFF101010, _audioHandler.pause)
                    else
                      _butEon(Icons.play_arrow,0xFFE12504, _audioHandler.play),
                    ////                _button(Icons.stop, _audioHandler.stop),
                  ],
                );
              },
            ),


            StreamBuilder<MediaState>(
              stream: _mediaStateStream,
              builder: (context, snapshot) {
                final mediaState = snapshot.data;
                return SeekBar(
                  duration: mediaState?.mediaItem?.duration ?? Duration.zero,
                  position: mediaState?.position ?? Duration.zero,
                  onChangeEnd: (newPosition) {
                    _audioHandler.seek(newPosition);
                  },
                );
              },
            ),





            StreamBuilder<MediaItem?>(
              stream: _audioHandler.mediaItem,
              builder: (context, snapshot) {
                final mediaItem = snapshot.data;

                return Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Text(mediaItem?.title ?? '',
                        style: const TextStyle(fontSize: 20)));


                Text(mediaItem?.title ?? '',
                  style: const TextStyle(fontSize: 30),
                );
              },
            ),


          ],
        )
    ),
      ],






    //
    //
    //   persistentFooterButtons: const [
    //     Icon(Icons.settings),
    //     SizedBox(width: 5),
    //     Icon(Icons.exit_to_app),
    //     SizedBox(width: 10,),
    //     RaisedButton(
    //       child: Text("CONFIRM"),
    //       color: Colors.blue,
    //
    //       textColor: Colors.white,
    //       onPressed: null,
    //
    //     ),
    //   CircleAvatar(
    //   radius: 30,
    //   backgroundColor: Color(0xFFE12504),
    //
    //   child: IconButton(
    //     icon: Icon(Icons.play_arrow),
    //
    //     color: Color(0xFFFFFFFF),
    //     iconSize: 32.0,
    //     onPressed: null,
    //   ),
    // ),
    //
    //
    // ],
    //



//       persistentFooterButtons: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             // Show media item title
//             StreamBuilder<MediaItem?>(
//               stream: _audioHandler.mediaItem,
//               builder: (context, snapshot) {
//                 final mediaItem = snapshot.data;
//
//                 return Padding(
//                       padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
//                       child: Text(mediaItem?.title ?? '',
//                           style: const TextStyle(fontSize: 50)));
//
//
//                   Text(mediaItem?.title ?? '',
//                   style: const TextStyle(fontSize: 30),
//                 );
//               },
//             ),
//
//
//             // Play/pause/stop buttons.
//             StreamBuilder<bool>(
//               stream: _audioHandler.playbackState
//                   .map((state) => state.playing)
//                   .distinct(),
//
//               builder: (context, snapshot) {
//                 final playing = snapshot.data ?? false;
//                 return Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//
//                   children: [
// ////                    _button(Icons.fast_rewind, _audioHandler.rewind),
//                     if (playing)
//                       _butEon(Icons.pause,0xFF101010, _audioHandler.pause)
//                     else
//                       _butEon(Icons.play_arrow,0xFFE12504, _audioHandler.play),
//     ////                _button(Icons.stop, _audioHandler.stop),
//                   ],
//                 );
//               },
//             ),
//             // A seek bar.
//             // StreamBuilder<MediaState>(
//             //   stream: _mediaStateStream,
//             //   builder: (context, snapshot) {
//             //     final mediaState = snapshot.data;
//             //     return SeekBar(
//             //       duration: mediaState?.mediaItem?.duration ?? Duration.zero,
//             //       position: mediaState?.position ?? Duration.zero,
//             //       onChangeEnd: (newPosition) {
//             //         _audioHandler.seek(newPosition);
//             //       },
//             //     );
//             //   },
//             // ),
//             // Display the processing state.
//             StreamBuilder<AudioProcessingState>(
//               stream: _audioHandler.playbackState
//                   .map((state) => state.processingState)
//                   .distinct(),
//               builder: (context, snapshot) {
//                 final processingState =
//                     snapshot.data ?? AudioProcessingState.idle;
//                 return Text(
//                     "NECO : ${describeEnum(processingState)}");
//               },
//             ),
//           ],
//         ),
//       ),
    );
  }

  /// A stream reporting the combined state of the current media item and its
  /// current position.
  Stream<MediaState> get _mediaStateStream =>
      Rx.combineLatest2<MediaItem?, Duration, MediaState>(
          _audioHandler.mediaItem,
          AudioService.position,
          (mediaItem, position) => MediaState(mediaItem, position));

  IconButton _button(IconData iconData, VoidCallback onPressed) => IconButton(
        icon: Icon(iconData),

        iconSize: 64.0,
        onPressed: onPressed,
      );


  CircleAvatar _butEon(IconData iconData, int kcolor,VoidCallback onPressed) => CircleAvatar(
    radius: 30,
    backgroundColor: Color(kcolor),

    child: IconButton(
      icon: Icon(iconData),

      color: Color(0xFFFFFFFF),
      iconSize: 32.0,
      onPressed: onPressed,
    ),
  );







}

class MediaState {
  final MediaItem? mediaItem;
  final Duration position;

  MediaState(this.mediaItem, this.position);
}

/// An [AudioHandler] for playing a single item.
class AudioPlayerHandler extends BaseAudioHandler with SeekHandler {
  static final _item = MediaItem(
    id: 'http://s2.netradiofm.com:9950/stream',
    album: "RADIO",
    title: "NECO",
    artist: "EN VIVO",
    duration: const Duration(milliseconds: 0),
    artUri: Uri.parse(
        'https://media.wnyc.org/i/1400/1400/l/80/1/ScienceFriday_WNYCStudios_1400.jpg'),
  );

  final _player = AudioPlayer();

  /// Initialise our audio handler.
  AudioPlayerHandler() {
    // So that our clients (the Flutter UI and the system notification) know
    // what state to display, here we set up our audio handler to broadcast all
    // playback state changes as they happen via playbackState...
    _player.playbackEventStream.map(_transformEvent).pipe(playbackState);
    // ... and also the current media item via mediaItem.
    mediaItem.add(_item);

    // Load the player.
    _player.setAudioSource(AudioSource.uri(Uri.parse(_item.id)));
  }

  // In this simple example, we handle only 4 actions: play, pause, seek and
  // stop. Any button press from the Flutter UI, notification, lock screen or
  // headset will be routed through to these 4 methods so that you can handle
  // your audio playback logic in one place.

  @override
  Future<void> play() => _player.play();

  @override
  Future<void> pause() => _player.pause();

  @override
  Future<void> seek(Duration position) => _player.seek(position);

  @override
  Future<void> stop() => _player.stop();

  /// Transform a just_audio event into an audio_service state.
  ///
  /// This method is used from the constructor. Every event received from the
  /// just_audio player will be transformed into an audio_service state so that
  /// it can be broadcast to audio_service clients.
  PlaybackState _transformEvent(PlaybackEvent event) {
    return PlaybackState(
      controls: [
       // MediaControl.rewind,
        if (_player.playing) MediaControl.pause else MediaControl.play,
        MediaControl.stop,
///        MediaControl.fastForward,
      ],
      systemActions: const {
        MediaAction.seek,
        MediaAction.seekForward,
        MediaAction.seekBackward,
      },
     // androidCompactActionIndices: const [0, 1, 3],

      androidCompactActionIndices: const [0],
      processingState: const {
        ProcessingState.idle: AudioProcessingState.idle,
        ProcessingState.loading: AudioProcessingState.loading,
        ProcessingState.buffering: AudioProcessingState.buffering,
        ProcessingState.ready: AudioProcessingState.ready,
        ProcessingState.completed: AudioProcessingState.completed,
      }[_player.processingState]!,
      playing: _player.playing,
      updatePosition: _player.position,
      bufferedPosition: _player.bufferedPosition,
      speed: _player.speed,
      queueIndex: event.currentIndex,
    );
  }
}
