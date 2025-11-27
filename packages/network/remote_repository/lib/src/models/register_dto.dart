class RegisterDto {
  final String name;
  final String email;
  final String password;

  RegisterDto({
    required this.email,
    required this.name,
    required this.password,
  });

  factory RegisterDto.fromJson(Map<String, dynamic> json) {
    return RegisterDto(
      email: json['email'],
      name: json['name'],
      password: json['password'],
    );
  }
}
