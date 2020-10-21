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

class Club {
  final String id;
  final String clubName;
  final String description;
  final String imageUrl;
  final President president;
  final VicePresident vicePresident;

  Club(this.id, this.clubName, this.description, this.imageUrl, this.president,
      this.vicePresident);
}
