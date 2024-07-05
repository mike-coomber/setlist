class ServerError extends Error {
  final String message;

  ServerError(this.message);

  @override
  String toString() => message;
}

class DataNotFoundError extends Error {}
