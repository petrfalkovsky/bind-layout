import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart' hide Trans;
import 'package:get_it/get_it.dart';
import 'package:bind_layout/core/utils/stream_subscriber.dart';

class NiceEMeetYouService extends GetxService with StreamSubscriberMixin {
  NiceEMeetYouService();
}
