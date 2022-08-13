// Mocks generated by Mockito 5.2.0 from annotations
// in cinnamon_flutter_template_1/test/screens/registration/registration_controller_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i7;
import 'dart:io' as _i11;
import 'dart:ui' as _i17;

import 'package:cinnamon_flutter_template_1/models/lesson/lesson.dart' as _i15;
import 'package:cinnamon_flutter_template_1/screens/custom_bottom_navigation_bar/custom_bottom_navigation_bar_controller.dart'
    as _i14;
import 'package:cinnamon_flutter_template_1/services/dio_service.dart' as _i13;
import 'package:cinnamon_flutter_template_1/services/firebase_service.dart'
    as _i10;
import 'package:cloud_firestore/cloud_firestore.dart' as _i3;
import 'package:dio/dio.dart' as _i8;
import 'package:firebase_auth/firebase_auth.dart' as _i2;
import 'package:firebase_auth_platform_interface/firebase_auth_platform_interface.dart'
    as _i12;
import 'package:firebase_messaging/firebase_messaging.dart' as _i5;
import 'package:firebase_storage/firebase_storage.dart' as _i4;
import 'package:get/get.dart' as _i6;
import 'package:get/get_state_manager/src/simple/list_notifier.dart' as _i16;
import 'package:image_picker/image_picker.dart' as _i9;
import 'package:mockito/mockito.dart' as _i1;

import 'registration_controller_test.dart' as _i18;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeFirebaseAuth_0 extends _i1.Fake implements _i2.FirebaseAuth {}

class _FakeFirebaseFirestore_1 extends _i1.Fake
    implements _i3.FirebaseFirestore {}

class _FakeFirebaseStorage_2 extends _i1.Fake implements _i4.FirebaseStorage {}

class _FakeFirebaseMessaging_3 extends _i1.Fake
    implements _i5.FirebaseMessaging {}

class _FakeRx_4<T> extends _i1.Fake implements _i6.Rx<T> {}

class _FakeStreamSubscription_5<T> extends _i1.Fake
    implements _i7.StreamSubscription<T> {}

class _FakeInternalFinalCallback_6<T> extends _i1.Fake
    implements _i6.InternalFinalCallback<T> {}

class _FakeDocumentReference_7<T extends Object?> extends _i1.Fake
    implements _i3.DocumentReference<T> {}

class _FakeCollectionReference_8<T extends Object?> extends _i1.Fake
    implements _i3.CollectionReference<T> {}

class _FakeUserMetadata_9 extends _i1.Fake implements _i2.UserMetadata {}

class _FakeIdTokenResult_10 extends _i1.Fake implements _i2.IdTokenResult {}

class _FakeUserCredential_11 extends _i1.Fake implements _i2.UserCredential {}

class _FakeConfirmationResult_12 extends _i1.Fake
    implements _i2.ConfirmationResult {}

class _FakeUser_13 extends _i1.Fake implements _i2.User {}

class _FakeDio_14 extends _i1.Fake implements _i8.Dio {}

class _FakeImagePicker_15 extends _i1.Fake implements _i9.ImagePicker {}

class _FakeSnapshotMetadata_16 extends _i1.Fake
    implements _i3.SnapshotMetadata {}

class _FakeDocumentSnapshot_17<T extends Object?> extends _i1.Fake
    implements _i3.DocumentSnapshot<T> {}

/// A class which mocks [FirebaseService].
///
/// See the documentation for Mockito's code generation for more information.
class MockFirebaseService extends _i1.Mock implements _i10.FirebaseService {
  MockFirebaseService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.FirebaseAuth get firebaseAuth =>
      (super.noSuchMethod(Invocation.getter(#firebaseAuth),
          returnValue: _FakeFirebaseAuth_0()) as _i2.FirebaseAuth);
  @override
  set firebaseAuth(_i2.FirebaseAuth? _firebaseAuth) =>
      super.noSuchMethod(Invocation.setter(#firebaseAuth, _firebaseAuth),
          returnValueForMissingStub: null);
  @override
  _i3.FirebaseFirestore get firebaseFirestore =>
      (super.noSuchMethod(Invocation.getter(#firebaseFirestore),
          returnValue: _FakeFirebaseFirestore_1()) as _i3.FirebaseFirestore);
  @override
  set firebaseFirestore(_i3.FirebaseFirestore? _firebaseFirestore) => super
      .noSuchMethod(Invocation.setter(#firebaseFirestore, _firebaseFirestore),
          returnValueForMissingStub: null);
  @override
  _i4.FirebaseStorage get firebaseStorage =>
      (super.noSuchMethod(Invocation.getter(#firebaseStorage),
          returnValue: _FakeFirebaseStorage_2()) as _i4.FirebaseStorage);
  @override
  set firebaseStorage(_i4.FirebaseStorage? _firebaseStorage) =>
      super.noSuchMethod(Invocation.setter(#firebaseStorage, _firebaseStorage),
          returnValueForMissingStub: null);
  @override
  _i5.FirebaseMessaging get firebaseMessaging =>
      (super.noSuchMethod(Invocation.getter(#firebaseMessaging),
          returnValue: _FakeFirebaseMessaging_3()) as _i5.FirebaseMessaging);
  @override
  set firebaseMessaging(_i5.FirebaseMessaging? _firebaseMessaging) => super
      .noSuchMethod(Invocation.setter(#firebaseMessaging, _firebaseMessaging),
          returnValueForMissingStub: null);
  @override
  _i6.Rx<_i2.User?> get firebaseUser =>
      (super.noSuchMethod(Invocation.getter(#firebaseUser),
          returnValue: _FakeRx_4<_i2.User?>()) as _i6.Rx<_i2.User?>);
  @override
  set firebaseUser(_i6.Rx<_i2.User?>? _firebaseUser) =>
      super.noSuchMethod(Invocation.setter(#firebaseUser, _firebaseUser),
          returnValueForMissingStub: null);
  @override
  _i7.StreamSubscription<_i2.User?> get userChanges =>
      (super.noSuchMethod(Invocation.getter(#userChanges),
              returnValue: _FakeStreamSubscription_5<_i2.User?>())
          as _i7.StreamSubscription<_i2.User?>);
  @override
  set userChanges(_i7.StreamSubscription<_i2.User?>? _userChanges) =>
      super.noSuchMethod(Invocation.setter(#userChanges, _userChanges),
          returnValueForMissingStub: null);
  @override
  bool get urlSet =>
      (super.noSuchMethod(Invocation.getter(#urlSet), returnValue: false)
          as bool);
  @override
  String get profilePictureUrl => (super
          .noSuchMethod(Invocation.getter(#profilePictureUrl), returnValue: '')
      as String);
  @override
  set urlSet(bool? value) =>
      super.noSuchMethod(Invocation.setter(#urlSet, value),
          returnValueForMissingStub: null);
  @override
  set profilePictureUrl(String? value) =>
      super.noSuchMethod(Invocation.setter(#profilePictureUrl, value),
          returnValueForMissingStub: null);
  @override
  _i6.InternalFinalCallback<void> get onStart =>
      (super.noSuchMethod(Invocation.getter(#onStart),
              returnValue: _FakeInternalFinalCallback_6<void>())
          as _i6.InternalFinalCallback<void>);
  @override
  _i6.InternalFinalCallback<void> get onDelete =>
      (super.noSuchMethod(Invocation.getter(#onDelete),
              returnValue: _FakeInternalFinalCallback_6<void>())
          as _i6.InternalFinalCallback<void>);
  @override
  bool get initialized =>
      (super.noSuchMethod(Invocation.getter(#initialized), returnValue: false)
          as bool);
  @override
  bool get isClosed =>
      (super.noSuchMethod(Invocation.getter(#isClosed), returnValue: false)
          as bool);
  @override
  void onInit() => super.noSuchMethod(Invocation.method(#onInit, []),
      returnValueForMissingStub: null);
  @override
  _i7.Future<void> onClose() =>
      (super.noSuchMethod(Invocation.method(#onClose, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i7.Future<void>);
  @override
  void userLogged() => super.noSuchMethod(Invocation.method(#userLogged, []),
      returnValueForMissingStub: null);
  @override
  _i7.Future<int> signUp({String? email, String? password, String? fullName}) =>
      (super.noSuchMethod(
          Invocation.method(#signUp, [],
              {#email: email, #password: password, #fullName: fullName}),
          returnValue: Future<int>.value(0)) as _i7.Future<int>);
  @override
  _i7.Future<int> validateAccount({String? code, String? userId}) =>
      (super.noSuchMethod(
          Invocation.method(
              #validateAccount, [], {#code: code, #userId: userId}),
          returnValue: Future<int>.value(0)) as _i7.Future<int>);
  @override
  _i7.Future<int> signIn(String? email, String? password) =>
      (super.noSuchMethod(Invocation.method(#signIn, [email, password]),
          returnValue: Future<int>.value(0)) as _i7.Future<int>);
  @override
  _i7.Future<bool> changePassword(
          String? email, String? newPassword, String? userId) =>
      (super.noSuchMethod(
          Invocation.method(#changePassword, [email, newPassword, userId]),
          returnValue: Future<bool>.value(false)) as _i7.Future<bool>);
  @override
  _i7.Future<int> uploadFile({_i11.File? file}) =>
      (super.noSuchMethod(Invocation.method(#uploadFile, [], {#file: file}),
          returnValue: Future<int>.value(0)) as _i7.Future<int>);
  @override
  _i7.Future<void> downloadFile() =>
      (super.noSuchMethod(Invocation.method(#downloadFile, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i7.Future<void>);
  @override
  _i7.Future<bool> deleteFile(String? url) =>
      (super.noSuchMethod(Invocation.method(#deleteFile, [url]),
          returnValue: Future<bool>.value(false)) as _i7.Future<bool>);
  @override
  _i7.Future<void> logOut() =>
      (super.noSuchMethod(Invocation.method(#logOut, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i7.Future<void>);
  @override
  _i7.Future<_i3.DocumentSnapshot<Map<String, dynamic>>?> getDocument(
          {String? docPath}) =>
      (super.noSuchMethod(
              Invocation.method(#getDocument, [], {#docPath: docPath}),
              returnValue:
                  Future<_i3.DocumentSnapshot<Map<String, dynamic>>?>.value())
          as _i7.Future<_i3.DocumentSnapshot<Map<String, dynamic>>?>);
  @override
  _i7.Future<_i3.QuerySnapshot<Map<String, dynamic>>?> getDocuments(
          {String? collectionPath}) =>
      (super.noSuchMethod(
              Invocation.method(
                  #getDocuments, [], {#collectionPath: collectionPath}),
              returnValue:
                  Future<_i3.QuerySnapshot<Map<String, dynamic>>?>.value())
          as _i7.Future<_i3.QuerySnapshot<Map<String, dynamic>>?>);
  @override
  _i7.Future<bool> updateDoc(
          {String? collection, String? doc, String? field, dynamic value}) =>
      (super.noSuchMethod(
          Invocation.method(#updateDoc, [], {
            #collection: collection,
            #doc: doc,
            #field: field,
            #value: value
          }),
          returnValue: Future<bool>.value(false)) as _i7.Future<bool>);
  @override
  _i7.Future<bool> createDoc(
          {String? collection, String? doc, Map<String, dynamic>? data}) =>
      (super.noSuchMethod(
          Invocation.method(#createDoc, [],
              {#collection: collection, #doc: doc, #data: data}),
          returnValue: Future<bool>.value(false)) as _i7.Future<bool>);
  @override
  _i3.DocumentReference<Map<String, dynamic>> getDocumentReference(
          {String? doc, String? collection}) =>
      (super.noSuchMethod(
              Invocation.method(#getDocumentReference, [],
                  {#doc: doc, #collection: collection}),
              returnValue: _FakeDocumentReference_7<Map<String, dynamic>>())
          as _i3.DocumentReference<Map<String, dynamic>>);
  @override
  _i3.CollectionReference<Map<String, dynamic>> getCollectionReference(
          {String? collection}) =>
      (super.noSuchMethod(
              Invocation.method(
                  #getCollectionReference, [], {#collection: collection}),
              returnValue: _FakeCollectionReference_8<Map<String, dynamic>>())
          as _i3.CollectionReference<Map<String, dynamic>>);
  @override
  _i7.Future<String?> saveFile(String? url, String? name) =>
      (super.noSuchMethod(Invocation.method(#saveFile, [url, name]),
          returnValue: Future<String?>.value()) as _i7.Future<String?>);
  @override
  String getRefFromUrl(String? url) =>
      (super.noSuchMethod(Invocation.method(#getRefFromUrl, [url]),
          returnValue: '') as String);
  @override
  _i7.Future<bool> reauthenticate({String? email, String? password}) =>
      (super.noSuchMethod(
          Invocation.method(
              #reauthenticate, [], {#email: email, #password: password}),
          returnValue: Future<bool>.value(false)) as _i7.Future<bool>);
  @override
  void onReady() => super.noSuchMethod(Invocation.method(#onReady, []),
      returnValueForMissingStub: null);
  @override
  void $configureLifeCycle() =>
      super.noSuchMethod(Invocation.method(#$configureLifeCycle, []),
          returnValueForMissingStub: null);
}

/// A class which mocks [User].
///
/// See the documentation for Mockito's code generation for more information.
class MockUser extends _i1.Mock implements _i2.User {
  MockUser() {
    _i1.throwOnMissingStub(this);
  }

  @override
  bool get emailVerified =>
      (super.noSuchMethod(Invocation.getter(#emailVerified), returnValue: false)
          as bool);
  @override
  bool get isAnonymous =>
      (super.noSuchMethod(Invocation.getter(#isAnonymous), returnValue: false)
          as bool);
  @override
  _i2.UserMetadata get metadata =>
      (super.noSuchMethod(Invocation.getter(#metadata),
          returnValue: _FakeUserMetadata_9()) as _i2.UserMetadata);
  @override
  List<_i2.UserInfo> get providerData =>
      (super.noSuchMethod(Invocation.getter(#providerData),
          returnValue: <_i2.UserInfo>[]) as List<_i2.UserInfo>);
  @override
  String get uid =>
      (super.noSuchMethod(Invocation.getter(#uid), returnValue: '') as String);
  @override
  _i7.Future<void> delete() =>
      (super.noSuchMethod(Invocation.method(#delete, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i7.Future<void>);
  @override
  _i7.Future<String> getIdToken([bool? forceRefresh = false]) =>
      (super.noSuchMethod(Invocation.method(#getIdToken, [forceRefresh]),
          returnValue: Future<String>.value('')) as _i7.Future<String>);
  @override
  _i7.Future<_i2.IdTokenResult> getIdTokenResult(
          [bool? forceRefresh = false]) =>
      (super.noSuchMethod(Invocation.method(#getIdTokenResult, [forceRefresh]),
              returnValue:
                  Future<_i2.IdTokenResult>.value(_FakeIdTokenResult_10()))
          as _i7.Future<_i2.IdTokenResult>);
  @override
  _i7.Future<_i2.UserCredential> linkWithCredential(
          _i2.AuthCredential? credential) =>
      (super.noSuchMethod(Invocation.method(#linkWithCredential, [credential]),
              returnValue:
                  Future<_i2.UserCredential>.value(_FakeUserCredential_11()))
          as _i7.Future<_i2.UserCredential>);
  @override
  _i7.Future<_i2.UserCredential> linkWithPopup(_i12.AuthProvider? provider) =>
      (super.noSuchMethod(Invocation.method(#linkWithPopup, [provider]),
              returnValue:
                  Future<_i2.UserCredential>.value(_FakeUserCredential_11()))
          as _i7.Future<_i2.UserCredential>);
  @override
  _i7.Future<_i2.ConfirmationResult> linkWithPhoneNumber(String? phoneNumber,
          [_i2.RecaptchaVerifier? verifier]) =>
      (super.noSuchMethod(
              Invocation.method(#linkWithPhoneNumber, [phoneNumber, verifier]),
              returnValue: Future<_i2.ConfirmationResult>.value(
                  _FakeConfirmationResult_12()))
          as _i7.Future<_i2.ConfirmationResult>);
  @override
  _i7.Future<_i2.UserCredential> reauthenticateWithCredential(
          _i2.AuthCredential? credential) =>
      (super.noSuchMethod(
              Invocation.method(#reauthenticateWithCredential, [credential]),
              returnValue:
                  Future<_i2.UserCredential>.value(_FakeUserCredential_11()))
          as _i7.Future<_i2.UserCredential>);
  @override
  _i7.Future<void> reload() =>
      (super.noSuchMethod(Invocation.method(#reload, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i7.Future<void>);
  @override
  _i7.Future<void> sendEmailVerification(
          [_i2.ActionCodeSettings? actionCodeSettings]) =>
      (super.noSuchMethod(
          Invocation.method(#sendEmailVerification, [actionCodeSettings]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i7.Future<void>);
  @override
  _i7.Future<_i2.User> unlink(String? providerId) =>
      (super.noSuchMethod(Invocation.method(#unlink, [providerId]),
              returnValue: Future<_i2.User>.value(_FakeUser_13()))
          as _i7.Future<_i2.User>);
  @override
  _i7.Future<void> updateEmail(String? newEmail) =>
      (super.noSuchMethod(Invocation.method(#updateEmail, [newEmail]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i7.Future<void>);
  @override
  _i7.Future<void> updatePassword(String? newPassword) =>
      (super.noSuchMethod(Invocation.method(#updatePassword, [newPassword]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i7.Future<void>);
  @override
  _i7.Future<void> updatePhoneNumber(
          _i2.PhoneAuthCredential? phoneCredential) =>
      (super.noSuchMethod(
          Invocation.method(#updatePhoneNumber, [phoneCredential]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i7.Future<void>);
  @override
  _i7.Future<void> updateDisplayName(String? displayName) =>
      (super.noSuchMethod(Invocation.method(#updateDisplayName, [displayName]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i7.Future<void>);
  @override
  _i7.Future<void> updatePhotoURL(String? photoURL) =>
      (super.noSuchMethod(Invocation.method(#updatePhotoURL, [photoURL]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i7.Future<void>);
  @override
  _i7.Future<void> updateProfile({String? displayName, String? photoURL}) =>
      (super.noSuchMethod(
          Invocation.method(#updateProfile, [],
              {#displayName: displayName, #photoURL: photoURL}),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i7.Future<void>);
  @override
  _i7.Future<void> verifyBeforeUpdateEmail(String? newEmail,
          [_i2.ActionCodeSettings? actionCodeSettings]) =>
      (super.noSuchMethod(
          Invocation.method(
              #verifyBeforeUpdateEmail, [newEmail, actionCodeSettings]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i7.Future<void>);
}

/// A class which mocks [DioService].
///
/// See the documentation for Mockito's code generation for more information.
class MockDioService extends _i1.Mock implements _i13.DioService {
  MockDioService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i8.Dio get dio =>
      (super.noSuchMethod(Invocation.getter(#dio), returnValue: _FakeDio_14())
          as _i8.Dio);
  @override
  set dio(_i8.Dio? value) => super.noSuchMethod(Invocation.setter(#dio, value),
      returnValueForMissingStub: null);
  @override
  _i6.InternalFinalCallback<void> get onStart =>
      (super.noSuchMethod(Invocation.getter(#onStart),
              returnValue: _FakeInternalFinalCallback_6<void>())
          as _i6.InternalFinalCallback<void>);
  @override
  _i6.InternalFinalCallback<void> get onDelete =>
      (super.noSuchMethod(Invocation.getter(#onDelete),
              returnValue: _FakeInternalFinalCallback_6<void>())
          as _i6.InternalFinalCallback<void>);
  @override
  bool get initialized =>
      (super.noSuchMethod(Invocation.getter(#initialized), returnValue: false)
          as bool);
  @override
  bool get isClosed =>
      (super.noSuchMethod(Invocation.getter(#isClosed), returnValue: false)
          as bool);
  @override
  void onInit() => super.noSuchMethod(Invocation.method(#onInit, []),
      returnValueForMissingStub: null);
  @override
  _i7.Future<dynamic> getURL(String? url) =>
      (super.noSuchMethod(Invocation.method(#getURL, [url]),
          returnValue: Future<dynamic>.value()) as _i7.Future<dynamic>);
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

/// A class which mocks [CustomBottomNavigationBarController].
///
/// See the documentation for Mockito's code generation for more information.
class MockCustomBottomNavigationBarController extends _i1.Mock
    implements _i14.CustomBottomNavigationBarController {
  MockCustomBottomNavigationBarController() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i9.ImagePicker get imagePicker =>
      (super.noSuchMethod(Invocation.getter(#imagePicker),
          returnValue: _FakeImagePicker_15()) as _i9.ImagePicker);
  @override
  int get selectedIndex =>
      (super.noSuchMethod(Invocation.getter(#selectedIndex), returnValue: 0)
          as int);
  @override
  set imagePicker(_i9.ImagePicker? value) =>
      super.noSuchMethod(Invocation.setter(#imagePicker, value),
          returnValueForMissingStub: null);
  @override
  set selectedIndex(dynamic value) =>
      super.noSuchMethod(Invocation.setter(#selectedIndex, value),
          returnValueForMissingStub: null);
  @override
  _i6.InternalFinalCallback<void> get onStart =>
      (super.noSuchMethod(Invocation.getter(#onStart),
              returnValue: _FakeInternalFinalCallback_6<void>())
          as _i6.InternalFinalCallback<void>);
  @override
  _i6.InternalFinalCallback<void> get onDelete =>
      (super.noSuchMethod(Invocation.getter(#onDelete),
              returnValue: _FakeInternalFinalCallback_6<void>())
          as _i6.InternalFinalCallback<void>);
  @override
  bool get initialized =>
      (super.noSuchMethod(Invocation.getter(#initialized), returnValue: false)
          as bool);
  @override
  bool get isClosed =>
      (super.noSuchMethod(Invocation.getter(#isClosed), returnValue: false)
          as bool);
  @override
  bool get hasListeners =>
      (super.noSuchMethod(Invocation.getter(#hasListeners), returnValue: false)
          as bool);
  @override
  int get listeners =>
      (super.noSuchMethod(Invocation.getter(#listeners), returnValue: 0)
          as int);
  @override
  void onInit() => super.noSuchMethod(Invocation.method(#onInit, []),
      returnValueForMissingStub: null);
  @override
  String writeLessonDate(_i15.Lesson? lesson) =>
      (super.noSuchMethod(Invocation.method(#writeLessonDate, [lesson]),
          returnValue: '') as String);
  @override
  _i7.Future<_i11.File?> chooseImage({bool? isCamera}) => (super.noSuchMethod(
      Invocation.method(#chooseImage, [], {#isCamera: isCamera}),
      returnValue: Future<_i11.File?>.value()) as _i7.Future<_i11.File?>);
  @override
  void update([List<Object>? ids, bool? condition = true]) =>
      super.noSuchMethod(Invocation.method(#update, [ids, condition]),
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
  @override
  _i16.Disposer addListener(_i16.GetStateUpdate? listener) =>
      (super.noSuchMethod(Invocation.method(#addListener, [listener]),
          returnValue: () {}) as _i16.Disposer);
  @override
  void removeListener(_i17.VoidCallback? listener) =>
      super.noSuchMethod(Invocation.method(#removeListener, [listener]),
          returnValueForMissingStub: null);
  @override
  void refresh() => super.noSuchMethod(Invocation.method(#refresh, []),
      returnValueForMissingStub: null);
  @override
  void refreshGroup(Object? id) =>
      super.noSuchMethod(Invocation.method(#refreshGroup, [id]),
          returnValueForMissingStub: null);
  @override
  void notifyChildrens() =>
      super.noSuchMethod(Invocation.method(#notifyChildrens, []),
          returnValueForMissingStub: null);
  @override
  void removeListenerId(Object? id, _i17.VoidCallback? listener) =>
      super.noSuchMethod(Invocation.method(#removeListenerId, [id, listener]),
          returnValueForMissingStub: null);
  @override
  void dispose() => super.noSuchMethod(Invocation.method(#dispose, []),
      returnValueForMissingStub: null);
  @override
  _i16.Disposer addListenerId(Object? key, _i16.GetStateUpdate? listener) =>
      (super.noSuchMethod(Invocation.method(#addListenerId, [key, listener]),
          returnValue: () {}) as _i16.Disposer);
  @override
  void disposeId(Object? id) =>
      super.noSuchMethod(Invocation.method(#disposeId, [id]),
          returnValueForMissingStub: null);
}

/// A class which mocks [QuerySnapshot].
///
/// See the documentation for Mockito's code generation for more information.
class MockQuerySnapshot<T extends Object?> extends _i1.Mock
    implements _i3.QuerySnapshot<T> {
  MockQuerySnapshot() {
    _i1.throwOnMissingStub(this);
  }

  @override
  List<_i3.QueryDocumentSnapshot<T>> get docs =>
      (super.noSuchMethod(Invocation.getter(#docs),
              returnValue: <_i3.QueryDocumentSnapshot<T>>[])
          as List<_i3.QueryDocumentSnapshot<T>>);
  @override
  List<_i3.DocumentChange<T>> get docChanges => (super.noSuchMethod(
      Invocation.getter(#docChanges),
      returnValue: <_i3.DocumentChange<T>>[]) as List<_i3.DocumentChange<T>>);
  @override
  _i3.SnapshotMetadata get metadata =>
      (super.noSuchMethod(Invocation.getter(#metadata),
          returnValue: _FakeSnapshotMetadata_16()) as _i3.SnapshotMetadata);
  @override
  int get size =>
      (super.noSuchMethod(Invocation.getter(#size), returnValue: 0) as int);
}

/// A class which mocks [DocumentReference].
///
/// See the documentation for Mockito's code generation for more information.
// ignore: must_be_immutable
class MockDocumentReference<T extends Object?> extends _i1.Mock
    implements _i3.DocumentReference<T> {
  MockDocumentReference() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.FirebaseFirestore get firestore =>
      (super.noSuchMethod(Invocation.getter(#firestore),
          returnValue: _FakeFirebaseFirestore_1()) as _i3.FirebaseFirestore);
  @override
  String get id =>
      (super.noSuchMethod(Invocation.getter(#id), returnValue: '') as String);
  @override
  _i3.CollectionReference<T> get parent =>
      (super.noSuchMethod(Invocation.getter(#parent),
              returnValue: _FakeCollectionReference_8<T>())
          as _i3.CollectionReference<T>);
  @override
  String get path =>
      (super.noSuchMethod(Invocation.getter(#path), returnValue: '') as String);
  @override
  _i3.CollectionReference<Map<String, dynamic>> collection(
          String? collectionPath) =>
      (super.noSuchMethod(Invocation.method(#collection, [collectionPath]),
              returnValue: _FakeCollectionReference_8<Map<String, dynamic>>())
          as _i3.CollectionReference<Map<String, dynamic>>);
  @override
  _i7.Future<void> delete() =>
      (super.noSuchMethod(Invocation.method(#delete, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i7.Future<void>);
  @override
  _i7.Future<void> update(Map<String, Object?>? data) =>
      (super.noSuchMethod(Invocation.method(#update, [data]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i7.Future<void>);
  @override
  _i7.Future<_i3.DocumentSnapshot<T>> get([_i3.GetOptions? options]) =>
      (super.noSuchMethod(Invocation.method(#get, [options]),
              returnValue: Future<_i3.DocumentSnapshot<T>>.value(
                  _FakeDocumentSnapshot_17<T>()))
          as _i7.Future<_i3.DocumentSnapshot<T>>);
  @override
  _i7.Stream<_i3.DocumentSnapshot<T>> snapshots(
          {bool? includeMetadataChanges = false}) =>
      (super.noSuchMethod(
              Invocation.method(#snapshots, [],
                  {#includeMetadataChanges: includeMetadataChanges}),
              returnValue: Stream<_i3.DocumentSnapshot<T>>.empty())
          as _i7.Stream<_i3.DocumentSnapshot<T>>);
  @override
  _i7.Future<void> set(T? data, [_i3.SetOptions? options]) =>
      (super.noSuchMethod(Invocation.method(#set, [data, options]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i7.Future<void>);
  @override
  _i3.DocumentReference<R> withConverter<R>(
          {_i3.FromFirestore<R>? fromFirestore,
          _i3.ToFirestore<R>? toFirestore}) =>
      (super.noSuchMethod(
              Invocation.method(#withConverter, [],
                  {#fromFirestore: fromFirestore, #toFirestore: toFirestore}),
              returnValue: _FakeDocumentReference_7<R>())
          as _i3.DocumentReference<R>);
}

/// A class which mocks [QueryDocumentSnapshot].
///
/// See the documentation for Mockito's code generation for more information.
class MockQueryDocumentSnapshot<T extends Object?> extends _i1.Mock
    implements _i3.QueryDocumentSnapshot<T> {
  MockQueryDocumentSnapshot() {
    _i1.throwOnMissingStub(this);
  }

  @override
  String get id =>
      (super.noSuchMethod(Invocation.getter(#id), returnValue: '') as String);
  @override
  _i3.DocumentReference<T> get reference => (super.noSuchMethod(
      Invocation.getter(#reference),
      returnValue: _FakeDocumentReference_7<T>()) as _i3.DocumentReference<T>);
  @override
  _i3.SnapshotMetadata get metadata =>
      (super.noSuchMethod(Invocation.getter(#metadata),
          returnValue: _FakeSnapshotMetadata_16()) as _i3.SnapshotMetadata);
  @override
  bool get exists =>
      (super.noSuchMethod(Invocation.getter(#exists), returnValue: false)
          as bool);
  @override
  T data() => (super.noSuchMethod(Invocation.method(#data, []),
      returnValue: _i18.getData()) as T);
  @override
  dynamic get(Object? field) =>
      super.noSuchMethod(Invocation.method(#get, [field]));
  @override
  dynamic operator [](Object? field) =>
      super.noSuchMethod(Invocation.method(#[], [field]));
}
