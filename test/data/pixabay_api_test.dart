import 'package:flutter_test/flutter_test.dart';
import 'package:image_search_clean/data/pixabay_api.dart';

void main () {
  test('픽사베이 데터를 가져와야 한다', () async {
    final api = PixabayApi();

    final result = await api.fetch('iphone');

    expect(result.first.id, 2681039);
  });
}