class Analytics {
  final int _totalRegisteredTutors;
  final int _totalTutorsRegisteredToday;
  final int _totalRegisteredPets;
  final int _totalPetsRegisteredToday;
  final int _totalRegisteredPetPhotos;
  final int _totalPetPhotosRegisteredToday;

  Analytics(
    this._totalRegisteredTutors,
    this._totalTutorsRegisteredToday,
    this._totalRegisteredPets,
    this._totalPetsRegisteredToday,
    this._totalRegisteredPetPhotos,
    this._totalPetPhotosRegisteredToday,
  );

  int get totalRegisteredTutors{
    return this._totalRegisteredTutors;
  }

  int get totalTutorsRegisteredToday{
    return this._totalTutorsRegisteredToday;
  }

  int get totalRegisteredPets{
    return this._totalRegisteredPets;
  }

  int get totalPetsRegisteredToday{
    return this._totalPetsRegisteredToday;
  }

  int get totalRegisteredPetPhotos{
    return this._totalRegisteredPetPhotos;
  }

  int get totalPetPhotosRegisteredToday{
    return this._totalPetPhotosRegisteredToday;
  }

  static Analytics fromJson(json){
    var totalRegisteredTutors = json['totalRegisteredTutors'] ?? 0;
    var totalTutorsRegisteredToday = json['totalTutorsRegisteredToday'] ?? 0;
    var totalRegisteredPets = json['totalRegisteredPets'] ?? 0;
    var totalPetsRegisteredToday = json['totalPetsRegisteredToday'] ?? 0;
    var totalRegisteredPetPhotos = json['totalRegisteredPetPhotos'] ?? 0;
    var totalPetPhotosRegisteredToday = json['totalPetPhotosRegisteredToday'] ?? 0;
   
    return Analytics(
      totalRegisteredTutors, 
      totalTutorsRegisteredToday, 
      totalRegisteredPets, 
      totalPetsRegisteredToday, 
      totalRegisteredPetPhotos, 
      totalPetPhotosRegisteredToday,
    );
  }

}
