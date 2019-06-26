import 'package:helloworld/ICondition.dart';
import 'package:flutter/services.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audio_cache.dart';

class IResult extends ICondition{
  IResult(mContext, String mName, int mMsgType, String mDesText, int mRelation, bool mRun) : super(mContext, mName, mMsgType, mDesText, mRelation, mRun);

  void startAction(){}
  void stopAction(){ }
}

class ClockResult extends IResult{
  var _mContext;

  static const methodChannel = const MethodChannel("programcar.flutter.io/clock");

  ClockResult(mContext, String mName, int mMsgType, String mDesText, int mRelation, bool mRun) : super(mContext, mName, mMsgType, mDesText, mRelation, mRun);

  @override
  bool find(int equation, int number) {
    // TODO: implement find
    return null;
  }

  Future<Null> _setClock(bool on) async{
    try {
      if(on)
        await methodChannel.invokeMethod("setClockOn");
      else
        await methodChannel.invokeMethod("setClockOff");
    }on PlatformException catch (e){
      print("set clock failed : ${e.toString()}");
    }
  }

  @override
  void startAction() {
    // TODO: implement startAction
    _setClock(true);
  }

  @override
  void stopAction() {
    // TODO: implement stopAction
    _setClock(false);
  }

}

class MediaResult extends IResult{
  var _mContext;

  AudioPlayer player = AudioPlayer();

  MediaResult(mContext, String mName, int mMsgType, String mDesText, int mRelation, bool mRun) : super(mContext, mName, mMsgType, mDesText, mRelation, mRun);
  
  Future _loadMusic() async{
    player = await AudioCache().loop('aircity.mp3');
  }

  @override
  bool find(int equation, int number) {
    // TODO: implement find
    return null;
  }

  @override
  void startAction() {
    // TODO: implement startAction
    _loadMusic();
  }

  @override
  void stopAction() {
    // TODO: implement stopAction
    player?.stop();
  }
}

class GpsResult extends IResult {
  var _mContext;

  GpsResult(mContext, String mName, int mMsgType, String mDesText, int mRelation, bool mRun) : super(mContext, mName, mMsgType, mDesText, mRelation, mRun);


  @override
  void startAction() { }

  @override
  void stopAction() { }

  @override
  bool find(int equation, int number) {
    // TODO: implement find
    return null;
  }
}