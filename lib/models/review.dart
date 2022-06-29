class Review {
  String? id;
  String? username;
  String? productId;
  String? content;
  int? rate;
  DateTime? date;
  String? profilePicture;

  Review({
    this.id,
      this.username,
      this.productId,
      this.content,
      this.rate,
      this.date,
      this.profilePicture
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      id: json['id'].toString(),
      username: json['username'].toString(),
      productId: json['productId'].toString(),
      content: json['content'].toString(),
      rate: json['rate'],
      date: json['date'],
      profilePicture: json['profilePicture'].toString(),
    );
  }
}
