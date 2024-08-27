class User {
  final int id;
  final String name;
  final String username;
  final String email;
  final Address address;
  final String phone;
  final String website;
  final Company company;
  User(this.username, this.email, this.address, this.phone, this.website,
      this.company,
      {required this.id, required this.name});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      json['username'],
      json['email'],
      Address(json['address']['suite'], json['address']['city'],
          json['address']['zipcode'],
          street: json['address']['street']),
      json['phone'],
      json['website'],
      Company(json['company']['catchPhrase'], json['company']['bs'],
          name: json['company']['name']),
      id: json['id'],
      name: json['name'],
    );
  }
}

class Address {
  final String street;
  final String suite;
  final String city;
  final String zipcode;
  Address(this.suite, this.city, this.zipcode, {required this.street});
}

class Geo {
  final String lat;
  final String lng;
  Geo(this.lng, {required this.lat});
}

class Company {
  final String name;
  final String catchPhrase;
  final String bs;
  Company(this.catchPhrase, this.bs, {required this.name});
}
