package volvocars.helloworld;

import android.annotation.TargetApi;
import android.app.AlarmManager;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.hardware.Sensor;
import android.hardware.SensorEvent;
import android.hardware.SensorEventListener;
import android.hardware.SensorManager;
import android.net.ConnectivityManager;
import android.net.Network;
import android.net.NetworkInfo;
import android.os.Bundle;
import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {
  private static final String METHODCHANNEL_TEMPER = "programcar.flutter.io/temperature";
  private static final String METHODCHANNEL_NET = "programcar.flutter.io/network";
  private static final String METHODCHANNEL_CLOCK = "programcar.flutter.io/clock";


  private static float pTemperature;
  private static Sensor pSensor;
  private static SensorManager pSensorManager;
  private static ConnectivityManager pConnectManager;
  private static AlarmManager pAlarmManager;

  @TargetApi(28)
  private static final SensorEventListener pListener = new SensorEventListener() {
    @Override
    public void onSensorChanged(SensorEvent event) {
      if (Sensor.TYPE_TEMPERATURE == event.sensor.getType())
        pTemperature = event.values[0];
    }

    @Override
    public void onAccuracyChanged(Sensor sensor, int accuracy) {

    }
  };

  @Override
  @TargetApi(28)
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    GeneratedPluginRegistrant.registerWith(this);

    pSensorManager = (SensorManager) getSystemService(Context.SENSOR_SERVICE);
    pConnectManager = (ConnectivityManager) getSystemService(Context.CONNECTIVITY_SERVICE);
    pAlarmManager = (AlarmManager) getSystemService(Context.ALARM_SERVICE);
    pSensor = pSensorManager.getDefaultSensor(Sensor.TYPE_TEMPERATURE);
    pSensorManager.registerListener(pListener, pSensor, SensorManager.SENSOR_DELAY_NORMAL);

    new MethodChannel(getFlutterView(), METHODCHANNEL_TEMPER).setMethodCallHandler(
            new MethodChannel.MethodCallHandler() {
              @Override
              public void onMethodCall(MethodCall methodCall, MethodChannel.Result result) {
                if (methodCall.method.equals("getTemperature")){
                  float tempTemperature = getTemperature();

                  if (tempTemperature != -1)
                    result.success(tempTemperature);
                  else
                    result.error("INVALID", "Temperature Sensor not valid.", null);
                }else{
                  result.notImplemented();
                }
              }
            }
    );

    new MethodChannel(getFlutterView(), METHODCHANNEL_NET).setMethodCallHandler(
            new MethodChannel.MethodCallHandler() {
              @Override
              public void onMethodCall(MethodCall methodCall, MethodChannel.Result result) {
                if (methodCall.method.equals("getNetwork")){
                  boolean tempNetwork = getNetwork();
                  result.success(tempNetwork);
                }else{
                  result.notImplemented();
                }
              }
            }
    );

    new MethodChannel(getFlutterView(), METHODCHANNEL_CLOCK).setMethodCallHandler(
            new MethodChannel.MethodCallHandler() {
              @Override
              public void onMethodCall(MethodCall methodCall, MethodChannel.Result result) {
                Intent clockIntent = new Intent();
                PendingIntent pIntent = PendingIntent.getBroadcast(MainActivity.this, 0, clockIntent, 0);
                if (methodCall.method.equals("setClockOn"))
                  pAlarmManager.setRepeating(AlarmManager.RTC_WAKEUP, System.currentTimeMillis(), 5 * 1000, pIntent);
                else if (methodCall.method.equals("setClockOff"))
                  pAlarmManager.cancel(pIntent);
                else
                  result.notImplemented();
              }
            }
    );
  }

  @TargetApi(28)
  private float getTemperature(){
    return this.pTemperature;
  }

  @TargetApi(28)
  private boolean getNetwork(){
    NetworkInfo localInfo = pConnectManager.getActiveNetworkInfo();
    if ((null != localInfo) && localInfo.isAvailable())
      return true;
    return false;
  }


}
