import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'app.dart';

void main() async {
  // 環境変数ファイルの読み込み
  await DotEnv().load('.env');

  runApp(
    ProviderScope(
      child: App(),
    ),
  );
}
