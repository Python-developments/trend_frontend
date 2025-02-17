import 'dart:async';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';

import 'package:share_plus/share_plus.dart';
import 'package:trend/core/utils/extensions.dart';
import 'package:trend/third_parties_modules/abstract/i_sharing_module.dart';

@Singleton(as: ISharingModule)
class SharingModule extends ISharingModule {
  SharingModule();

}
