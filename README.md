# Dart Functional Programming Utilities

A lightweight library providing a small set of functional programming utilities for Dart. This is mainly a personal project, since I found myself writing the same utility functions over and over again. However, contributions and suggestions are welcome!

**Note**: The whole library is purposely implemented in a single file, to make it easy to copy and paste the code into your own project.

## Features

- **Error Handling**: `panic` and `panicFn` for. The main reason for this feature is a to enable the usage of `throw` as an expression. This mainly helps to go from this:

```dart
final foo = getFoo();
if (foo == null) {
  throw Exception("foo is null");
}

// or, more realistically, this:
final foo = getFoo() ?? (throw Exception("foo is null")); 
```

to this:

```dart
final foo = getFoo() ?? panic("foo is null");
```

- **Extension Methods**: Inspired by Kotlin's extension functions.
  - `let`: Apply a function to a value and return the result. (example: `foo.let((it) => it + 1)`). This is particularly useful for chaining operations without needing to create intermediate variables.
  - `whenNull`: For nullable values, execute a block if the value is null, returning the result of the block or the original value if not null.
  
## Installation

For now, the library is not published on pub.dev, so you need to add it as a git dependency. To do this, add the following to your package's `pubspec.yaml` file.  

```yaml
dependencies:
    benchmark: 
      git:
        url: https://github.com/FabrizioG202/functional.git
```

## License

MIT License. See the [LICENSE](LICENSE) file for details.
