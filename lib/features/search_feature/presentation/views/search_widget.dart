import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomSearchWidgetDelegate extends SearchDelegate {
  Future<List<String>> readJson() async {
    final response = await rootBundle.loadString('assets/json/cities.json');
    final data = await json.decode(response);
    return data['city'] as List<String>;
  }

  CustomSearchWidgetDelegate()
      : super(
          searchFieldLabel: 'Type City Name',
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.search,
        );

// Demo list to show querying

// first overwrite to
// clear the search text
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

// second overwrite to pop out of search menu
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

// third overwrite to show query result
  @override
  Widget buildResults(BuildContext context) {
    return const Center();
    /*  List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );*/
  }

// last overwrite to show the
// querying process at the runtime
  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> initData=const['Cairo','Alexandria','Tokyo','Paris'];
    return FutureBuilder(
      future: readJson(),initialData: initData,
      builder: (context, snapshot) {

        return ListView.separated(
            itemBuilder: (context, index) => ListTile(
                  title: Text(snapshot.data?[index]??initData[index]),
                ),
            separatorBuilder: (context, index) => const Divider(),
            itemCount: snapshot.data?.length ?? 4);
      },
    );

  }
}
