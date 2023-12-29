# PokeDOS

Pokemon inspired game in Turbo Assembler.

## Description

PokeDOS is a tag game inspired by the Pokemon series with single and two player modes. The game was written in Trubo Assembler as a coursework assignment when learning about computer architectures.

## Getting Started

The easiest way to get started is using VSCode with the MASM/TASM extension.

### Setting up VSCode

1. Install the [MASM/TASM extension](https://marketplace.visualstudio.com/items?itemName=xsro.masm-tasm)
2. Under the extension settings ensure the following is selected:
   1. Assembler: TASM
   2. Emulator: DosBox

### Quickstart

In order to build and run the game as a single step:

1. Open the folder containing the code in VSCode.
2. Open the pokedos.asm source file.
3. Open the command pallette (Ctrl+Shift+P) and type 'Run ASM Code', press enter.



### Step by step compiling, linking and execution

1. Open the folder containing the code in VSCode.
2. Open the pokedos.asm source file.
3. Open the command palette (Ctrl+Shift+P) and type 'Open Emulator', press enter and wait for DosBox to load.
4. In DosBox, compile the ASM file into an object file:
```
tasm test
```
5. Link the object file into an executable:
```
tlink test
```
6. Execute the game:
```
test.exe
```   

## How to Play

### Two player mode

Selection screen key bindings:

* Left Arrow, Right Arrow - Change selected pokemon
* Enter - Confirm selection
* 1-4 - Select maze
* Esc - Back to main menu

Game controls (can be changed in the options menu):

* w,a,s,d - Player 1 up, left, down, right
* i,j,k,l - Player 2 up, left, down, right
* Esc - End game and back to main menu

Each player must try to reach the pokeball. When a player reaches the pokeball, it will "evolve" for 5 seconds (this time can be changed in the options menu) and will be able to defeat the other player by making contact with it. Game ends in 1 minute (also configurable) if no player has won.

### Single player mode (capture mode) - Experimental

Objective of the game is the same, but player 2 is computer controlled, see player 1 controls in two player mode. If a rare pokemon shows up and the player defeats it, it is captured and becomes playable.

> ### Disclaimer
> This game AI was developed as a best effort at the time and can be very slow at times when a loading indicator is shown and the game freezes while computing. Use at your own discretion.

### Easter Eggs and Cheat codes

Have fun finding them! Gotta catch 'em all.

## Authors

[Eduard Porta](https://github.com/Cfuzz)  
Joaquín Pérez Marco

## Version History

* 0.1
    * Original version with UI, code, and comments in Spanish.
* 0.2 (coming soon)
    * English UI, identifiers, and comments. Possibly other fixes and improvements.

## License

This project is licensed under the MIT License - see the LICENSE.md file for details
