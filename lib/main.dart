import 'package:flutter/material.dart';
import 'package:my_first_project/pages/page_two.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(debugShowCheckedModeBanner: false, home: PageTwo()
        //Scaffold(
        //   body: Container(
        //     color: Colors.cyan.shade50,
        //     child: Center(
        //       child: Column(
        //         children: [
        //           Container(
        //             width: 200,
        //             child: Image.asset('assets/images/hhhh.jpg'),
        //           ),
        //         ],
        //       ),
        //     ),
        //   ),
        // ),
        );
  }
}
