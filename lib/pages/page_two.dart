import 'package:flutter/material.dart';
import 'package:my_first_project/pages/login_page.dart';

class PageTwo extends StatefulWidget {
  const PageTwo({super.key});
  @override
  State<PageTwo> createState() => _ImageChanger();
}

class _ImageChanger extends State<PageTwo> {
  int currentIndex = 0;

  List<Map<String, dynamic>> myData = [
    {
      "image": "assets/images/page_one.png",
      "text1": "Discover place near you",
      "text2": "We make it simple to find the food you crave.",
      "text3": "Enter your address and let us do the rest"
    },
    {
      "image": "assets/images/page_two.png",
      "text1": "Choose a favourite food",
      "text2": "When you order Eat Steet, we'll hook you up with",
      "text3": "exclusive coupon special and rewards."
    },
    {
      "image": "assets/images/page_three.png",
      "text1": "Deliver at your home",
      "text2": "We make food ordering fast, simple and free",
      "text3": "no matter if you order online or cash."
    },
  ];

  // void changeImage() {
  //   setState(() {
  //     currentIndex = (currentIndex + 1) % myData.length;
  //   });
  // }

  void changeImage() {
    setState(() {
      if (currentIndex < myData.length) {
        currentIndex = currentIndex + 1;
      }
    });
  }

  void forwardImage() {
    setState(() {
      if (currentIndex >= 0) {
        currentIndex = currentIndex - 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.10,
              // color: Colors.red,
              margin: EdgeInsets.only(top: 38),
              child: TextButton(
                onPressed: currentIndex != 0
                    ? () {
                        // Call the decrementIndex function here
                        forwardImage();
                      }
                    : null,
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.5,
              child: Image.asset(myData[currentIndex]["image"]),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.1,
            // color: Colors.brown,
            child: Column(
              children: [
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Center(
                      child: Text(
                        myData[currentIndex]["text1"],
                        style: const TextStyle(
                            fontSize: 28, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Text(myData[currentIndex]["text2"]),
                ),
                Center(
                  child: Text(myData[currentIndex]["text3"]),
                ),
              ],
            ),
          ),
          Center(
            child: Container(
              // color: Colors.brown,
              width: MediaQuery.of(context).size.width * 0.2,
              height: MediaQuery.of(context).size.height * 0.02,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                    myData.length,
                    (index) => Container(
                      child: Icon(
                        Icons.circle,
                        size: 12.0,
                        color: currentIndex == index
                            ? Colors.yellow.shade600
                            : Colors.indigo.shade100,
                      ),
                    ),
                  )),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.2,
                  // color: Colors.red,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        // color: Colors.blue,
                        width: MediaQuery.of(context).size.width * 0.90,
                        height: MediaQuery.of(context).size.height * 0.08,
                        // color: Colors.amber,
                        // margin: EdgeInsets.only(top: 50),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () {
                                print("Skip Button clicked");
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginPage()));
                              },
                              child: const Opacity(
                                opacity: 0.7,
                                child: Text(
                                  "SKIP",
                                  style: TextStyle(
                                      fontSize: 17,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                            Container(
                              width:
                                  currentIndex != myData.length - 1 ? 50 : 120,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.amber.shade400,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(
                                        50)), // Adjust the radius as needed
                              ),
                              child: TextButton(
                                onPressed: currentIndex < myData.length - 1
                                    ? () {
                                        changeImage();
                                      }
                                    : () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    LoginPage()));
                                      },
                                child: currentIndex != myData.length - 1
                                    ? const Icon(
                                        Icons.keyboard_arrow_right_rounded,
                                        size: 35,
                                        color: Colors.white,
                                      )
                                    : const Text(
                                        "Get Started",
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    ));
  }
}
