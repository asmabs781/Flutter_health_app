class Liste {
  final String bgImage;
  final String icon;
  final String name;
  final String type;
  final String description;
  final List<String> images;

  // Constructeur avec validation
  Liste({
    required this.bgImage,
    required this.icon,
    required this.name,
    required this.type,

    required this.description,
    required this.images,
  }) : assert(images.isNotEmpty, 'The images list cannot be empty');

  // Méthode pour convertir un objet en JSON
  Map<String, dynamic> toJson() {
    return {
      'bgImage': bgImage,
      'icon': icon,
      'name': name,
      'type': type,
  
      'description': description,
      'images': images,
    };
  }

  // Méthode pour créer un objet Liste à partir d'un JSON
  factory Liste.fromJson(Map<String, dynamic> json) {
    return Liste(
      bgImage: json['bgImage'],
      icon: json['icon'],
      name: json['name'],
      type: json['type'],


      description: json['description'],
      images: List<String>.from(json['images']),
    );
  }

  // Méthode statique pour retourner une liste prédéfinie
  static List<Liste> section() {
    return [
      Liste(
        bgImage: 'assets/images/image2.3.webp',
        icon: 'assets/images/image2.3.webp',
        name: 'Heart Rate Monitor',

        description: 'Monitor your heart rate with real-time data.',
        images: ['assets/images/image2.3.webp'], 
        type: 'Heart Rate Monitor',
      ),
      Liste(
        bgImage: 'assets/images/coeur.webp',
        icon: 'assets/images/coeur.webp',
        name: 'Heart Health Check',
        type: 'Health',
        description: 'Keep track of your heart health.',
        images: ['assets/images/coeur.webp'],
      ),
      Liste(
        bgImage: 'assets/images/sprot.webp',
        icon: 'assets/images/sprot.webp',
        name: 'Sport',
        type: 'Physical Activity',
        description: 'Enhance your fitness with tailored activities.',
        images: ['assets/images/sprot.webp'],
      ),
      Liste(
        bgImage: 'assets/images/Daily.webp',
        icon: 'assets/images/Daily.webp',
        name: 'Daily',
        type: 'Routine',
        description: 'Maintain a balanced daily routine.',
        images: ['assets/images/Daily.webp'],
      ),
    ];
  }
}
