import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('search city'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
        child: TextField(
          onSubmitted: ((value) {
            print(value);
          }),
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              vertical: 30,
              horizontal: 10,
            ),
            labelText: 'Search',
            suffixIcon: Icon(Icons.search),
            hintText: 'Enter City name',
            border: OutlineInputBorder(),
          ),
        ),
      ),
    );
  }
}
