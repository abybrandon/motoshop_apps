// ignore_for_file: unused_local_variable

import 'dart:collection';
import 'dart:io';
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:motoshop_reborn/models/firebasemodel.dart';
import 'package:path/path.dart' as path;
import 'package:uuid/uuid.dart';

class MotorsNotifier with ChangeNotifier {
  List<Motors> _motorsList = [];
  Motors _currentMotors;

  UnmodifiableListView<Motors> get motorsList =>
      UnmodifiableListView(_motorsList);

  Motors get currentMotors => _currentMotors;

  set motorsList(List<Motors> motorsList) {
    _motorsList = motorsList;
    notifyListeners();
  }

  set currentMotors(Motors motors) {
    _currentMotors = motors;
    notifyListeners();
  }

  addMotors(Motors motors) {
    _motorsList.insert(0, motors);
    notifyListeners();
  }

  deleteMotors(Motors motors) {
    _motorsList.removeWhere((_motors) => _motors.id == motors.id);
    notifyListeners();
  }
}

getMotors(MotorsNotifier motorsNotifier) async {
  QuerySnapshot snapshot = await FirebaseFirestore.instance
      .collection("motor")
      .orderBy("created", descending: true)
      .get();

  List<Motors> _motorsList = [];

  snapshot.docs.forEach((document) {
    Motors motors = Motors.fromMap(document.data());
    _motorsList.add(motors);
  });
  motorsNotifier.motorsList = _motorsList;
}

uploadMotorsAndImage(
  Motors motors,
  bool isUpdating,
  File localFile,
  Function motorsUploaded,
) async {
  if (localFile != null) {
    print("Uploading Image");

    var fileExtension = path.extension(localFile.path);
    print(fileExtension);

    var uuid = Uuid().v4();

    final Reference firebaseStorageRef = FirebaseStorage.instance
        .ref()
        .child('motors/images/$uuid$fileExtension');
    //cek lg
    await firebaseStorageRef
        .putFile(localFile)
        .then((onError) => print("haha"))
        .catchError((onError) {
      print(onError);
    });

    String url = await firebaseStorageRef.getDownloadURL();
    print("download url: $url");

    _uploadMotors(motors, isUpdating, motorsUploaded, imageUrl: url);
  } else {
    print("..Skipping image upload");
    _uploadMotors(motors, isUpdating, motorsUploaded);
  }
}

// uploadImageArray(Motors motors, bool isUpdating, File localFile,
//     Function motorsUploaded) async {
//   if (localFile != null) {
//     print("Uploading Image");

//     var fileExtension = path.extension(localFile.path);
//     print(fileExtension);

//     var uuid = Uuid().v4();

//     final Reference firebaseStorageRef = FirebaseStorage.instance
//         .ref()
//         .child('motors/images/$uuid$fileExtension');
// //cek lg
//     await firebaseStorageRef
//         .putFile(localFile)
//         .then((onError) => print("haha"))
//         .catchError((onError) {
//       print(onError);
//     });

//     String url = await firebaseStorageRef.getDownloadURL();
//     print("download url: $url");
//     _uploadAddArrayMotors(
//       motors,
//       motorsUploaded,
//     );
//   } else {
//     print("..Skipping image upload");
//   }
// }

_uploadMotors(
  Motors motors,
  bool isUpdating,
  Function motorsUploaded, {
  String imageUrl,
}) async {
  CollectionReference motorsRef =
      FirebaseFirestore.instance.collection("motor");
  List array_gambarlain = [];
  if (imageUrl != null) {
    motors.kode_jual = imageUrl;
    array_gambarlain.add(imageUrl);
    motors.gambar_utama = imageUrl;
  }
  array_gambarlain.addAll(motors.gambar_lain);
  motors.gambar_lain = array_gambarlain;
  if (isUpdating) {
    motors.updatedAt = Timestamp.now();

    await motorsRef.doc(motors.id).set(motors.toMap(), SetOptions(merge: true));

    motorsUploaded(motors);
    print("updated motors with id: ${motors.id}");
  } else {
    motors.created = Timestamp.now();

    DocumentReference documentRef = await motorsRef.add(motors.toMap());

    motors.id = documentRef.id;

    print("uploaded motors succeccfully:  ${motors.toString()}");

    await documentRef.set(motors.toMap());
    motorsUploaded(motors);
  }
}

// _uploadAddArrayMotors(Motors motors, Function motorsUploaded,
//     {String imageUrlArray}) async {
//   CollectionReference motorsRef =
//       FirebaseFirestore.instance.collection("motor");

//   motors.updatedAt = Timestamp.now();

//   await motorsRef.doc(motors.id).set(motors.toMap(), SetOptions(merge: true));

//   motorsUploaded(motors);
//   print("updated motors with id: ${motors.id}");
// }

deleteMotors(Motors motors, Function motorsDeleted) async {
  await FirebaseFirestore.instance.collection('motor').doc(motors.id).delete();
  motorsDeleted(motors);
}
