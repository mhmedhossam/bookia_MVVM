class Data {
  int? id;
  String? name;
  String? email;
  String? address;
  String? city;
  String? phone;
  bool? emailVerified;
  String? image;

  Data({
    this.address,
    this.city,
    this.email,
    this.emailVerified,
    this.id,
    this.image,
    this.name,
    this.phone,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      address: json['address'],
      city: json['city'],
      phone: json['phone'],
      emailVerified: json['email_verified'],
      image: json['image'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'address': address,
      'city': city,
      'phone': phone,
      'email_verified': emailVerified,
      'image': image,
    };
  }
}
