import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../models/lesson/lesson.dart';

class CustomBottomNavigationBarController extends GetxController {
  static final instance = Get.find<CustomBottomNavigationBarController>();

  /// ------------------------
  /// VARIABLES
  /// ------------------------

  late ImagePicker _imagePicker;

  final _selectedIndex = 0.obs;

  /// ------------------------
  /// GETTERS
  /// ------------------------

  ImagePicker get imagePicker => _imagePicker;

  int get selectedIndex => _selectedIndex.value;

  /// ------------------------
  /// SETTERS
  /// ------------------------

  set imagePicker(ImagePicker value) => _imagePicker = value;

  set selectedIndex(value) => _selectedIndex.value = value;

  @override
  void onInit() {
    super.onInit();

    imagePicker = ImagePicker();
  }

  /// ------------------------
  /// METHODS
  /// ------------------------

  /// FUNCTION: write date: (Month day, start am/pm - end am/pm)
  String writeLessonDate(Lesson lesson) {
    var day = '';
    var hours = '';

    final monthName = <String>[
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];

    /// write ordinal number:
    if (lesson.lessonStart.day == 1 || lesson.lessonStart.day == 21 || lesson.lessonStart.day == 31) {
      day = '${lesson.lessonStart.day}st';
    } else if (lesson.lessonStart.day == 2 || lesson.lessonStart.day == 22) {
      day = '${lesson.lessonStart.day}nd';
    } else if (lesson.lessonStart.day == 3 || lesson.lessonStart.day == 23) {
      day = '${lesson.lessonStart.day}rd';
    } else {
      day = '${lesson.lessonStart.day}th';
    }

    /// check if am or pm:
    if (lesson.lessonStart.hour <= 12 && lesson.lessonEnd.hour <= 12) {
      hours = '${lesson.lessonStart.hour} am - ${lesson.lessonEnd.hour} am';
    } else if (lesson.lessonStart.hour > 12 && lesson.lessonEnd.hour <= 12) {
      hours = '${lesson.lessonStart.hour} pm - ${lesson.lessonEnd.hour} am';
    } else {
      hours = '${lesson.lessonStart.hour} pm - ${lesson.lessonEnd.hour} pm';
    }

    final date = '${monthName[lesson.lessonStart.month - 1]} $day, $hours';

    return date;
  }

  /// choose image from gallery or take a photo
  Future<File?> chooseImage({required bool isCamera}) async {
    final pickedImage = await imagePicker.pickImage(
      source: isCamera ? ImageSource.camera : ImageSource.gallery,
      maxWidth: 1080,
    );

    /// User has chosen a proper image
    if (pickedImage != null) {
      final file = File(pickedImage.path);
      return file;
    }

    return null;
  }
}
