import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../core/utils/app_router.dart';
import '../../../../core/utils/get_current_location.dart';
import '../../../../core/utils/services_locator.dart';
import '../../../../main.dart';
import '../../../weather_feature/data/repo/weather_home_repo.dart';
import '../../data/repo/search_repo_impl.dart';

class CustomSearchWidgetDelegate extends SearchDelegate {
  CustomSearchWidgetDelegate()
      : super(
            searchFieldLabel: 'Type City Name',
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.search,
            searchFieldStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600));

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(
          Icons.clear,
          color: Colors.black,
        ),
      ),
      IconButton(
        onPressed: () {
          getLocation().then((value) => GoRouter.of(context)
              .pushReplacement(AppRouter.kWeatherHomeView, extra: value));
        },
        icon: const Icon(
          FontAwesomeIcons.locationArrow,
          color: Colors.black,
        ),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(
        Icons.arrow_back,
        color: Colors.black,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    serviceLocator
        .get<SearchRepoImpl>()
        .getSearchResult(cityName: query)
        .then((value) {
      getSearchResultModel(value, context);
    });
    return const Center();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> list = getSearchSuggestions(query);
    return ListView.separated(
        itemBuilder: (context, index) => ListTile(
              leading: const Icon(FontAwesomeIcons.locationArrow),
              title: Text(
                list[index],
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
              iconColor: Colors.white,
              onTap: () {
                query = list[index];
                showResults(context);
              },
            ),
        separatorBuilder: (context, index) => const Divider(),
        itemCount: list.length);
  }

  Future<void> getSearchResultModel(value, context) {
    return value.fold(
        (l) => Future.microtask(
              () => Center(
                child: Text(l.errMessage),
              ),
            ),
        (r) => Future.microtask(
              () => GoRouter.of(context).pushReplacement(
                  AppRouter.kWeatherHomeView,
                  extra: City(
                      lon: r.lon,
                      lat: r.lat,
                      cityName: '${r.name}, ${r.country}')),
            ));
  }

  List<String> getSearchSuggestions(String query) {
    List<String> list = (query.isEmpty)
        ? searchList
        : searchList.where((element) => element.contains(query)).toList();

    return list;
  }
}
