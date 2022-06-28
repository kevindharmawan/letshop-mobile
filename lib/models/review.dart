class Review {
  String? id;
  String? username;
  String? productId;
  String? content;
  int? rate;
  DateTime? date;

  Review(
      {this.id,
        this.username,
        this.productId,
        this.content,
        this.rate,
        this.date});

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      id: json['id'].toString(),
      username: json['username'].toString(),
      productId: json['productId'].toString(),
      content: json['content'].toString(),
      rate: json['rate'],
      date: json['date'],
    );
  }
}
