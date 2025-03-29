import 'package:flutter/material.dart';
import 'package:movies_app/CustomWidgetsReapeted/MoviesGrid.dart';

import '../widgets/EmptySearchScreen.dart';

class SearchScreen extends StatefulWidget {
  final List<Map<String, String>> allMovies; //34an 23ml test bs

  const SearchScreen({super.key, required this.allMovies});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String searchQuery = "";
  List<Map<String, String>> filteredMovies = [];

//34an 23ml test
  void _searchMovies(String query) {
    setState(() {
      searchQuery = query;
      filteredMovies = widget.allMovies
          .where((movie) =>
              movie["name"]!.toLowerCase().contains(query.toLowerCase()) ||
              movie["category"]!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Color(0xff282A28),
          ),
          child: TextField(
            onChanged: _searchMovies,
            decoration: const InputDecoration(
              prefixIcon: Icon(
                Icons.search_outlined,
                color: Colors.white,
                size: 20,
              ),
              hintText: "Search...",
              hintStyle: TextStyle(color: Colors.white, fontSize: 16),
              border: InputBorder.none,
            ),
            style: const TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: searchQuery.isEmpty
          ? EmptySearchScreenWidget() //lw lsearch lsa mbd24
          : MoviesGrid(
              movies: searchQuery.isEmpty ? widget.allMovies : filteredMovies),
    );
  }
}
