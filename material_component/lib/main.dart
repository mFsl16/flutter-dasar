import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    title: 'Flutter Tutorial',
    home: Scaffold(
      body: Center(
        child: MyButton(),
      ),
    ),
  ));
}

// class TutorialHome extends StatelessWidget {
//   const TutorialHome({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: const IconButton(
//           icon: Icon(Icons.menu),
//           tooltip: 'Navigation Menu',
//           onPressed: null, // null for disable button
//         ),
//         title: const Text(
//           'Example Title',
//         ),
//         actions: [
//           IconButton(
//               onPressed: null, icon: Icon(Icons.search), tooltip: 'Search')
//         ],
//       ),
//       body: const Center(
//         child: Text('Hello World'),
//       ),
//       floatingActionButton: const FloatingActionButton(
//         onPressed: null,
//         child: Icon(Icons.add),
//         tooltip: 'Add',
//       ),
//     );
//   }
// }

class MyButton extends StatelessWidget {
  const MyButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("My Button was tapped!");
      },
      child: Container(
        height: 50.0,
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: Colors.lightGreen[500]),
        child: const Center(
          child: Text('Engage'),
        ),
      ),
    );
  }
}
