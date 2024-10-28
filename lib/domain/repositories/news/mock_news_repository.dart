import 'package:bezfy/domain/models/article.dart';
import 'package:bezfy/domain/repositories/filter/filter_repo.dart';
import 'package:bezfy/domain/repositories/news/abstract_news_repository.dart';
import 'package:flutter/material.dart';

class MockNewsRepository implements AbstractNewsRepository {
  @override
  Future<List<Article>> getLatestArticles() async {
    return _mockArticles;
  }

  /// Can throw [StateError]
  @override
  Future<Article> getArticle(String id) async {
    return _mockArticles.firstWhere((e) => e.id == id);
  }

  @override
  Future<List<Article>> getFeaturedArticles() async {
    return _mockArticles;
  }

  @override
  Future<List<Article>> searchArticles(String searchText) async {
    return _mockArticles
        .where((article) => article.description.contains(searchText))
        .toList();
  }

  @override
  Future<List<Article>> getFilteredArticles(FilterEnums filter) async {
    return _mockArticles
        .where((article) => filter == FilterEnums.popular
            ? article.viewCount > 0
            : filter.categoryText == article.category)
        .toList();
  }
}

final _mockArticles = [
  Article(
    id: '1108389a-b3db-11ec-b909-0242ac120002',
    viewCount: 10,
    title: 'Лось спровоцировал смертельное ДТП на КАДе',
    imageUrl:
        'https://avatars.dzeninfra.ru/get-zen_doc/271828/pub_66d541f119e72a1d4ffdb617_66d5718489907761c8cede37/scale_1200',
    category: "Общество",
    icon: Icons.my_library_books_outlined,
    description: "Авария произошла на 37-м километре трассы.",
  ),
  Article(
    id: '0e8dba30-b3dc-11ec-b909-0242ac120002',
    viewCount: 5,
    title: 'Нефть марки Brent подешевела до 76,3 долларов',
    imageUrl:
        'https://mf.b37mrtl.ru/russian/images/2020.03/article/5e659518ae5ac9653435d88a.png',
    icon: Icons.my_library_books_outlined,
    category: "Экономика",
    description:
        "В понедельник цены на нефть снижаются на фоне опубликованных статистических данных из Китая, которые демонстрируют усиление спада в промышленном секторе страны, сообщает корреспондент The Moscow Post.",
  ),
  Article(
    id: '787fa7fa-b3dc-11ec-b909-0242ac120002',
    viewCount: 0,
    title: 'Зверев прошел в четвертьфинал US Open',
    imageUrl:
        'https://static.liveresult.ru/files/tips/41226/20220426_gaf_u39_672.jpg',
    icon: Icons.my_library_books_outlined,
    category: "Спорт",
    description: "Мероприятие проходит в Нью-Йорке.",
  ),
  Article(
    id: 'b818ca9a-b3dc-11ec-b909-0242ac120002',
    viewCount: 0,
    title: 'В РФ изучат возможность привлечения ИИ к проверке ЕГЭ',
    imageUrl: 'https://rg.ru/uploads/images/163/68/59/TASS_27162991.jpg',
    icon: Icons.my_library_books_outlined,
    category: "Общество",
    description:
        "Директор Федерального института педагогических измерений (ФИПИ) Оксана Решетникова завила, что сейчас привлекать искусственный интеллект к проверке экзаменационных работ ЕГЭ преждевременно, передает корреспондент The Moscow Post.",
  ),
  Article(
    id: '1108389a-b3db-11ec-b909-0242ac120002',
    viewCount: 20,
    title: 'Лось спровоцировал смертельное ДТП на КАДе',
    imageUrl:
        'https://avatars.dzeninfra.ru/get-zen_doc/271828/pub_66d541f119e72a1d4ffdb617_66d5718489907761c8cede37/scale_1200',
    category: "Общество",
    icon: Icons.my_library_books_outlined,
    description: "Авария произошла на 37-м километре трассы.",
  ),
  Article(
    id: '0e8dba30-b3dc-11ec-b909-0242ac120002',
    title: 'Нефть марки Brent подешевела до 76,3 долларов',
    viewCount: 5,
    imageUrl:
        'https://mf.b37mrtl.ru/russian/images/2020.03/article/5e659518ae5ac9653435d88a.png',
    icon: Icons.my_library_books_outlined,
    category: "Экономика",
    description:
        "В понедельник цены на нефть снижаются на фоне опубликованных статистических данных из Китая, которые демонстрируют усиление спада в промышленном секторе страны, сообщает корреспондент The Moscow Post.",
  ),
  Article(
    id: '787fa7fa-b3dc-11ec-b909-0242ac120002',
    viewCount: 17,
    title: 'Зверев прошел в четвертьфинал US Open',
    imageUrl:
        'https://static.liveresult.ru/files/tips/41226/20220426_gaf_u39_672.jpg',
    icon: Icons.my_library_books_outlined,
    category: "Спорт",
    description: "Мероприятие проходит в Нью-Йорке.",
  ),
  Article(
    id: 'b818ca9a-b3dc-11ec-b909-0242ac120002',
    viewCount: 3,
    title: 'В РФ изучат возможность привлечения ИИ к проверке ЕГЭ',
    imageUrl: 'https://rg.ru/uploads/images/163/68/59/TASS_27162991.jpg',
    icon: Icons.my_library_books_outlined,
    category: "Общество",
    description:
        "Директор Федерального института педагогических измерений (ФИПИ) Оксана Решетникова завила, что сейчас привлекать искусственный интеллект к проверке экзаменационных работ ЕГЭ преждевременно, передает корреспондент The Moscow Post.",
  ),
];
