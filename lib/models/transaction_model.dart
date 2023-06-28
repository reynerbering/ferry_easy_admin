import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class TransactionModel {
  final String transactionType;
  final String transactionId;
  final String user;
  final int amount;
  final DateTime dateIssued;

  TransactionModel({
    required this.transactionType,
    required this.transactionId,
    required this.user,
    required this.amount,
    required this.dateIssued,
  });

  TransactionModel copyWith({
    String? transactionType,
    String? transactionId,
    String? user,
    int? amount,
    DateTime? dateIssued,
  }) {
    return TransactionModel(
      transactionType: transactionType ?? this.transactionType,
      transactionId: transactionId ?? this.transactionId,
      user: user ?? this.user,
      amount: amount ?? this.amount,
      dateIssued: dateIssued ?? this.dateIssued,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'transactionType': transactionType,
      'transactionId': transactionId,
      'user': user,
      'amount': amount,
      'dateIssued': Timestamp.fromDate(dateIssued),
    };
  }

  factory TransactionModel.fromMap(Map<String, dynamic> map) {
    return TransactionModel(
      transactionType: map['transactionType'] as String,
      transactionId: map['transactionId'] as String,
      user: map['user'] as String,
      amount: map['amount'] as int,
      dateIssued: (map['dateIssued'] as Timestamp).toDate(),
    );
  }

  String toJson() => json.encode(toMap());

  factory TransactionModel.fromJson(String source) =>
      TransactionModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
