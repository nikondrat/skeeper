import 'dart:async';

import 'package:skeeper/src/core/utils/logger.dart';
import 'package:skeeper/src/feature/app/logic/app_runner.dart';

void main() {
  logger.runLogging(
    () => runZonedGuarded(
      () => const AppRunner().initializeAndRun(),
      logger.logZoneError,
    ),
    const LogOptions(),
  );
}
