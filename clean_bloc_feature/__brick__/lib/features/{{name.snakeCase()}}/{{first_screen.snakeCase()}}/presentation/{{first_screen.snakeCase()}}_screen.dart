import 'package:flutter/material.dart';
import 'package:{{project_name.snakeCase()}}/l10n/l10n.dart';



class {{first_screen.pascalCase()}}Screen extends StatelessWidget {
  const {{first_screen.pascalCase()}}Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.counterAppBarTitle)),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text('{{first_screen.pascalCase()}} screen'),
        ],
      ),
    );
  }
}


