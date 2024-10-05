import 'package:flutter/material.dart';

import '../../../common/field/search_field.dart';
import '../../../common/widget/appbar_main.dart';
import '../../../gen/assets.gen.dart';
import '../data/data_news.dart';
import '../widget/categories_chip.dart';
import '../widget/news_card.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  final _searchController = TextEditingController();

  int _selectedIndex = 0;

  void _onTapCategories(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarMain(title: "Berita"),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SearchField(
                textController: _searchController,
                hintText: "Cari berita",
              ),
            ),
            const SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  DataNews.categories.length,
                  (index) {
                    final data = DataNews.categories[index];

                    return Padding(
                      padding: EdgeInsets.only(
                          left: (index == 0) ? 24 : 0, right: 10),
                      child: CategoriesChip(
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
                itemCount: DataNews.news.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
                itemBuilder: (context, index) {
                  final data = DataNews.news[index];

                  return NewsCard(
                    image: Assets.images.ikn.path,
                    tag: data["tag"].toString(),
                    title: data["title"].toString(),
                    date: data["date"].toString(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
