import 'dart:convert';

class Contact {
  final String id;
  final String creatorId;
  final String organizationId;
  final String name;
  final String phone;
  final DateTime createdAt;
  final DateTime updatedAt;

  Contact({
    required this.id,
    required this.creatorId,
    required this.organizationId,
    required this.name,
    required this.phone,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
      id: json['id'] ?? "",
      creatorId: json['creatorId'] ?? "",
      organizationId: json['organizationId'] ?? " ",
      name: json['name'] ?? "",
      phone: json['phone'] ?? "",
      createdAt: DateTime.tryParse(json['createdAt']) ?? DateTime.now(),
      updatedAt: DateTime.tryParse(json['updatedAt']) ?? DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'creatorId': creatorId,
      'organizationId': organizationId,
      'name': name,
      'phone': phone,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  factory Contact.fromString(String jsonString) {
    return Contact.fromJson(json.decode(jsonString));
  }

  @override
  String toString() {
    return json.encode(toJson());
  }

  Contact copyWith({
    String? id,
    String? creatorId,
    String? organizationId,
    String? name,
    String? phone,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Contact(
      id: id ?? this.id,
      creatorId: creatorId ?? this.creatorId,
      organizationId: organizationId ?? this.organizationId,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
