abstract class UseCase<T, P> {
  Future<T> call(P prompt);
}

abstract class UseCaseCreate<T, P> {
  Future<T> call(P prompt,P prompt2);
}
