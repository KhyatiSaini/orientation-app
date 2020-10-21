class President {
  final String id;
  final String name;
  final String imageUrl;

  President(this.id, this.name, this.imageUrl);
}

class VicePresident {
  final String id;
  final String name;
  final String imageUrl;

  VicePresident(this.id, this.name, this.imageUrl);
}

class Society{
  final String id;
  final String societyName;
  final String description;
  final String imageUrl;
  final President president;
  final VicePresident vicePresident;

  Society(this.id, this.societyName, this.description, this.imageUrl,
      this.president, this.vicePresident);
}
