// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Source extends Equatable {
  final String name;
  final DateTime createAt;
  const Source({
    required this.name,
    required this.createAt,
  });

  Source copyWith({
    String? name,
    DateTime? createAt,
  }) {
    return Source(
      name: name ?? this.name,
      createAt: createAt ?? this.createAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'createAt': Timestamp.fromDate(createAt),
    };
  }

  factory Source.fromMap(Map<String, dynamic> map) {
    return Source(
        name: map['name'] as String,
        createAt: map['createAt'] != null
            ? (map['createAt'] as Timestamp).toDate()
            : DateTime.now());
  }

  String toJson() => json.encode(toMap());

  factory Source.fromJson(String source) =>
      Source.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [name, createAt];
}
