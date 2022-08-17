// Mocks generated by Mockito 5.3.0 from annotations
// in cinnamon_flutter_template_1/test/screens/lessons/lessons_controller_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i6;

import 'package:cinnamon_flutter_template_1/models/lesson/lesson.dart' as _i2;
import 'package:cinnamon_flutter_template_1/models/notification/notification.dart'
    as _i5;
import 'package:cinnamon_flutter_template_1/services/shared_firebase_data_service.dart'
    as _i4;
import 'package:get/get.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeLesson_0 extends _i1.SmartFake implements _i2.Lesson {
  _FakeLesson_0(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

class _FakeInternalFinalCallback_1<T> extends _i1.SmartFake
    implements _i3.InternalFinalCallback<T> {
  _FakeInternalFinalCallback_1(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

/// A class which mocks [SharedFirebaseDataService].
///
/// See the documentation for Mockito's code generation for more information.
class MockSharedFirebaseDataService extends _i1.Mock
    implements _i4.SharedFirebaseDataService {
  MockSharedFirebaseDataService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  List<_i2.Lesson> get lessons =>
      (super.noSuchMethod(Invocation.getter(#lessons),
          returnValue: <_i2.Lesson>[]) as List<_i2.Lesson>);
  @override
  _i2.Lesson get upcomingLesson => (super.noSuchMethod(
          Invocation.getter(#upcomingLesson),
          returnValue: _FakeLesson_0(this, Invocation.getter(#upcomingLesson)))
      as _i2.Lesson);
  @override
  _i2.Lesson get upcomingLecture => (super.noSuchMethod(
          Invocation.getter(#upcomingLecture),
          returnValue: _FakeLesson_0(this, Invocation.getter(#upcomingLecture)))
      as _i2.Lesson);
  @override
  _i2.Lesson get upcomingCodeLab => (super.noSuchMethod(
          Invocation.getter(#upcomingCodeLab),
          returnValue: _FakeLesson_0(this, Invocation.getter(#upcomingCodeLab)))
      as _i2.Lesson);
  @override
  List<_i5.Notification> get notifications =>
      (super.noSuchMethod(Invocation.getter(#notifications),
          returnValue: <_i5.Notification>[]) as List<_i5.Notification>);
  @override
  set lessons(List<_i2.Lesson>? value) =>
      super.noSuchMethod(Invocation.setter(#lessons, value),
          returnValueForMissingStub: null);
  @override
  set upcomingLesson(_i2.Lesson? value) =>
      super.noSuchMethod(Invocation.setter(#upcomingLesson, value),
          returnValueForMissingStub: null);
  @override
  set upcomingLecture(dynamic value) =>
      super.noSuchMethod(Invocation.setter(#upcomingLecture, value),
          returnValueForMissingStub: null);
  @override
  set upcomingCodeLab(dynamic value) =>
      super.noSuchMethod(Invocation.setter(#upcomingCodeLab, value),
          returnValueForMissingStub: null);
  @override
  set notifications(List<_i5.Notification>? value) =>
      super.noSuchMethod(Invocation.setter(#notifications, value),
          returnValueForMissingStub: null);
  @override
  _i3.InternalFinalCallback<void> get onStart =>
      (super.noSuchMethod(Invocation.getter(#onStart),
              returnValue: _FakeInternalFinalCallback_1<void>(
                  this, Invocation.getter(#onStart)))
          as _i3.InternalFinalCallback<void>);
  @override
  _i3.InternalFinalCallback<void> get onDelete =>
      (super.noSuchMethod(Invocation.getter(#onDelete),
              returnValue: _FakeInternalFinalCallback_1<void>(
                  this, Invocation.getter(#onDelete)))
          as _i3.InternalFinalCallback<void>);
  @override
  bool get initialized =>
      (super.noSuchMethod(Invocation.getter(#initialized), returnValue: false)
          as bool);
  @override
  bool get isClosed =>
      (super.noSuchMethod(Invocation.getter(#isClosed), returnValue: false)
          as bool);
  @override
  _i6.Future<void> getAllLessons() => (super.noSuchMethod(
      Invocation.method(#getAllLessons, []),
      returnValue: _i6.Future<void>.value(),
      returnValueForMissingStub: _i6.Future<void>.value()) as _i6.Future<void>);
  @override
  _i6.Future<void> getNotifications() => (super.noSuchMethod(
      Invocation.method(#getNotifications, []),
      returnValue: _i6.Future<void>.value(),
      returnValueForMissingStub: _i6.Future<void>.value()) as _i6.Future<void>);
  @override
  void onInit() => super.noSuchMethod(Invocation.method(#onInit, []),
      returnValueForMissingStub: null);
  @override
  void onReady() => super.noSuchMethod(Invocation.method(#onReady, []),
      returnValueForMissingStub: null);
  @override
  void onClose() => super.noSuchMethod(Invocation.method(#onClose, []),
      returnValueForMissingStub: null);
  @override
  void $configureLifeCycle() =>
      super.noSuchMethod(Invocation.method(#$configureLifeCycle, []),
          returnValueForMissingStub: null);
}
