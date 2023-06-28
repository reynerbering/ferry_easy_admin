import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String uid;
  final String firstName;
  final String lastName;
  final String email;
  final String username;
  final String profileImg;
  final String contactNum;
  final String accountType;
  final Map<String, dynamic> address;
  final DateTime birthDate;
  final int wallet;
  final bool isVerified;
  final String validId;

  UserModel({
    required this.uid,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.accountType,
    required this.username,
    required this.address,
    required this.birthDate,
    required this.wallet,
    required this.isVerified,
    required this.contactNum,
    required this.profileImg,
    required this.validId,
  });

  // Convert User object to Map
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'accountType': accountType,
      'username': username,
      'address': address,
      'birthDate': Timestamp.fromDate(birthDate),
      'wallet': wallet,
      'contactNum': contactNum,
      'isVerified': isVerified,
      'profileImg': profileImg,
      'validId': validId,
    };
  }

  // Create User object from Map
  factory UserModel.fromMap(
      Map<String, dynamic> map, DocumentReference reference) {
    return UserModel(
      uid: map['uid'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      email: map['email'],
      accountType: map['accountType'],
      username: map['username'],
      address: map['address'],
      birthDate: (map['birthDate'] as Timestamp).toDate(),
      wallet: map['wallet'],
      isVerified: map['isVerified'],
      profileImg: map['profileImg'],
      contactNum: map['contactNum'],
      validId: map['validId'],
    );
  }

  Map<String, dynamic> get json => {
        'uid': uid,
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'accountType': accountType,
        'username': username,
        'address': address,
        'birthDate': birthDate.toString(),
        'wallet': wallet,
        'isVerified': isVerified,
        'contactNum': contactNum,
        'profileImg': profileImg,
        'validId': validId,
      };

  static Future<UserModel> fromUid({required String uid}) async {
    DocumentSnapshot snap =
        await FirebaseFirestore.instance.collection('Users').doc(uid).get();
    return UserModel.fromDocumentSnap(snap);
  }

  static UserModel fromDocumentSnap(DocumentSnapshot snap) {
    Map<String, dynamic> json = {};
    if (snap.data() != null) {
      json = snap.data() as Map<String, dynamic>;
    }
    return UserModel(
      uid: snap.id,
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      email: json['email'] ?? '',
      accountType: json['accountType'] ?? '',
      username: json['username'] ?? '',
      address: json['address'] ?? {},
      birthDate: (json['birthDate'] != null)
          ? DateTime.parse(json['birthDate'])
          : DateTime.now(),
      wallet: json['wallet'] ?? 0,
      isVerified: json['isVerified'] ?? false,
      contactNum: json['contactNum'] ?? '',
      profileImg: json['profileImg'] ?? '',
      validId: json['validId'] ?? '',
    );
  }

  static Stream<UserModel> fromUidStream({required String uid}) {
    return FirebaseFirestore.instance
        .collection('Users')
        .doc(uid)
        .snapshots()
        .map((snapshot) {
      final data = snapshot.data();
      if (data == null) {
        throw Exception("Document does not exist!");
      }
      return UserModel.fromMap(data, snapshot.reference);
    });
  }
}

Future<void> addUser(UserModel user) async {
  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('Users');
  await usersCollection.doc(user.uid.toString()).set(user.toMap());
}

Stream<UserModel?> getUser(String userId) {
  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('Users');
  final DocumentReference userDocRef = usersCollection.doc(userId);

  return userDocRef.snapshots().map(
    (docSnapshot) {
      if (docSnapshot.exists) {
        final Map<String, dynamic> userData =
            docSnapshot.data() as Map<String, dynamic>;
        return UserModel.fromMap(userData, userDocRef);
      } else {
        return null;
      }
    },
  );
}
