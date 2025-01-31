import 'package:flutter/material.dart';

class SearchItems extends StatefulWidget {
  const SearchItems({super.key});

  @override
  State<SearchItems> createState() => _SearchItemsState();
}

class _SearchItemsState extends State<SearchItems> {

  final _controller = TextEditingController();

  @override
  void dispose() {
    // * TextEditingControllers should be always disposed
    _controller.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _controller, 
      builder:(context, value, _) {
        return TextField(
          // onTapOutside: (event) => hideKeyboard(),
          controller: _controller,
          decoration: InputDecoration(
            hintText: "Search",
            suffixIcon: IconButton(
                onPressed: () {}, icon: const Icon(Icons.search),
                ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            filled: true,
            fillColor: Colors.grey[200],
            contentPadding: const EdgeInsets.symmetric(
                horizontal: 20.0, vertical: 16.0),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 0.0),
            ),
          ),
        );
      }
      );
  }
}

extension KeyboardUtil on BuildContext{
  void hideKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}