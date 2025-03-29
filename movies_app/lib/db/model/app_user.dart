class AppUser {
  static const String collectionName = "users";
  String? id;
  String? name;
  String? email;
  String? phone;

  // db // api
  AppUser({
    this.id,
    this.email,
    this.name,
    this.phone,
  });

  AppUser.fromFireStore(Map<String, dynamic>? data)
      : this(
          id: data?["id"],
          email: data?["email"],
          name: data?["name"],
          phone: data?['phone'],
        );

  Map<String, dynamic> toFireStore() {
    return {
      "id": id,
      "name": name,
      "email": email,
      'phone': phone,
    };
  }
}
