import 'dart:convert';

class Funnels {
  final String? id;
  final String? creatorId;
  final int? currencyId;
  final String? name;
  final String? logo;
  final int? dealsCount;
  final int? dealsAmount;
  final bool? isPrivate;
  final bool? isBookmarked;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<String>? team;

  Funnels({
    this.id,
    this.creatorId,
    this.currencyId,
    this.name,
    this.logo,
    this.dealsCount,
    this.dealsAmount,
    this.isPrivate,
    this.isBookmarked,
    this.createdAt,
    this.updatedAt,
    this.team,
  });

  factory Funnels.fromJson(Map<String, dynamic> json) {
    return Funnels(
      id: json['id'],
      creatorId: json['creatorId'],
      currencyId: json['currencyId'],
      name: json['name'],
      logo: json['logo'],
      dealsCount: json['dealsCount'],
      dealsAmount: json['dealsAmount'],
      isPrivate: json['isPrivate'],
      isBookmarked: json['isBookmarked'],
      createdAt:
          json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt:
          json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
      team: json['team'] != null ? List<String>.from(json['team']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'creatorId': creatorId,
      'currencyId': currencyId,
      'name': name,
      'logo': logo,
      'dealsCount': dealsCount,
      'dealsAmount': dealsAmount,
      'isPrivate': isPrivate,
      'isBookmarked': isBookmarked,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'team': team,
    };
  }

  factory Funnels.fromString(String jsonString) {
    return Funnels.fromJson(json.decode(jsonString));
  }

  @override
  String toString() {
    return json.encode(toJson());
  }

  Funnels copyWith({
    String? id,
    String? creatorId,
    int? currencyId,
    String? name,
    String? logo,
    int? dealsCount,
    int? dealsAmount,
    bool? isPrivate,
    bool? isBookmarked,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<String>? team,
  }) {
    return Funnels(
      id: id ?? this.id,
      creatorId: creatorId ?? this.creatorId,
      currencyId: currencyId ?? this.currencyId,
      name: name ?? this.name,
      logo: logo ?? this.logo,
      dealsCount: dealsCount ?? this.dealsCount,
      dealsAmount: dealsAmount ?? this.dealsAmount,
      isPrivate: isPrivate ?? this.isPrivate,
      isBookmarked: isBookmarked ?? this.isBookmarked,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      team: team ?? this.team,
    );
  }
}
