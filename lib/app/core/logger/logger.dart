import 'package:logger/logger.dart';

l({verbose, debug, info, warning, error, wtf}) {
  Logger logger = new Logger(
    printer: PrettyPrinter(
      colors: true,
      printEmojis: true,
      methodCount: 0,
    ),
  );
  if (verbose != null) {
    logger.v(verbose);
  }
  if (debug != null) {
    logger.d(debug);
  }
  if (info != null) {
    logger.i(info);
  }
  if (warning != null) {
    logger.w(warning);
  }
  if (error != null) {
    logger.e(error);
  }
  if (wtf != null) {
    logger.wtf(wtf);
  }
}
