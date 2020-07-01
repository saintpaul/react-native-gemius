package lu.athome;

import android.util.Log;

import com.facebook.react.bridge.NativeModule;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.Callback;

import com.gemius.sdk.Config;
import com.gemius.sdk.audience.AudienceConfig;
import com.gemius.sdk.audience.AudienceEvent;
import com.gemius.sdk.audience.BaseEvent.EventType;


public class RNReactNativeGemiusModule extends ReactContextBaseJavaModule {
    private static ReactApplicationContext reactContext;
    private String scriptIdentifierAndroid;
    private String collectorHost;

    public RNReactNativeGemiusModule(ReactApplicationContext context) {
        super(context);
        reactContext = context;
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

        this.scriptIdentifierAndroid = scriptIdentifierAndroid;
        this.collectorHost = host;
    }

    @ReactMethod
    public void getWebViewUserAgent(Callback successCallback) {
        String userAgent = Config.getUA4WebView(reactContext);

        successCallback.invoke(userAgent);
    }

    @ReactMethod
    public void sendPageViewedEvent() {
        Log.d("RNGemius", "Preparing Gemius event with script identifier: " + this.scriptIdentifierAndroid);
        AudienceEvent event = new AudienceEvent(reactContext);

        event.setScriptIdentifier(this.scriptIdentifierAndroid);
        event.setEventType(EventType.FULL_PAGEVIEW);
        event.sendEvent();
        Log.d("RNGemius", "Successfully send Gemius event");
    }
}
