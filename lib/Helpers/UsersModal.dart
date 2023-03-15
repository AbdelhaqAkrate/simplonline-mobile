class UsersModal {
  String? id;
  String? name;
  String? email;
  String? phone;
  String? promo;
  String? password;
  String? image;

  UsersModal({
    this.name,
    this.email,
    this.phone,
    this.promo,
    this.password,
    this.image,
    this.id,
  });

  factory UsersModal.fromJson(Map<String, dynamic> json) => UsersModal(
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        promo: json["promo"],
        password: json["password"],
        image: json["image"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "phone": phone,
        "promo": promo,
        "password": password,
        "image": image,
        "id": id,
      };
}
