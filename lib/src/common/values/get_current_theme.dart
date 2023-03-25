import 'dart:ui';

import 'package:flutter/scheduler.dart';

bool isDarkMode(){
  var brightness = SchedulerBinding.instance.window.platformBrightness;
  return brightness == Brightness.dark;
}