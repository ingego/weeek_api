import 'dart:convert';

class StatusFunnels {
  final String? id;
  final String? creatorId;
  final String? name;
  final int? dealsCount;
  final int? dealsAmount;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  StatusFunnels({
    this.id,
    this.creatorId,
    this.name,
    this.dealsCount,
    this.dealsAmount,
    this.createdAt,
    this.updatedAt,
  });

  factory StatusFunnels.fromJson(Map<String, dynamic> json) {
    return StatusFunnels(
      id: json['id'],
      creatorId: json['creatorId'],
      name: json['name'],
      dealsCount: json['dealsCount'],
      dealsAmount: json['dealsAmount'],
      createdAt:
          json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt:
          json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'creatorId': creatorId,
      'name': name,
      'dealsCount': dealsCount,
      'dealsAmount': dealsAmount,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }

  factory StatusFunnels.fromString(String jsonString) {
    return StatusFunnels.fromJson(json.decode(jsonString));
  }

  @override
  String toString() {
    return json.encode(toJson());
  }

  StatusFunnels copyWith({
    String? id,
    String? creatorId,
    String? name,
    int? dealsCount,
    int? dealsAmount,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return StatusFunnels(
      id: id ?? this.id,
      creatorId: creatorId ?? this.creatorId,
      name: name ?? this.name,
      dealsCount: dealsCount ?? this.dealsCount,
      dealsAmount: dealsAmount ?? this.dealsAmount,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
