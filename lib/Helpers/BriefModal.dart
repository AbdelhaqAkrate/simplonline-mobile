class BriefModal {
  String? id;
  String? title;
  String? duree;
  String? promo;
  String? description;
  String? image;

  BriefModal({
    this.title,
    this.description,
    this.duree,
    this.promo,
    this.image,
    this.id,
  });

  factory BriefModal.fromJson(Map<String, dynamic> json) => BriefModal(
        title: json["title"],
        description: json["description"],
        duree: json["duree"],
        promo: json["promo"],
        image: json["image"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "duree": duree,
        "promo": promo,
        "image": image,
        "id": id,
      };
}
