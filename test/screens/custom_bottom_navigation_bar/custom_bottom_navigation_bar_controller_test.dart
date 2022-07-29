import 'dart:io';

import 'package:cinnamon_flutter_template_1/models/lesson/lesson.dart';
import 'package:cinnamon_flutter_template_1/screens/custom_bottom_navigation_bar/custom_bottom_navigation_bar_controller.dart';
import 'package:flutter_test/flutter_test.dart' as flutter_test;
import 'package:image_picker/image_picker.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../constants/mock_repository.dart';
import 'custom_bottom_navigation_bar_controller_test.mocks.dart';

@GenerateMocks([ImagePicker])
void main() {
  late CustomBottomNavigationBarController _navigationBarController;

  setUpAll(flutter_test.TestWidgetsFlutterBinding.ensureInitialized);

  setUp(() {
    _navigationBarController = CustomBottomNavigationBarController()
      ..imagePicker = MockImagePicker();
  });

  tearDown(() {
    _navigationBarController.dispose();
  });

  test('Function should return formatted date', () {
    final lesson = Lesson(
      lessonName: 'Basics',
      lessonStart: DateTime.fromMillisecondsSinceEpoch(1655737200000),
      lessonEnd: DateTime.fromMillisecondsSinceEpoch(1655744400000),
    );

    final result = _navigationBarController.writeLessonDate(lesson);

    expect(result, 'June 20th, 17 pm - 19 pm');
  });

  group('Check image picker', () {
    test("Function should return null when user doesn't take a picture", () async {
      when(_navigationBarController.imagePicker.pickImage(
        source: ImageSource.camera,
        maxWidth: 1080,
      )).thenAnswer((_) async => null);

      final result = await _navigationBarController.chooseImage(isCamera: true);

      expect(result, null);
    });

    test("Function should return null when user doesn't select a picture", () async {
      when(_navigationBarController.imagePicker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 1080,
      )).thenAnswer((_) async => null);

      final result = await _navigationBarController.chooseImage(isCamera: false);

      expect(result, null);
    });

    test('Function should return File when user takes a picture', () async {
      final xfile = await MockRepository.imageFile;
      final file = File(xfile.path);

      when(_navigationBarController.imagePicker.pickImage(
        source: ImageSource.camera,
        maxWidth: 1080,
      )).thenAnswer((_) async => xfile);

      final result = await _navigationBarController.chooseImage(isCamera: true);

      expect(result?.path, file.path);
    });

    test('Function should return File when user selects a picture', () async {
      final xfile = await MockRepository.imageFile;
      final file = File(xfile.path);

      when(_navigationBarController.imagePicker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 1080,
      )).thenAnswer((_) async => xfile);

      final result = await _navigationBarController.chooseImage(isCamera: false);

      expect(result?.path, file.path);
    });
  });
}
