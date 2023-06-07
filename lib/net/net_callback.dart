typedef OnSuccess<T> = void Function(T response);
typedef OnFail = void Function(Exception e);

class NetCallback<T> {
  OnSuccess<T> onSuccess;
  OnFail onFail;

  NetCallback({required this.onSuccess, required this.onFail});
}


