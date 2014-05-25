# Ruby Hangman
By [James Robinson](http://jayrob.in)

## Description
Hangman is a game for two players in which one player is the 'hangman' and the other is the 'guesser'.

At the start of the game, the hangman decides upon a secret word and draws out an underscore for each letter. The guesser then has to guess the word a letter each time, with each correct guess revealing any instances of that letter, and each incorrect guess using up a turn.

The game is over when either all letters are revealed, or all turns (commonly ten) are used up.

## How to play
1. Start the game in the terminal with command 'ruby hangman.rb' or './hangman.rb'
2. Type 'n' to start a new game (or 'l' to load a game)
3. Select the hangman to be either a human or computer player by typing 'h' or 'c'. If a human is the hangman, they should enter their name and the word
4. Select the guesser to be either a human or computer player
5. The guesser now must use their turns to unveil the word by typing a letter at a time

## Features
* Near-unbeatable computer player
* Auto-saving of each game
* Human v Human, Human v Computer, or Computer v Computer play
* ~50,000 word dictionary

## How does the AI work?
The AI has access to the the entire dictionary, which is constantly updated every turn to narrow down the possible words and select the most efficient letter choices.

1. At the start of the game, the AI will remove any words from the dictionary that do not contain an identical number of letters as the secret word
2. On the very first guess it will always guess 'e' as the most common letter regardless of word length
3. After a guess is made and the AI gets the 'word state' (e.g. '_e___ee_'), it will strip any word from the dictionary that doesn't meet the following criteria:
 * matches word state as a regular expression (e.g. 'candy' matches '_an__', 'cards' does not)
 * if the last guessed letter was correct, the word contains one or more instances of the last guessed letter
 * if the last guessed letter was incorrect, the word contains no instances of the last guessed letter
4. On all subsequent guesses, it will count the number of instances of each letter in the dictionary and choose the one with the highest frequency (always 'e'). This step is made more performant by joining the dictionary as a single, giant string and removing all instances of already used letters.