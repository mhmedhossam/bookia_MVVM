class User {
  int? id;
  String? name;
  String? email;
  String? address;
  String? city;
  int? phone;
  bool? emailVerified;
  String? image;

  User({
    this.address,
    this.city,
    this.email,
    this.emailVerified,
    this.id,
    this.image,
    this.name,
    this.phone,
  });

  factory User.fromJson(json) {
    return User(
      address: json?["address"] as String?,
      city: json?["city"] as String?,
      email: json?["email"] as String?,
      emailVerified: json?["email_verified"] as bool?,
      id: json?["id"] as int?,
      image: json?["image"] as String?,
      name: json?["name"] as String?,
      phone: json?["phone"] as int?,
    );
  }
}
