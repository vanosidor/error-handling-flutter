abstract class HttpClient {
  Future<String> getResponseBody(String url);
}

class FakeHttpClient implements HttpClient {
  @override
  Future<String> getResponseBody(String url) async {
    await Future.delayed(Duration(seconds: 1));

    //! Http exception
    // throw HttpException('Http error 404');

    //! Format exception
    // return 'abc';

    // throw UnsupportedError('unsupported');

    return '{"userId":1, "id":1, "title":"test", "body":"Test body"}';
  }
}
