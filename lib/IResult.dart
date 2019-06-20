import 'package:helloworld/ICondition.dart';
import 'package:flutter/services.dart';

abstract class IResult extends ICondition{
  void startAction();
  void stopAction();
}

class ClockResult extends IResult{
  var _mContext;
  static const methodChannel = const MethodChannel("programcar.flutter.io/clock");

  ClockResult(var context){
    _mContext = context;
  }

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


  MediaResult(var context){
    _mContext = context;
  }

  @override
  bool find(int equation, int number) {
    // TODO: implement find
    return null;
  }

  @override
  void startAction() {
    // TODO: implement startAction
  }

  @override
  void stopAction() {
    // TODO: implement stopAction
  }


}