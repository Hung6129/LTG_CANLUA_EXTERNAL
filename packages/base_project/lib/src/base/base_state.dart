abstract class BaseState<T> {
  T init();

  T loading( T stateCurrent);
  
  T hideLoading(  T stateCurrent);

  T copyWith({
    required T stateChange,
  });
}
