class Picture {
  const Picture(
      {required this.id,
      required this.name,
      required this.autor,
      this.urlImage = '',
      this.description = '',
      this.bibliography = ''});
  final String id;
  final String name;
  final String autor;
  final String description;
  final String bibliography;
  final String urlImage;
}
