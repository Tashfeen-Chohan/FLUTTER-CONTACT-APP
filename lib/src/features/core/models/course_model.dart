import 'package:login_app/src/constants/image_strings.dart';

class CourseModel {
  final String title;
  final String img;
  final String heading;
  final String subHeading;

  CourseModel({
    required this.title,
    required this.img,
    required this.heading,
    required this.subHeading,
  });

  static List<CourseModel> list = [
    CourseModel(
      title: "Flutter Crash Course",
      img: tLogo,
      heading: "3 Lessons",
      subHeading: "Programming Languages",
    ),
    CourseModel(
      title: "Flutter Login Course",
      img: tLogo,
      heading: "5 Lessons",
      subHeading: "UI, Database & Backend",
    ),
    CourseModel(
      title: "MERN Stack Development",
      img: tLogo,
      heading: "10 Lessons",
      subHeading: "Mongodb, Express Js, React Js, Node Js",
    ),
    CourseModel(
      title: "HTML/CSS Crash Course",
      img: tLogo,
      heading: "5 Lessons",
      subHeading: "Tags, Forms, Styling & Media Query",
    ),
  ];
}
