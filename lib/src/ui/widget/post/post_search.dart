import 'package:flutter/material.dart';

class PostSearch extends StatefulWidget {
  const PostSearch({
    super.key,
    required this.onSearch,
    required this.searchTextController,
  });

  final Function(String) onSearch;
  final TextEditingController searchTextController;

  @override
  State<PostSearch> createState() => _PostSearchState();
}

class _PostSearchState extends State<PostSearch> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.searchTextController,
      // onChanged: widget.onSearch,
      onSubmitted: widget.onSearch,
      decoration: const InputDecoration(
        hintText: 'Search',
        hintStyle: TextStyle(
          fontSize: 14,
        ),
        border: OutlineInputBorder(),
        prefixIcon: Icon(
          Icons.search,
          size: 28,
        ),
      ),
    );
  }
}
