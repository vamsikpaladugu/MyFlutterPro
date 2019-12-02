class Urls {
  static final String clientId =
      'f28eb5ef9b9bb7c4c422be5593d77be4545362807ffd420d8b7c06b622b38206';

  String photosRandom = 'https://api.unsplash.com/photos/random';
  static final String photos =
      'https://api.unsplash.com/photos/?client_id=$clientId&per_page=30';

  static final String users =
      'https://api.unsplash.com/collections/featured/?client_id=$clientId&per_page=30';

  static final String collectionUrl =
      'https://api.unsplash.com/search/photos/?client_id=$clientId&per_page=30&query=Flowers';

  static final String randomPhoto =
      'https://api.unsplash.com/photos/random/?client_id=$clientId&per_page=30&query=Flower';

  static final String searchURL =
      'https://api.unsplash.com/search/photos/?client_id=$clientId&per_page=30&query=';

  static final String baseURLCollection =
      'https://api.unsplash.com/collections/';

  static final String collectionPhotosEnd =
      '/photos/?client_id=$clientId&per_page=30';
}
