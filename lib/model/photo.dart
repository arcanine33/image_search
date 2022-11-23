class Photo {
  late int id;
  late String pageUrl;
  late String type;
  late String tags;
  late String photoviewUrl;
  late int previewWidth;
  late int previewHeight;
  late String webformatURL;
  late int webformatWidth;
  late int webformatHeight;
  late String largeImageURL;
  late String fullHDURL;
  late String imageURL;
  late int imageWidth;
  late int imageHeight;
  late int imageSize;
  late int views;
  late int downloads;
  late int likes;
  late int comments;
  late int user_id;
  late String user;
  late String userImageURL;
  late final String pageURL;
  late final String previewURL;
  late final int collections;
  late final int userId;

  Photo(
      this.id,
      this.pageUrl,
      this.type,
      this.tags,
      this.photoviewUrl,
      this.previewWidth,
      this.previewHeight,
      this.webformatURL,
      this.webformatWidth,
      this.webformatHeight,
      this.largeImageURL,
      this.fullHDURL,
      this.imageURL,
      this.imageWidth,
      this.imageHeight,
      this.imageSize,
      this.views,
      this.downloads,
      this.likes,
      this.comments,
      this.user_id,
      this.user,
      this.userImageURL,
      this.collections,
      this.pageURL,
      this.previewURL,
      this.userId,
      );

  Photo.fromJson(Map<String, dynamic> json){
    id = json['id'];
    pageURL = json['pageURL'];
    type = json['type'];
    tags = json['tags'];
    previewURL = json['previewURL'];
    previewWidth = json['previewWidth'];
    previewHeight = json['previewHeight'];
    webformatURL = json['webformatURL'];
    webformatWidth = json['webformatWidth'];
    webformatHeight = json['webformatHeight'];
    largeImageURL = json['largeImageURL'];
    imageWidth = json['imageWidth'];
    imageHeight = json['imageHeight'];
    imageSize = json['imageSize'];
    views = json['views'];
    downloads = json['downloads'];
    collections = json['collections'];
    likes = json['likes'];
    comments = json['comments'];
    userId = json['user_id'];
    user = json['user'];
    userImageURL = json['userImageURL'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['pageURL'] = pageURL;
    _data['type'] = type;
    _data['tags'] = tags;
    _data['previewURL'] = previewURL;
    _data['previewWidth'] = previewWidth;
    _data['previewHeight'] = previewHeight;
    _data['webformatURL'] = webformatURL;
    _data['webformatWidth'] = webformatWidth;
    _data['webformatHeight'] = webformatHeight;
    _data['largeImageURL'] = largeImageURL;
    _data['imageWidth'] = imageWidth;
    _data['imageHeight'] = imageHeight;
    _data['imageSize'] = imageSize;
    _data['views'] = views;
    _data['downloads'] = downloads;
    _data['collections'] = collections;
    _data['likes'] = likes;
    _data['comments'] = comments;
    _data['user_id'] = userId;
    _data['user'] = user;
    _data['userImageURL'] = userImageURL;
    return _data;
  }
}