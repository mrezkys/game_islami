import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:game_islami/app/data/models/point_allocation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

class GameController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<List<String>> getAllChallengeDoc() async {
    List<String> listChallengeNames = [];
    QuerySnapshot<Map<String, dynamic>> challengeSnapshot = await firestore.collection('challenges').get();
    for (var i = 0; i < challengeSnapshot.docs.length; i++) {
      listChallengeNames.add(challengeSnapshot.docs[i].id);
    }

    return listChallengeNames;
  }

  Future<Map<String, dynamic>> getBaseChallangeDoc({
    required String type,
    required String date,
  }) async {
    var challengeSnapshot = await firestore.collection('challenges').doc(type).get();
    var challengeData = challengeSnapshot.data() as Map<String, dynamic>;

    var data = {
      'name': challengeData['name'],
      'date': date,
      'limit': challengeData['limit'],
      'amount': challengeData['amount'],
      'reward': challengeData['reward'],
    };

    return data;
  }

  setChallenge() async {
    DateTime dateTime = DateTime.now();
    final f = DateFormat('dd-MM-yyyy');
    String date = f.format(dateTime);

    String uid = auth.currentUser!.uid;
    var userChallengesCollection = firestore.collection('users').doc(uid).collection('challenges');
    var challengesData = await userChallengesCollection.get();

    var listChallengesFromCollection = challengesData.docs;
    print(listChallengesFromCollection);

    if (listChallengesFromCollection.length == 0) {
      List<String> listChallengeNames = await getAllChallengeDoc();
      for (var i = 0; i < listChallengeNames.length; i++) {
        String docName = listChallengeNames[i];
        await userChallengesCollection.doc(docName).set(
              await getBaseChallangeDoc(
                type: docName,
                date: date,
              ),
            );
      }
    } else {
      var challengesSampleDoc = listChallengesFromCollection[0];
      var challengesSample = challengesSampleDoc.data();
      if (challengesSample['date'] != date) {
        List<String> listChallengeNames = await getAllChallengeDoc();

        //delete dulu
        for (var i = 0; i < listChallengesFromCollection.length; i++) {
          listChallengesFromCollection[i].reference.delete();
        }
        //baru buat lagi
        for (var i = 0; i < listChallengeNames.length; i++) {
          String docName = listChallengeNames[i];
          await userChallengesCollection.doc(docName).set(
                await getBaseChallangeDoc(
                  date: date,
                  type: docName,
                ),
              );
        }
      }
    }
  }

  addPointToUserAccount({required int amount}) async {
    String uid = auth.currentUser!.uid;
    DocumentReference userDocument = firestore.collection('users').doc(uid);
    DocumentSnapshot userDocumentSnapshot = await userDocument.get();
    Map<String, dynamic> userData = userDocumentSnapshot.data() as Map<String, dynamic>;
    int currentPoint = userData['point'];
    userDocument.update({
      'point': currentPoint + amount,
    });
  }

  savePointConfiguration() {
    final box = GetStorage();
    DocumentReference pointAllocationRef = firestore.collection('game').doc('point_allocation');

    pointAllocationRef.get().then((data) async {
      PointAllocation pointAllocation = PointAllocation.fromJson(data.data() as Map<String, dynamic>);
      await box.write('point_allocation', pointAllocation);
    });
  }

  giveChallengeReward({required String type}) async {
    String uid = auth.currentUser!.uid;
    var userChallengesCollection = firestore.collection('users').doc(uid).collection('challenges');

    var typeDoc = await userChallengesCollection.doc(type).get();
    var typeDocData = typeDoc.data();

    int currentAmount = typeDocData!['amount'];
    int limit = typeDocData['limit'];
    int reward = typeDocData['reward'];

    if (currentAmount == limit) {
      DocumentReference userDocument = firestore.collection('users').doc(uid);
      var userDocumentSnapshot = await userDocument.get();
      var userData = userDocumentSnapshot.data() as Map<String, dynamic>;
      int currentPoint = userData['point'];
      await userDocument.update({
        'point': currentPoint + reward,
      });
    }
  }

  updateChallengeData({required String type}) async {
    String uid = auth.currentUser!.uid;
    var userChallengesCollection = firestore.collection('users').doc(uid).collection('challenges');

    var typeDoc = await userChallengesCollection.doc(type).get();
    var typeDocData = typeDoc.data();
    int currentAmount = typeDocData!['amount'];

    userChallengesCollection.doc(type).update({
      'amount': currentAmount + 1,
    });

    //checking
    giveChallengeReward(type: type);
  }

  initGame() async {
    if (auth.currentUser != null) {
      print('exc');
      await savePointConfiguration();
      await setChallenge();
    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
