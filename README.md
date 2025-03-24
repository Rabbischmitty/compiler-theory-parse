# Compiler-Theory-Parse
This repo contains code from a school project that asked us to modify a skeleton file of a parser using flex, bison, C++, and make as part of a study in compiler theory.

## Requirements
- Your favorite Linux distribution (I recommend Ubuntu for this project)
- Use `apt` or `yum` to get the packages for Flex, Bison, Make, and G++ (Use `sudo` to avoid permission issues)
- Create your desired directory for the files using `mkdir`
- Move source files to your chosen directory using `mv` or your personally prefered method
- Navigate to the directory with the source files and use `make` to compile the project
- Utilize the following syntax to run the program `./compile < test1.txt`

## Features Added
- Modified the grammar to include variables and literals of the real data type
- Added the `if statement` to the statement production in the grammar
- Allowed for zero or more `elsif clauses` represented in EBNF using braces
- Added recognition for `fold` functions
- Allowed for an optional, 0 or 1, variable declaration represented in EBNF using braces
- Added functionality for 0 or more parameter declarations in the function header represented in EBNF using braces
- Added functionality for the modulus and exponent binary operators
- Added functionality for the unary minus operator
- Added functionality for `|` and `!` operators

### Special Notes
- If you are modifying any of the files, you must run `make` to compile your new changes
- If you are modifying any `.cc` files, be sure to modify the corresponding `.h` files.
- You can initiate a coding environment using VS Code using the `code .` command.
- Included test cases can be accessed via the **tests** folder in the repo
