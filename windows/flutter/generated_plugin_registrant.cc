//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <geolocator_windows/geolocator_windows.h>
#include <tflite_flutter_helper/tflite_flutter_helper_plugin.h>

void RegisterPlugins(flutter::PluginRegistry* registry) {
  GeolocatorWindowsRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("GeolocatorWindows"));
  TfliteFlutterHelperPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("TfliteFlutterHelperPlugin"));
}
