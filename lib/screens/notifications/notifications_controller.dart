import 'package:get/get.dart';

import '../../constants/dependencies.dart';
import '../../constants/firestore_collections.dart';

class NotificationsController extends GetxController {
  /// ------------------------
  /// INIT
  /// ------------------------

  @override
  Future<void> onInit() async {
    super.onInit();

    await sharedFirebaseDataService.getNotifications();
  }

  /// ------------------------
  /// METHODS
  /// ------------------------

  Future<bool> updateNotification({required int index}) async {
    final userId = firebaseService.firebaseUser.value?.uid;

    if (userId != null) {
      sharedFirebaseDataService.notifications.removeAt(index);

      final updatedNotifications = sharedFirebaseDataService.notifications.map((e) => e.toJson()).toList();

      final result = await firebaseService.updateDoc(
          collection: FCFirestoreCollections.notificationsCollection,
          doc: userId,
          field: 'notification',
          value: updatedNotifications);

      return result;
    }

    return false;
  }

  Future<bool> refreshNotifications() async {
    final userId = firebaseService.firebaseUser.value?.uid;

    if (userId != null) {
      final updatedNotifications = sharedFirebaseDataService.notifications
          .map((notification) => notification.copyWith(isRead: true).toJson())
          .toList();

      final result = await firebaseService.updateDoc(
          collection: FCFirestoreCollections.notificationsCollection,
          doc: userId,
          field: 'notification',
          value: updatedNotifications);

      await sharedFirebaseDataService.getNotifications();

      return result;
    }

    return false;
  }
}
