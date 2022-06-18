// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class Transection extends Equatable {
  final double amount;
  final DateTime time;
  final String source;
  final String transectionType;
  final String note;
  const Transection({
    required this.amount,
    required this.time,
    required this.source,
    required this.transectionType,
    required this.note,
  });

  Transection copyWith({
    double? amount,
    DateTime? time,
    String? source,
    String? transectionType,
    String? note,
  }) {
    return Transection(
      amount: amount ?? this.amount,
      time: time ?? this.time,
      source: source ?? this.source,
      transectionType: transectionType ?? this.transectionType,
      note: note ?? this.note,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'amount': amount,
      'time': time.millisecondsSinceEpoch,
      'source': source,
      'transectionType': transectionType,
      'note': note,
    };
  }

  factory Transection.fromMap(Map<String, dynamic> map) {
    return Transection(
      amount: map['amount'] as double,
      time: DateTime.fromMillisecondsSinceEpoch(map['time'] as int),
      source: map['source'] as String,
      transectionType: map['transectionType'] as String,
      note: map['note'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Transection.fromJson(String source) =>
      Transection.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      amount,
      time,
      source,
      transectionType,
      note,
    ];
  }
}
