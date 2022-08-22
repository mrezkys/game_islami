import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:game_islami/app/data/models/rank.dart';
import 'package:get/get.dart';

class RankController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot<Map<String, dynamic>>> getUserData() async* {
    yield* firestore.collection('users').orderBy('point', descending: true).snapshots();
  }

  // i made this because i cant access index from stream
  getRank(int rank, String? uid, var data) {
    print('uid1 : $uid ');
    bool thisUser = false;
    if (auth.currentUser!.uid == uid) thisUser = true;

    for (int i = 0; i < data.length; i++) {
      if (uid == data[i].id) {
        rank = i + 1;
      }
    }

    print(data[0].id);

    bool isBig3 = false;
    if (rank <= 3 && rank > 0) isBig3 = true;

    return Rank(
      number: rank,
      isBig3: isBig3,
      thisUser: thisUser,
    );
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
