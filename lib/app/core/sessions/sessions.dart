import 'package:get_storage/get_storage.dart';
import 'package:squeeze/app/core/constant/app_constants.dart';

class Sessions {
  static var box = GetStorage('Squeeze');

  static write(key, value) {
    box.write(key, value);
  }

  static read(key, {def}) {
    return box.read(key) ?? def;
  }

  static clear(key) {
    box.remove(key);
  }

  static reset() {
    box.erase();
  }
}
