class User {
  final int id;
  String nom;
  String prenom;
  String email;
  String filiere;
  final String password;

  User({
    required this.id,
    required this.nom,
    required this.prenom,
    required this.email,
    required this.filiere,
    required this.password,
  });
  String getProperty(String key) {
    switch (key) {
      case 'nom':
        return nom;
      case 'prenom':
        return prenom;
      case 'email':
        return email;
      case 'filiere':
        return filiere;
      default:
        throw Exception('Invalid property key: $key');
    }
  }
}
