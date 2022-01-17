import 'dart:async';

import 'package:agora_rtc_engine/rtc_engine.dart';
// import 'package:agora_rtc_engine/rtc_local_view.dart' as RtcLocalView;
// import 'package:agora_rtc_engine/rtc_remote_view.dart' as RtcRemoteView;
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:voice_chat_flutter/main.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool _joined = false;
  int _remoteUid = 0;
  bool _switch = false;

  @override
  void initState() {
    super.initState();

  }

  Future<void> initPlatformState() async {
    // Get microphone permission
    await [Permission.microphone].request();

    // Create RTC client instance
    RtcEngineContext context = RtcEngineContext(appId);
    var engine = await RtcEngine.createWithContext(context);
    // Define event handling logic
    engine.setEventHandler(RtcEngineEventHandler(
        joinChannelSuccess: (String channel, int uid, int elapsed) {
          print('joinChannelSuccess $channel $uid');
          setState(() {
            _joined = true;
          });
        }, userJoined: (int uid, int elapsed) {
      print('userJoined $uid');
      setState(() {
        _remoteUid = uid;
      });
    }, userOffline: (int uid, UserOfflineReason reason) {
      print('userOffline $uid');
      setState(() {
        _remoteUid = 0;
      });
    }));
    // Join channel with channel name as 123
    await engine.enableAudio();
    await engine.joinChannel(Token, '123', null, 0);
    print('done');
  }
  Future<void> disposePlatformState() async {
    // Get microphone permission
    await [Permission.microphone].request();

    // Create RTC client instance
    RtcEngineContext context = RtcEngineContext(appId);
    var engine = await RtcEngine.createWithContext(context);
    // Define event handling logic
    engine.setEventHandler(RtcEngineEventHandler(
        joinChannelSuccess: (String channel, int uid, int elapsed) {
          print('joinChannelSuccess $channel $uid');
          setState(() {
            _joined = true;
          });
        }, userJoined: (int uid, int elapsed) {
      print('userJoined $uid');
      setState(() {
        _remoteUid = uid;
      });
    }, userOffline: (int uid, UserOfflineReason reason) {
      print('userOffline $uid');
      setState(() {
        _remoteUid = 0;
      });
    }));
    // Join channel with channel name as 123
    await engine.enableAudio();
    // await engine.joinChannel(Token, '123', null, 0);
    await engine.leaveChannel();
    print('done');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: ElevatedButton.icon(
                  onPressed: () {
                    initPlatformState();
                  },
                  icon: const Icon(Icons.mic),
                  label: const Text('Mic On'),
                ),
              ),
              Center(
                child: ElevatedButton.icon(
                  onPressed: () {
                    disposePlatformState();
                  },
                  icon: const Icon(Icons.mic_off),
                  label: const Text('Mic Off'),
                ),
              ),
            ],
          ),
        ));
  }
}
