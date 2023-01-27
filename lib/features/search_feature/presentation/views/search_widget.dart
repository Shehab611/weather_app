import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/core/utils/app_router.dart';
import 'package:weather_app/features/weather_feature/data/repo/weather_home_repo.dart';
import 'package:weather_app/features/weather_feature/presentation/views/weather_view.dart';

import '../../../splash_feature/presentation/views/splash_view.dart';
import '../../data/repo/search_repo.dart';
import '../../data/repo/search_repo_impl.dart';

class CustomSearchWidgetDelegate extends SearchDelegate {
  final List<String> searchList;

  CustomSearchWidgetDelegate({required this.searchList})
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
    final SearchRepo weatherHomeRepo = SearchRepoImpl();
    weatherHomeRepo.getSearchResult(cityName: query).then((value){
      value.fold(
          (l) => print(l.errMessage),
          (r) => City(lat:r.lat, lon: r.lon));

    });
   exit(0);

  }

// last overwrite to show the
// querying process at the runtime
  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> list = (query.isEmpty)
        ? searchList
        : searchList.where((element) => element.contains(query)).toList();

    return ListView.separated(
        itemBuilder: (context, index) => ListTile(
              title: Text(list[index]),
              onTap: () {
                query = list[index];
                showResults(context);
              },
            ),
        separatorBuilder: (context, index) => const Divider(),
        itemCount: list.length);
  }
}
