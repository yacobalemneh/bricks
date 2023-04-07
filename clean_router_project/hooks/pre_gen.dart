import 'package:mason/mason.dart';
import 'shared_functions.dart';

void run(HookContext context) {
  context.vars['application_id_android'] =
      appId(context, platform: Platform.android);
  context.vars['application_id'] = appId(context);
  // final setupFirebase = context.vars['setup_firebase'] as bool;

  // if (setupFirebase) {
  //   checkFirebaseCLIInstalledAndExitIfNot(context);
  // }
}
