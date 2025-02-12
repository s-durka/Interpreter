setup:
# install GHC using ghcup:
`curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh`
# install the needed tools:
cabal install alex happy BNFC

--------------------------------------------- 
        ./build.sh
        ./Interpret <nazwa-pliku>
----------------------------------------------

Imperative language

Language description:

A language with a grammar similar to that of the Tiny BASIC language,
but with extended functionalities

> forced curly braces for if, else, while
e.g.

if (x > 0) { 
  x--; 
} else {
  return 0;
}

> no procedures or void, only functions returning int
> (it can be easily extended to allow functions to return bool and str as well,
>  but during the task discussion, Dr. Chrząszcz said that int is sufficient)

> one-dimensional arrays indexed by int 
  > requirement to specify the size at declaration, e.g.
  int[n] arr;
  arr[0] = arr[f(n)] + 3;

> blocks shadowing variable declarations, with declarations always at the top of the block, or without:

int main [int x = 0] {
  print x; # x == 0
  [int x] {
  x = 1;
  print x; # x == 1
  }
  print x; # x == 0
}

> "return" returns a result if called in a function and recursively breaks loops and blocks
while (i < n) {
  i = i + 1;
  if (i == 2) {
  return 0; # breaks the loop
  }
}

> programs in the form: <sequence of function declarations>, "main" block:
> (the presence of the main function is necessary)
int f(int x)  {
  return x;
}
main [int z]{
  z = 1;
  f(z);
}