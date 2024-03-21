class ApiRsponse<T> {
  final T? data;
  final String? error;

  ApiRsponse({this.data, this.error});

  bool isSuccess() {
    return data != null;
  }
}
