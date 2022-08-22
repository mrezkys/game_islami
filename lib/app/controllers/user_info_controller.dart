import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class UserInfoController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  RxnInt userRank = RxnInt();

  Future<int> getUserRank() async {
    String currentUserUID = auth.currentUser!.uid;
    CollectionReference usersCollection = firestore.collection('users');
    QuerySnapshot<Object?> usersCollectionQuery = await usersCollection.orderBy('point', descending: true).get();
    List<QueryDocumentSnapshot<Object?>> listUserDoc = usersCollectionQuery.docs;
    int rank = 0;
    for (var i = 0; i < listUserDoc.length; i++) {
      rank += 1;
      Map<String, dynamic> doc = listUserDoc[i].data() as Map<String, dynamic>;
      if (currentUserUID == doc['uid']) {
        break;
      }
    }
    print('rank : $rank');
    return rank;
  }

  Stream<DocumentSnapshot<Map<String, dynamic>>> streamUser() async* {
    String uid = auth.currentUser!.uid;
    yield* firestore.collection("users").doc(uid).snapshots();
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    if (auth.currentUser != null) {
      getUserRank().then((value) {
        userRank.value = value;
      });
    }
  }

  @override
  void onClose() {}
}
