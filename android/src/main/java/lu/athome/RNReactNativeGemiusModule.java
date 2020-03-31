package lu.athome;

import android.util.Log;

import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.Callback;
import com.gemius.sdk.Config;
import com.gemius.sdk.audience.AudienceConfig;
import com.gemius.sdk.audience.AudienceEvent;


public class RNReactNativeGemiusModule extends ReactContextBaseJavaModule {

    private final ReactApplicationContext reactContext;

    public RNReactNativeGemiusModule(ReactApplicationContext reactContext) {
        super(reactContext);
        this.reactContext = reactContext;
    }

    @Override
    public String getName() {
        return "RNReactNativeGemius";
    }

    /*
     * invoked in example project
     */
    @ReactMethod
    public void sampleMethod(String stringArgument, int numberArgument, Callback callback) {
        // TODO: Implement some actually useful functionality
        callback.invoke("sampleMethod called" );
    }


    @ReactMethod
    public void setAppInfo(String app, String version) {
        try {
            Config.setLoggingEnabled(true);
            Config.setAppInfo(app, version);
        } catch (Exception e) {
            Log.d("RNGemius", "An error has occurred while calling gemius lib", e);
        }
    }

    @ReactMethod
    public void setGemiusInfo(String host, String scriptIdentifierIos, String scriptIdentifierAndroid) {
        AudienceConfig.getSingleton().setHitCollectorHost(host);
        AudienceConfig.getSingleton().setScriptIdentifier(scriptIdentifierAndroid);
    }


    @ReactMethod
    public void sendPageViewedEvent() {
        AudienceEvent event = new AudienceEvent(reactContext);
        event.sendEvent();
    }
}
