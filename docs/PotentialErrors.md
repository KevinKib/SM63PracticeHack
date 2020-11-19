# Potential Sources of Errors

This document repertories some sources of mistakes which can be hard to detect, due to weird behavior from either AS3 or FFDec.

- Declaring variables inside a loop, such as `for (var i = 0; i < 6; i++)` does not work.
  - Instead, separate the definition and the loop into two lines: `var i = 0; for (i = 0; i < 6; i++)`.
