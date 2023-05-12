class Picture {
  const Picture(
      {required this.id,
      required this.name,
      required this.autor,
      this.image = ''});
  final String id;
  final String name;
  final String autor;
  final String image;
}
