// Copyright (c) 2025 Fabrizio Guidotti
//
// This software is released under the MIT License.
// https://opensource.org/licenses/MIT

/// Error thrown when a process should terminate immediately.
final class PanicError extends Error {
  final String message;
  PanicError(this.message);

  @override
  String toString() => message;
}

/// Throws a [PanicError] with the given message.
Never panic(String message) => throw PanicError(message);

/// Returns a function that throws a [PanicError] with the given message when called.
Never Function() panicFn(String message) => () => throw PanicError(message);

/// Extension methods for any object.
extension LetExt<X> on X {
  /// Apply a function to this value and return the result.
  ///
  /// Similar to Kotlin's `let` function.
  J let<J>(J Function(X it) block) => block(this);
}

/// Extension methods for nullable objects.
extension WhenNullExt<X> on X? {
  /// Provides a default value when this is null.
  ///
  /// Returns this value if not null, otherwise returns the result of [block].
  X whenNull(X Function() block) => this != null ? this as X : block();
}
