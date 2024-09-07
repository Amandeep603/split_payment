class Member {
  String name;
  double amountOwed;

  Member({
    required this.name,
    required this.amountOwed,
  });

  factory Member.fromJson(Map<String, dynamic> json) {
    return Member(
      name: json['name'],
      amountOwed: json['amountOwed'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'amountOwed': amountOwed,
    };
  }
}
