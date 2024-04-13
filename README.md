# WORDGEN

WORDGEN is a word search project that aims to save you in times of boredom. In addition to all the cognitive benefits that a word search already brings, it generates a random word search puzzle among 5 themes. You can add new themes and select specific themes as well.

## Getting Started

To use WORDGEN, follow these steps:

1. Install WORDGEN using Homebrew by running the following command in your terminal: `brew install wordgen`
2. Once installed, you can start using WORDGEN by running the command: `wordgen`

## Adding New Themes

You can easily add new themes to WORDGEN by creating a new text file. Here's how:

- Open your terminal.
- Once the terminal is open, navigate to your home directory by typing `cd ~` and pressing `Enter`.
- Next, navigate into the `.wordgen` directory by typing `cd .wordgen` and pressing `Enter`.
- Inside the `.wordgen` directory, navigate into the `Themes` directory by typing `cd Themes` and pressing `Enter`.
- Here, you can create text files for your themes by using the `touch` command. For example, to add a new theme named "Sports", type `touch Sports.txt` and press `Enter`.
- Open the created text file (e.g., `Sports.txt`) and add the sports-related words, each on a new line.

## Selecting Specific Themes

If you want to solve a word search puzzle based on a specific theme, you can select the theme when running the program.

1. When prompted to choose a theme, enter the name of the theme you want to use.
2. Enjoy solving word search puzzles related to your chosen theme!

## Note

Please note that if you only include very long words in the file, or if you include words longer than the size of the board, it may not be possible to create the game. For example, if you have an 11 by 11 board and only include words with more than 12 letters, it will not be possible to create the game.

## Contributing

Contributions to WORDGEN are welcome! If you have any ideas for improvement or new features, feel free to submit a pull request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

Thank you for using WORDGEN! We hope you enjoy solving word search puzzles and benefiting from the cognitive benefits it brings.

