%option noyywrap
%{
#include <stdio.h>

int tokenCount = 0;
%}

%%

[a-zA-Z]+   { tokenCount++; }   // Match words
[0-9]+      { tokenCount++; }   // Match numbers
[ \t\n]     { }                  // Ignore whitespace characters
.           { tokenCount++; }    // Match any other character as a token

%%

int main(int argc, char** argv) {
    // Check for correct usage
    if (argc != 2) {
        printf("Usage: %s <input_file>\n", argv[0]);
        return 1;
    }

    // Open the input file
    FILE* inputFile = fopen(argv[1], "r");
    if (!inputFile) {
        perror("Error opening file");
        return 1;
    }

    // Set up Flex to read from the file instead of stdin
    yyin = inputFile;

    // Run the lexer
    yylex();

    // Close the file
    fclose(inputFile);

    // Print the token count
    printf("Token count: %d\n", tokenCount);

    return 0;
}
