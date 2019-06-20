import 'package:flutter/material.dart';
import 'package:helloworld/ICondition.dart';

class CaseFactory{
  static const HANDLER_TIME = 50;
  static const HANDLER_TEMPERATURE = 51;
  static const HANDLER_NET = 52;
  static const HANDLER_CLOCK = 60;
  static const HANDLER_MUSIC = 61;
  static const HANDLER_GPS = 62;

  static ICondition getCondition(dynamic context, int type){
    switch (type){
      case HANDLER_TIME:
        return new TimeCondtion(context);
      case HANDLER_TEMPERATURE:
        return new TemperCondition(context);
      case HANDLER_NET:
        return new NetCondition(context);
      default:
        return null;
    }
  }

  public static IResults getResult(Context context, int type){
    switch (type) {
      case HANDLER_CLOCK:
        return new ClockResult(context);
      case HANDLER_MUSIC:
        return new MediaResult(context);
      case HANDLER_GPS:
        return new GpsResult(context);
      default:
        return null;
    }
  }


}