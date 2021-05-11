package com.example.appgain_task

import android.net.Uri
import androidx.annotation.NonNull;
import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant;

class MainActivity: FlutterActivity() {
    private val CHANNEL = "com.appgain"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
       
        GeneratedPluginRegistrant.registerWith(flutterEngine);



        super.configureFlutterEngine(flutterEngine)

        var uri = intent.data;
        if(uri!=null){
            MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
                call, result ->
                // Note: this method is invoked on the main thread.
                // TODO

                if (call.method == "getData") {
                    val data = getData(uri)
                    result.success(data)


                } else {
                    result.notImplemented()
                }
            }
        }

    }

    private fun getData(uri:Uri):List<String> {

        var params = uri.pathSegments;
        return  params;

    }
}