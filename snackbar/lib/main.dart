import 'package:flutter/material.dart';

void main() {
  runApp(const SnackbarDemo());
}

class SnackbarDemo extends StatelessWidget {
  const SnackbarDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Snackbar Demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Snackbar Demo'),
        ),
        body: const SnackBarPage(),
      ),
    );
  }
}

class SnackBarPage extends StatelessWidget {
  const SnackBarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          final snackBar = SnackBar(
            content: const Text('Yay! SnackBar!'),
            action: SnackBarAction(label: 'Undo', onPressed: () {}),
          );

          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: const Text('Show Snack'),
      ),
    );
  }
}
