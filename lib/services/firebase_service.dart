import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/group.dart';

class FirebaseService {
  final CollectionReference groupCollection =
  FirebaseFirestore.instance.collection('groups');

  Future<void> addGroup(Group group) async {
    await groupCollection.doc(group.id).set(group.toJson());
  }

  Future<Group> getGroup(String groupId) async {
    DocumentSnapshot snapshot = await groupCollection.doc(groupId).get();
    return Group.fromJson(snapshot.data() as Map<String, dynamic>);
  }

  Future<void> updateGroup(Group group) async {
    await groupCollection.doc(group.id).update(group.toJson());
  }
}
