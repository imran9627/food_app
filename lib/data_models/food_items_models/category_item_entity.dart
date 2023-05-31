class CategoryItem {
  String? title;

  CategoryItem({required this.title});

  static const String categoryTitleKey = 'CategoryTitle';

  Map<String, dynamic> toJson() {
    return {categoryTitleKey: title};
  }
}
