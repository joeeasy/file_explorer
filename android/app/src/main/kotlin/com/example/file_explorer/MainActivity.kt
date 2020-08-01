package com.example.Explorer

import android.os.Bundle
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant
import java.io.File

class MainActivity: FlutterActivity() {
    private val CHANNEL = "storage"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
            call, result ->

            if(call.method.toString() == "getFreeDiskSpace") {
                val freeDiskSpace = getFreeDiskSpace()

                if(freeDiskSpace !=null) {
                    result.success(freeDiskSpace)
                } else {
                    result.error("No data", "nothing found", "Unable to get free disk space")
                }

            }
            if (call.method.toString() == "getTotalDiskSpace") {
                val totalStorage = getTotalDiskSpace()

                if(totalStorage !=null) {
                    result.success(totalStorage)
                } else {
                    result.error("No data", "nothing found", "Unable to get free disk space")
                }
            }
            // Note: this method is invoked on the main thread.
            // TODO
        }
    }

    private fun  getFreeDiskSpace(): Long {
        return  File(getExternalFilesDir(null).toString()).freeSpace
    }

    private fun  getTotalDiskSpace(): Long {
        return  File(getExternalFilesDir(null).toString()).totalSpace
    }
}
