class Client {
  String name;
  String phone;
  String email;
  String address;
  String cId;

  Client({this.name = '', this.phone = '', this.email = '', this.address = ''});

  @override
  String toString() {
    return 'Client{name: $name, phone: $phone, email: $email, address: $address}';
  }
}
