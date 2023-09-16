// ignore: unused_import
import 'dart:io';

// ignore: unused_import
import 'package:flutter/widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';
// ignore: depend_on_referenced_packages
import 'package:path_provider/path_provider.dart';

class HiveConfig {
  static start() async {
    Directory dir = await getApplicationDocumentsDirectory() ;
    await Hive.initFlutter(dir.path);
  }
  
  
}