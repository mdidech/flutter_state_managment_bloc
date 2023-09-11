import "package:flutter/material.dart";

class CounterPage extends StatelessWidget {
  int counter = 0;
  CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Page V1'),
      ),
      body: Center(
          child: Text(
        "Counter Page $counter",
        style: const TextStyle(fontSize: 25, color: Colors.teal),
      )),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              counter++;
            },
            child: const Icon(Icons.remove),
          ),
          const SizedBox(
            width: 15,
          ),
          FloatingActionButton(
            onPressed: () {
              counter++;
            },
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
