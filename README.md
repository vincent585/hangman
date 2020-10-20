# Hangman with serialization #

UI:
 - Game will be played in the command line. It will display a sequence of underscores equal to the length of the random word.
 - When a character is guessed, it will display a a new sequence, with the underscores replaced with the letters in their respective positions.
 - The number of incorrect guesses and previous guesses will also be displayed each round.

Inputs:
 - Reads from a dictionary file to select a random 5-12 character word
 - Each round, takes a single letter (a-z)

Outputs:
 - To start, displays underscores equal to the length of the random word
 - Upon receiving a correct letter, the sequence will be updated to reflect the correct letter and its position in the word
 - Displays incorrect guess count and the incorrect letters already guessed
 - Display game win or game lost depending on whether the word was guessed.

Necessary Steps:
 - Display instructions
 - Read from the dictionary file to select the word
 - display the underscores and prompt user for a letter
 - if correct, update the sequence to reflect the correct positions
 - if wrong, increment incorrect guess count and add to incorrect letters used
 - check if the word has been correctly guess or max guesses reached
 - if yes, end game
 - else repeat game loop


