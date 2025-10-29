import 'package:flutter/material.dart';
import 'package:todoapp/src/widgets/items.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.calendar_month_outlined, color: Colors.white),

        backgroundColor: Colors.teal,
        //centerTitle: true,
        title: Text(
          "TO DO LIST",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontFamily: "Helvetica",
          ),
        ),
      ),

      body: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) {
          return Item();
        },
      ),
    );
  }
}
