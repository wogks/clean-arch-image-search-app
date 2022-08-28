import 'package:flutter_test/flutter_test.dart';
import 'package:image_search_clean/data/photo_repository_api.dart';
import 'package:image_search_clean/model/photo.dart';
import 'package:image_search_clean/ui/widget/home_view_model.dart';

void main() {
  test('stream이 잘 되야함', () async {
    final viewModel = HomeViewModel(FakePhotoApi());
    final result = equals(fake.map((e) => Photo.fromJson(e)).toList());

    await viewModel.fetch('apple');
    await viewModel.fetch('iphone');
    expect(
      viewModel.photoStream,
      emitsInOrder(
        [
          equals([]),
          // equals(fake.map((e) => Photo.fromJson(e)).toList()),
          // equals(fake.map((e) => Photo.fromJson(e)).toList()),
          isA<List<Photo>>(),
        ],
      ),
    );
  });
}

class FakePhotoApi extends PhotoApiRepository {
  @override
  Future<List<Photo>> fetch(String query) async {
    Future.delayed(const Duration(milliseconds: 500));
    return fake.map((e) => Photo.fromJson(e)).toList();
  }
}

List<Map<String, dynamic>> fake = [
  {
    "id": 2681039,
    "pageURL":
        "https://pixabay.com/photos/phone-wallpaper-watercolor-painting-2681039/",
    "type": "photo",
    "tags": "phone wallpaper, watercolor, painting",
    "previewURL":
        "https://cdn.pixabay.com/photo/2017/08/25/18/48/watercolor-2681039_150.jpg",
    "previewWidth": 99,
    "previewHeight": 150,
    "webformatURL":
        "https://pixabay.com/get/g6880eec04c02ec728786315fa1686a4c068268c6f0be932ac284e0159d10e9581525ab51def9dee8e72e4875205fd23e30aaf53bbc4f373f1079dd3e5c3ab8e6_640.jpg",
    "webformatWidth": 424,
    "webformatHeight": 640,
    "largeImageURL":
        "https://pixabay.com/get/gbd2213dc0dbf39d43d15a0a66652b8b15c3aaf75c1be09f695ed227d7739bafc2dd7b10a37edd6893937c6e905bbff0ff4f0fbdc17a2f2645ae5a1ba342e4c5b_1280.jpg",
    "imageWidth": 3264,
    "imageHeight": 4928,
    "imageSize": 5021313,
    "views": 936254,
    "downloads": 720357,
    "collections": 1828,
    "likes": 1162,
    "comments": 120,
    "user_id": 4894494,
    "user": "eluela31",
    "userImageURL":
        "https://cdn.pixabay.com/user/2017/04/24/19-55-29-652_250x250.jpg"
  },
  {
    "id": 1599527,
    "pageURL":
        "https://pixabay.com/photos/phone-wallpaper-mystery-island-1599527/",
    "type": "photo",
    "tags": "phone wallpaper, mystery, island",
    "previewURL":
        "https://cdn.pixabay.com/photo/2016/08/17/01/39/mystery-1599527_150.jpg",
    "previewWidth": 116,
    "previewHeight": 150,
    "webformatURL":
        "https://pixabay.com/get/g88124997e43d5bd72d2e85280146878a39a36b66b483ea13a052db81c7b34ba1e8c421fdadfaccfbfac30c378b79a88f77f2d8e8620f69c2008e644f0542e2c2_640.jpg",
    "webformatWidth": 495,
    "webformatHeight": 640,
    "largeImageURL":
        "https://pixabay.com/get/g724a45998367f7efae3f813b9e3701c52e64301df025a7c7a4aa386713efd4e48233fef15644231350136290a830b0b3fbb3334f98bdc764df20e86fa08af72e_1280.jpg",
    "imageWidth": 3022,
    "imageHeight": 3907,
    "imageSize": 3563541,
    "views": 619218,
    "downloads": 314812,
    "collections": 1341,
    "likes": 1296,
    "comments": 153,
    "user_id": 2633886,
    "user": "intographics",
    "userImageURL":
        "https://cdn.pixabay.com/user/2019/02/11/15-00-48-80_250x250.jpg"
  }
];
