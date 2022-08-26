class Photo {
  num? id;
  String? pageURL;
  String? type;
  String? tags;
  String? previewURL;
  num? previewWidth;
  num? previewHeight;
  String? webformatURL;
  num? webformatWidth;
  num? webformatHeight;
  String? largeImageURL;
  num? imageWidth;
  num? imageHeight;
  num? imageSize;
  num? views;
  num? downloads;
  num? collections;
  num? likes;
  num? comments;
  num? userId;
  String? user;
  String? userImageURL;

  Photo({
    this.id,
    this.pageURL,
    this.type,
    this.tags,
    this.previewURL,
    this.previewWidth,
    this.previewHeight,
    this.webformatURL,
    this.webformatWidth,
    this.webformatHeight,
    this.largeImageURL,
    this.imageWidth,
    this.imageHeight,
    this.imageSize,
    this.views,
    this.downloads,
    this.collections,
    this.likes,
    this.comments,
    this.userId,
    this.user,
    this.userImageURL,
  });

  Photo.fromJson(Map<String, dynamic> json) {
    id = json['id'] as num?;
    pageURL = json['pageURL'] as String?;
    type = json['type'] as String?;
    tags = json['tags'] as String?;
    previewURL = json['previewURL'] as String?;
    previewWidth = json['previewWidth'] as num?;
    previewHeight = json['previewHeight'] as num?;
    webformatURL = json['webformatURL'] as String?;
    webformatWidth = json['webformatWidth'] as num?;
    webformatHeight = json['webformatHeight'] as num?;
    largeImageURL = json['largeImageURL'] as String?;
    imageWidth = json['imageWidth'] as num?;
    imageHeight = json['imageHeight'] as num?;
    imageSize = json['imageSize'] as num?;
    views = json['views'] as num?;
    downloads = json['downloads'] as num?;
    collections = json['collections'] as num?;
    likes = json['likes'] as num?;
    comments = json['comments'] as num?;
    userId = json['user_id'] as num?;
    user = json['user'] as String?;
    userImageURL = json['userImageURL'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['pageURL'] = pageURL;
    json['type'] = type;
    json['tags'] = tags;
    json['previewURL'] = previewURL;
    json['previewWidth'] = previewWidth;
    json['previewHeight'] = previewHeight;
    json['webformatURL'] = webformatURL;
    json['webformatWidth'] = webformatWidth;
    json['webformatHeight'] = webformatHeight;
    json['largeImageURL'] = largeImageURL;
    json['imageWidth'] = imageWidth;
    json['imageHeight'] = imageHeight;
    json['imageSize'] = imageSize;
    json['views'] = views;
    json['downloads'] = downloads;
    json['collections'] = collections;
    json['likes'] = likes;
    json['comments'] = comments;
    json['user_id'] = userId;
    json['user'] = user;
    json['userImageURL'] = userImageURL;
    return json;
  }
}