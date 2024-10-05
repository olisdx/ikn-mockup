import 'package:flutter/material.dart';

import '../../../common/field/search_field.dart';
import '../../../common/widget/appbar_main.dart';
import '../../../gen/assets.gen.dart';
import '../../home/data/data_home.dart';
import '../data/data_place.dart';
import '../widget/place_card.dart';
import '../widget/place_chip.dart';

class PlaceRecomendedAllPage extends StatefulWidget {
  const PlaceRecomendedAllPage({super.key});

  @override
  State<PlaceRecomendedAllPage> createState() => _PlaceRecomendedAllPageState();
}

class _PlaceRecomendedAllPageState extends State<PlaceRecomendedAllPage> {
  final _searchController = TextEditingController();

  int _selectedIndex = 0;

  void _onTapCategories(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarMain(title: "Tempat Rekomendasi"),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: SearchField(
              textController: _searchController,
              hintText: "Cari tempat",
            ),
          ),
          const SizedBox(height: 16),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                DataPlace.categories.length,
                (index) {
                  final data = DataPlace.categories[index];

                  return Padding(
                    padding:
                        EdgeInsets.only(left: (index == 0) ? 24 : 0, right: 10),
                    child: PlaceChip(
                      title: data["title"].toString(),
                      isSelected: _selectedIndex == index,
                      onTap: () => _onTapCategories(index),
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.separated(
              itemCount: DataHome.places.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
              itemBuilder: (context, index) {
                final data = DataHome.places[index];

                return PlaceCard(
                  image: Assets.images.ikn.path,
                  tag: data["tag"].toString(),
                  title: data["title"].toString(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
