import 'package:flutter/material.dart';

class Item extends StatefulWidget {
  const Item({super.key});

  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.teal[300],
        child: Icon(Icons.watch_later_outlined, color: Colors.white),
      ),
      trailing: Checkbox(value: false, onChanged: (value) {}),
      title: Text("Aqui va un titulo"),
      subtitle: Text("Aquí va un subtítulo"),
    );
  }
}
