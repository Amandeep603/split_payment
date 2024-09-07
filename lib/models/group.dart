import 'member.dart';

class Group {
  String id;
  String name;
  List<Member> members;
  double totalAmount;

  Group({
    required this.id,
    required this.name,
    required this.members,
    required this.totalAmount,
  });

  factory Group.fromJson(Map<String, dynamic> json) {
    return Group(
      id: json['id'],
      name: json['name'],
      members: (json['members'] as List)
          .map((member) => Member.fromJson(member))
          .toList(),
      totalAmount: json['totalAmount'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'members': members.map((m) => m.toJson()).toList(),
      'totalAmount': totalAmount,
    };
  }
}
