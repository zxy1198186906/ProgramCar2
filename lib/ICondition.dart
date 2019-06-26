import 'package:helloworld/RegexHelper.dart';
import 'package:flutter/services.dart';

class ICondition{
  static const AND = 0;
  static const OR = 1;
  static const NO = 2;

  static const HANDLER_TIME = 50;
  static const HANDLER_TEMPERATURE = 51;
  static const HANDLER_NET = 52;
  static const HANDLER_CLOCK = 60;
  static const HANDLER_MUSIC = 61;
  static const HANDLER_GPS = 62;

  var _mContext;
  String _mDesText;
  int _mMsgType;
  int _mRelation;
  bool _mRun;
  String _mName;

  ICondition(this._mContext, this._mName, this._mMsgType, this._mDesText, this._mRelation, this._mRun);

  String getDesText() => _mDesText;
  int getMsgType() => _mMsgType;
  int getRelation() => _mRelation;

  void setState(bool state){
    _mRun = state;
  }
  bool getState() => _mRun;

  String getName() => _mName;

  bool find(int equation, int number){ }

  Map<String, dynamic> toMap(){
    return {
      "type": _mMsgType,
      "desText": _mDesText,
      "relation": _mRelation,
      "state": _mRun
    };
  }
}

class TimeCondtion extends ICondition{
  TimeCondtion(mContext, String mName, int mMsgType, String mDesText, int mRelation, bool mRun) : super(mContext, mName, mMsgType, mDesText, mRelation, mRun);
    @override
    bool find(int equation, int hourTime) {
      // TODO: implement find
      var calendar = DateTime.now();
      int hour = calendar.hour;
      print("now the hour is $hour ");
      switch(equation){
        case RegexHelper.NUM_LESS:
          if(hour < hourTime)
            return true;
          break;
        case RegexHelper.NUM_MORE:
          if(hour > hourTime)
            return true;
          break;
      }
      return false;
    }
}

class TemperatureCondition extends ICondition {
  static const methodChannel = const MethodChannel("programcar.flutter.io/temperature");
  var _temperature;

  TemperatureCondition(mContext, String mName, int mMsgType, String mDesText, int mRelation, bool mRun) : super(mContext, mName, mMsgType, mDesText, mRelation, mRun);

  
  Future<dynamic> _getTemperature() async{
    try{
      var temperature = await methodChannel.invokeMethod("getTemperature");
      _temperature = temperature;
    }on PlatformException catch(e){
      print("get temperature failed : ${e.toString()}");
    }
  }

  @override
  bool find(int equation, int degree) {
    _getTemperature();
    switch (equation){
      case RegexHelper.NUM_LESS:
        if (_temperature < degree)
          return true;
        break;
      case RegexHelper.NUM_MORE:
        if (_temperature > degree)
          return true;
        break;
    }
    return false;
  }
}

class NetCondition extends ICondition{
  static const methodChannel = const MethodChannel("programcar.flutter.io/network");
  bool _isConnected;
  var _mContext;

  NetCondition(mContext, String mName, int mMsgType, String mDesText, int mRelation, bool mRun) : super(mContext, mName, mMsgType, mDesText, mRelation, mRun);


  Future<Null> _getNetwork() async{
    try {
      bool isConnected = await methodChannel.invokeMethod("getNetwork");
      _isConnected = isConnected;
    }on PlatformException catch (e){
      print("get network failed : ${e.toString()}");
    }
  }

  @override
  bool find(int equation, int state) {
    // TODO: implement find
    _getNetwork();
    switch (state){
      case RegexHelper.NUM_MORE:
        if (_isConnected)
          return true;
        break;
      case RegexHelper.NUM_LESS:
        if (! _isConnected)
          return true;
        break;
    }
    return false;
  }

}