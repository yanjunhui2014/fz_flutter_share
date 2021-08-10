typedef OnSuccess<T> = void Function(T response);
typedef OnFail = void Function(Exception e);

class NetCallback<T> {
  OnSuccess<T> onSuccess;
  OnFail onFail;

  NetCallback({this.onSuccess, this.onFail});
}


