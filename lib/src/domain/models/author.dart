class Author {
  int id;
  String fullName;
  String address;
  String bibliography;

  Author({
    required this.id,
    required this.fullName,
    required this.address,
    required this.bibliography,
  });

  factory Author.fromJson(Map<String, dynamic> json) => Author(
        id: json["id"],
        fullName: json["fullName"],
        address: json["address"],
        bibliography: (json["bibliography"] != "")
            ? json["bibliography"]
            : "Bibliografía no disponible",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fullName": fullName,
        "address": address,
        "bibliography": bibliography,
      };
}
