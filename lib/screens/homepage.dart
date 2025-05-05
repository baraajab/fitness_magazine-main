import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitness_magazine/models/featuredarticlecard.dart';
import 'package:fitness_magazine/models/magzinedata.dart';
import 'detailspage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'مجلة صحية',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontFamily: 'Somar',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 340,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: magazines.length,
                itemBuilder: (context, index) {
                  return HealthMagazineCard(magazine: magazines[index]);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TabBar(
                indicatorWeight: 3,
                labelPadding: EdgeInsets.all(8),
                dividerColor: Colors.transparent,
                indicatorColor: Color(0xFF48444D),
                tabs: [
                  Container(
                    padding: EdgeInsets.all(10),

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xFfB4cf66),
                    ),
                    child: Text('تغذية', style: TextStyle(color: Colors.white)),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xFF79bde8),
                    ),
                    child: Text('صحة'),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xFFf05e8e),
                    ),
                    child: Text('جمال'),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xFFfccd0a),
                    ),
                    child: Text('لياقة'),
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  ArticleListView(items: nutrition),
                  ArticleListView(items: health),
                  ArticleListView(items: beauty),
                  ArticleListView(items: fitness),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ArticleListView extends StatelessWidget {
  final List<FeaturedArticleCard> items;
  const ArticleListView({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return CategoryItemCard(item: items[index]);
      },
    );
  }
}

class CategoryItemCard extends StatelessWidget {
  final FeaturedArticleCard item;
  const CategoryItemCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return DetailsPage(
                  title: item.title,
                  description: item.description,
                  imageUrl: item.imageUrl,
                );
              },
            ),
          );
        },
        child: Card(
          color: item.color,
          elevation: 8,
          child: SizedBox(
            height: 120,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 110,
                  child: Hero(
                    tag: item.imageUrl,
                    child: CachedNetworkImage(
                      imageUrl: item.imageUrl,
                      imageBuilder:
                          (context, imageProvider) => Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              ),
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                      placeholder:
                          (context, url) => Image.asset(
                            'assets/icons/png/placeholder.png',
                            fit: BoxFit.cover,
                            height: double.infinity,
                          ),
                      errorWidget:
                          (context, url, error) => Image.asset(
                            'assets/icons/png/placeholder.png',
                            fit: BoxFit.cover,
                            height: double.infinity,
                          ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          maxLines: 1,
                          item.title,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: 'Somar',
                          ),
                        ),
                        Text(
                          item.description,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: 'Somar',
                          ),
                        ),
                        Row(
                          verticalDirection: VerticalDirection.down,
                          spacing: 6,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(Icons.share, color: Colors.white),
                            SizedBox(width: 5),
                            Icon(Icons.favorite_border, color: Colors.white),
                            SizedBox(width: 5),
                            Icon(Icons.remove_red_eye, color: Colors.white),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HealthMagazineCard extends StatelessWidget {
  final FeaturedArticleCard magazine;
  const HealthMagazineCard({super.key, required this.magazine});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.5),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return DetailsPage(
                  title: magazine.title,
                  description: magazine.description,
                  imageUrl: magazine.imageUrl,
                );
              },
            ),
          );
        },
        child: Container(
          width: 295,
          decoration: BoxDecoration(color: Colors.white),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(7)),
                child: Stack(
                  children: [
                    Hero(
                      tag: magazine.imageUrl,
                      child: CachedNetworkImage(
                        imageUrl: magazine.imageUrl,
                        height: 190,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        placeholder:
                            (context, url) => Image.asset(
                              'assets/icons/png/placeholder.png',
                              height: double.infinity,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                        errorWidget:
                            (context, url, error) => Image.asset(
                              'assets/icons/png/placeholder.png',
                              height: double.infinity,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                      ),
                    ),
                    const Positioned(
                      top: 12,
                      left: 13,
                      child: Icon(
                        Icons.favorite_border,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(
                  top: 10.0,
                  bottom: 4,
                  left: 4,
                  right: 4,
                ),
                child: Container(
                  color: magazine.color,
                  padding: const EdgeInsets.symmetric(
                    vertical: 2,
                    horizontal: 23,
                  ),
                  child: Text(
                    magazine.category,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'Somar',
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  maxLines: 1,
                  magazine.title,
                  style: const TextStyle(
                    color: Color(0xFF5A5A5A),
                    fontSize: 16,
                    fontFamily: 'Somar',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  maxLines: 2,
                  magazine.description,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Color(0xFF575757),
                    fontSize: 14,
                    fontFamily: 'Somar',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
