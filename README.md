# Mastermind
## A terminal based version of the classic code breaking game
### Set Up and Installation
##### Step 1.  Install the ruby gem colorize
This program relies on the ruby gem [colorize](https://github.com/fazibear/colorize) created by GitHub user fazibear. Please install this gem before attempting to run mastermind.

To do so, open your terminal and enter: `gem install colorize`

This will install the colorize gem and allow the mastermind program to properly display colored text.

##### Step 2.  Clone the mastermind repository to your computer
While viewing my [mastermind repository on GitHub](https://github.com/colinwarmstrong/mastermind), locate the green "clone or download" pulldown menu. Open the menu and copy the URL displayed in the "Clone with HTTPS" section.

Alternatively, I have provided the URL for you to copy here: `https://github.com/colinwarmstrong/mastermind.git`

After copying the URL, open your terminal and navigate to the directory where you want the cloned directory to be made.

In your terminal, type `git clone`, paste the copied URL and hit enter.  It should look like this: `git clone https://github.com/colinwarmstrong/mastermind.git`

This will clone the remote mastermind repository to your local directory.

### Running the Game

After installing the colorize gem and cloning the mastermind repository, make sure you are in the proper working directory and enter `ruby mastermind.rb`. This will start a new game of Mastermind.  Follow the given prompts to make your way through the game. Make sure your terminal is at least 74 columns wide to ensure the text is displayed properly.

### Game Instructions

Mastermind is a code breaking game. You will attempt to guess the correct sequence of a randomly generated code. Each element in the code is represented by a color and a position. You must correctly guess the color and position of every element. After each guess, the game will tell you how many of the guessed elements are the correct color and how many of the guessed elements are in the correct position. Using this feedback, you can make better and better guesses until you arrive at the correct sequence. A black 'X' in a feedback sequence indicates an invalid input.

### Good luck!
