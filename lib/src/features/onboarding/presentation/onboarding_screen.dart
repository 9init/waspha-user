import 'package:flutter/material.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/onboarding/people.png"),
            colorFilter: ColorFilter.mode(
                Color.fromARGB(255, 98, 95, 255).withOpacity(0.5),
                BlendMode.lighten),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Select \n Language",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  Text("اختار\n  اللغة",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold)),
                ],
              ),
              SizedBox(
                  width: 300,
                  height: 40,
                  child: OutlinedButton(
                      onPressed: () {},
                      child: Text("English",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)))),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                  width: 300,
                  height: 40,
                  child: OutlinedButton(
                      onPressed: () {},
                      child: Text("عربي",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold))))
            ],
          ),
        ),
      ),
    );
  }
}
