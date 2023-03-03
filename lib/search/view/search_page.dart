import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage._();

  static Route<String> route() {
    return MaterialPageRoute(builder: (_) => const SearchPage._());
  }

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _textController = TextEditingController();

  String get _text => _textController.text;

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('City Search')),
      body: Container(
        height: 45,
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: const Color(0x1DFFFFFF),
          borderRadius: BorderRadius.circular(23),
        ),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: TextField(
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                  controller: _textController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      hintText: "Enter a city",
                      hintStyle: TextStyle(
                          color: Color.fromARGB(90, 255, 255, 255),
                          fontSize: 15)),
                ),
              ),
            ),
            IconButton(
              key: const Key('searchPage_search_iconButton'),
              icon: const Icon(
                Icons.search,
                semanticLabel: 'Submit',
                color: Colors.white,
              ),
              onPressed: () => Navigator.of(context).pop(_text),
            )
          ],
        ),
      ),
    );
  }
}
