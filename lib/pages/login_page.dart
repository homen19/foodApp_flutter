import 'package:flutter/material.dart';
import 'package:my_first_project/pages/sign_in.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Column(
          children: [
            Container(
              // color: Colors.amber,
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.1),
              child: Image.asset('assets/images/foodDeli.png'),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.05,
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.05),
              // color: Colors.purple,
              child: Center(
                child: Text(
                  "Deliver At Your Home",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.w900),
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.05,
              // color: Colors.purple,
              child: Center(
                child: Text(
                  "Delicious Food Delivered To Your Doorstep",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.35,
              // color: Colors.brown,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    height: MediaQuery.of(context).size.height * 0.1,
                    // color: Colors.green,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 120,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignIn()));
                            },
                            child: Text('Sign in'),
                            style: ButtonStyle(
                              overlayColor: MaterialStateProperty.all<Color>(
                                  Colors.amber.shade600),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.black87),
                            ),
                          ),
                        ),
                        Container(
                          width: 120,
                          height: 50,
                          child: OutlinedButton(
                            onPressed: () {
                              print("Button Clicked");
                            },
                            style: ButtonStyle(
                              overlayColor: MaterialStateProperty.all<Color>(
                                  Colors.amber.shade600),
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.black),
                            ),
                            child: Text('Sign up'),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        )));
  }
}
