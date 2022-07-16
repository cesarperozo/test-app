import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/models/google_response.dart';
import 'package:test_app/providers/restaurants_provider.dart';

class StatusInfo {
  final String? title;
  final Color? color;

  StatusInfo({
    required this.title,
    required this.color,
  });
}

Map<String, StatusInfo> statuses = {
  'OPERATIONAL': StatusInfo(title: 'Abierto', color: Colors.green),
  'CLOSED_TEMPORARILY': StatusInfo(title: 'Cerrado', color: Colors.red)
};

class SearchResults extends StatelessWidget {
  const SearchResults({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final restaureantsProvider =
        Provider.of<RestaurantsProvider>(context, listen: false);
    String query = ModalRoute.of(context)?.settings.arguments as String;

    return FutureBuilder(
      future: restaureantsProvider.searchRestaurants(query),
      builder: (_, AsyncSnapshot<List<Restaurant>> snapshot) {
        if (!snapshot.hasData) {
          return const SizedBox(
            height: 180,
            child: CupertinoActivityIndicator(),
          );
        }
        final cast = snapshot.data;

        return Scaffold(
            appBar: AppBar(
              title: const Text('Restaurantes'),
            ),
            body: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: cast!.length,
                      itemBuilder: (_, int index) {
                        final restaurant = cast[index];

                        return _RestaurantPoster(restaurant: restaurant);
                      },
                    ),
                  )
                ],
              ),
            ));
      },
    );
  }
}

class _RestaurantPoster extends StatelessWidget {
  final Restaurant restaurant;
  const _RestaurantPoster({Key? key, required this.restaurant})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 150,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () => {},
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: const AssetImage('assets/no-image.jpg'),
                image: NetworkImage(restaurant.fullPosterImg),
                width: 130,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 250),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${restaurant.name}',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 20),
                  ),
                  Row(
                    children: [
                      Text('${restaurant.rating}'),
                      Icon(
                        Icons.star_outlined,
                        size: 14,
                        color: Colors.yellow[600],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.circle,
                        size: 12,
                        color: statuses[restaurant.businessStatus]!.color,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text('${statuses[restaurant.businessStatus]!.title}')
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
