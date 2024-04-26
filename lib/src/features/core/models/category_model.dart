class CategoryModel {
  final String title;
  final String heading;
  final String subHeading;

  CategoryModel({
    required this.title,
    required this.heading,
    required this.subHeading,
  });

  static List<CategoryModel> list = [
    CategoryModel(title: "JS", heading: "Javascript", subHeading: "10 Lessons"),
    CategoryModel(title: "Py", heading: "Python", subHeading: "3 Lessons"),
    CategoryModel(title: "C++", heading: "C++", subHeading: "5 Lessons"),
    CategoryModel(title: "C#", heading: "C Sharp", subHeading: "4 Lessons"),
    CategoryModel(title: "HTML", heading: "HyperText Markup Language", subHeading: "7 Lessons"),
    CategoryModel(title: "CSS", heading: "Cascading Style Sheet", subHeading: "7 Lessons"),
  ];
}
