import 'package:flutter/material.dart';

class NoWeather extends StatelessWidget {
  const NoWeather({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Padding(
        padding: EdgeInsets.only(left: 40),
        child: Center(
          child: Text(
            "there is no weather😌...start searching now🔍 ",
            style: TextStyle(fontSize: 24, fontStyle: FontStyle.italic),
          ),
        ),
      ),
    );
  }
}
