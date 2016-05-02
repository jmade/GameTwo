
## Game Two

 This project was really my first attempt at using the `SpriteKit` framework and the painstaking process of creating and using pixel art to make animations with characters.
 
 ![Alt Text](https://github.com/jmade/jmade.github.io/blob/master/walking-tresure.gif?raw=true)
 
 
- In its current implementation it is displayed in a BirdsEye view perspective, like tactical games. 
- The user can walk around with on screen controls.
- You can open a Treasure Chest, collide with the walls, enter stairs, and NPC via physics boundries.
- Entering the staircase will load another level.

 ![Alt Text](https://github.com/jmade/jmade.github.io/blob/master/stairs.gif?raw=true)

## Alpha Game Two
 
 The original version of this was a strict 2-D topdown view, I used free art assets to make charaters.
 
 *Bonus Points if you can find out what to uncomment and change to bring that back ;)*
 
 I was able to create random characters using a `.PLIST` file that held values for the types of assest a character could have, male, female, hair, helmet, sword, etc.
 
 the process the make these random characters was to splice the full sheets of animations into small squares that could be stacked on top of one another ( kinda like a flipbook and paper dolls) in order to make the animations like walking in the different directions. that was a fun challenge and would produce interesting results, I utilized some `CoreGraphics` frameworks, randomly selected the sheets of for the character, stacked layers, then saved to a `UIImage` in order to be used as textures for the sprites. 
 
## Reflections
 
 Working with the `SpriteKit` framework and the "game loop" approach really made utilize and relearn some Math and Geometry topics, which led me to: procedural generation, noise, randomization, Path finding, map building.
 
 
 
 
