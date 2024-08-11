import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  final String searchQuery;
  static const String routeName='/Search-screen';
  const SearchScreen({super.key, required this.searchQuery});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          widget.searchQuery
        ),
      ),
    );
  }
}