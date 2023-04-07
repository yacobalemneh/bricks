import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:mason/mason.dart';
import 'package:path/path.dart' as path;
import 'package:pty/pty.dart';

enum Platform { android, ios, macos }

Future<void> configureFirebaseProject(
  HookContext context,
  String firebaseProject,
  String env,
) async {
  final bundleId = appId(context);
  final projectName = context.vars['project_name'] as String;
  final projectDir = Directory(projectName);

  context.logger.info('Configuring firebase $env...');

final pty = PseudoTerminal.start(
 'flutterfire',
  [
    'config',
    '--project',
    firebaseProject,
    '--out',
    'lib/firebase_config/firebase_options_$env.dart',
    '--ios-bundle-id',
    '$bundleId.$env',
    '--macos-bundle-id',
    '$bundleId.$env',
    '--android-app-id',
    if (env == 'prod') bundleId else '$bundleId.$env',
  ],
  workingDirectory: Directory.current.path,
);

pty.out
    .transform(const LineSplitter())
    .listen((line) {
      print(line);
      if (line.contains('?')) {
        pty.write('\n'); // Simulate pressing the Enter key
      }
    });

// pty.stderr is not available in this implementation

final exitCode = await pty.exitCode;

pty.kill();
}

String appId(HookContext context, {Platform? platform}) {
  final orgName = context.vars['org_name'] as String;
  final projectName = context.vars['project_name'] as String;

  var applicationId = context.vars['application_id'] as String?;
  applicationId = (applicationId?.isNotEmpty ?? false)
      ? applicationId
      : '''$orgName.${platform == Platform.android ? projectName.snakeCase : projectName.paramCase}''';

  return applicationId!;
}

Future<void> checkFirebaseCLIInstalledAndExitIfNot(HookContext context) async {
  final result = await Process.run('firebase', ['--version']);

  if (result.exitCode == 0) {
    context.logger.info('firebase_cli is installed.');
  } else {
    context.logger.err(
      'firebase_cli is not installed. '
      'Please install it using the following command:',
    );
    context.logger.info('npm install -g firebase-tools');
    exit(1); // Exit the process with a non-zero exit code
  }
}


//   final process = await Process.start('flutterfire', [
//     'config',
//     '--project',
//     firebaseProject,
//     '--out',
//     'lib/firebase_config/firebase_options_$env.dart',
//     '--ios-bundle-id',
//     '$bundleId.$env',
//     '--macos-bundle-id',
//     '$bundleId.$env',
//     '--android-app-id',
//     if (env == 'prod') bundleId else '$bundleId.$env',
//   ]);

//   // Handle input, output, and error streams

// process.stderr.transform(utf8.decoder).transform(const LineSplitter()).listen((line) {
//   print('Error: $line');
// });

//  process.stdout.transform(utf8.decoder).transform(const LineSplitter()).listen((line) {
//     print(line);
//     process.stdin.writeln('\n');
//   });