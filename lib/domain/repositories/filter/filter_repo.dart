enum FilterEnums {
  all(categoryText: "Все новости"),
  popular(categoryText: "Популярное"),
  reading(categoryText: "читают"),
  sports(categoryText: "Спорт"),
  politics(categoryText: "Политика"),
  world(categoryText: "В мире"),
  cultural(categoryText: "Культура"),
  social(categoryText: "Общество"),
  economics(categoryText: "Экономика");

  const FilterEnums({required this.categoryText});

  final String categoryText;
}
