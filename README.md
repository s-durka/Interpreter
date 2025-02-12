# Imperative Language TinyPlus  

## Setup

### Install GHC using `ghcup`:
```sh
curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh
```

### Install the needed tools:
```sh
cabal install alex happy BNFC
```

## Build and Run
```sh
./build.sh
./Interpret <filename>
```

---

## Language Description

An imperative language with a grammar similar to C and the [Tiny BASIC](https://en.wikipedia.org/wiki/Tiny_BASIC) language with modifications including:

- **Division into declarations and instructions in a block**, similar to the Tiny BASIC language.
- **Forced curly braces** for `if`, `else`, and `while` statements.

### Example:
```c
if (x > 0) {
  x--;
} else {
  return 0;
}
```

### Key Features:

- **No procedures or void functions**, only functions returning `int`.
  - (Can be extended to allow `bool` and `str` return types, but `int` is sufficient as per Dr. Chrząszcz.)
- **One-dimensional arrays indexed by `int`**
  - Requires size specification at declaration.
  
  Example:
  ```c
  int[n] arr;
  arr[0] = arr[f(n)] + 3;
  ```
- **Block scope variable shadowing**, with optional declarations at the top of the block.
  
  Example:
  ```c
  int main [int x = 0] {
    print x; // x == 0
    [int x] {
      x = 1;
      print x; // x == 1
    }
    print x; // x == 0
  }
  ```
- **`return` statement behavior:**
  - Returns a result in a function.
  - Recursively breaks loops and blocks.
  
  Example:
  ```c
  while (i < n) {
    i = i + 1;
    if (i == 2) {
      return 0; // Breaks the loop
    }
  }
  ```
- **Program structure:**
  - A sequence of function declarations.
  - A mandatory `main` function.
  
  Example:
  ```c
  int f(int x) {
    return x;
  }
  
  main [int z] {
    z = 1;
    f(z);
  }
  ```

