/*
This is a comment block. It won't be read as an Ink story.
Comments are very useful for leaving ideas for story and functionalty

This exercise will demonstrate the following in the example video:
 - Variable types: integer, float, boolean
 - Variable assignment
 - Printing variables
 - Variable checking
 
 In the assignment:
 - Add four more knots
 - Assign at least TWO new variables through player choices
 - Print at least one of the variables to the player in a passage
 - Check the value of a variable and have it do something
*/

VAR myNumber = 5
VAR dragon_eggy = "" 
VAR torches = 0 

-> cave_mouth

== cave_mouth ==
{pockets_full: You are back at the entrance to the cave. | You are at the enterance to a cave. {not torch_pickup:There is a torch on the floor.} The cave extends to the east and west.}



+ [Take the east tunnel] -> east_tunnel
+ [Take the west tunnel] -> west_tunnel
* [Pick up the torch] -> torch_pickup

== east_tunnel ==
You are in the east tunnel. It is very dark, you can't see anything.
* {torches > 0} [Light Torch] -> east_tunnel_lit
+ [Go Back] -> cave_mouth
-> END

== west_tunnel ==
You are in the west. This isnt the way.
+ [Go Back] -> cave_mouth
-> END

=== torch_pickup ===
~ torches = torches + 1
You now have {torches} torches . May it light the way.
* [Go Back] -> cave_mouth
-> END

== east_tunnel_lit ==
The light of your torch glints off of {coins_gone: the walls | the thousands of coins in the room.}
* [pick up coins] -> pockets_full
+ [ continue further ] -> further_east 
-> END

== pockets_full == 
You've filled your pockets. Your pants are really heavy. 
* [ go back ] -> coins_gone
-> END

== coins_gone == 
You're back in the east tunnel, but it is now empty. The tunnel continues east. 
+ [continue east] -> further_east
+ [ go back] -> cave_mouth

== further_east == 
You continue on, as you move forward the room starts to feel warm. 
+ [go back] -> east_tunnel_lit
* [peek around the corner] -> dragon_lair
-> END

== dragon_lair == 
You peek the corner and you see a large sleeping beast. You've never seen one before but by your best guess you figure it is probably a dragon. Something is glinting behind the sleeping dragon. 
* [investigate shiny] -> dragon_egg 
+ [run away] -> scared
-> END

== scared == 
Youve made it back to the mouth of the cave. You wont be telling any brave stories any time soon, but you will be alive. 
-> END


== dragon_egg == 
As you slowly approach the rear of the dragon, you are able to make out the shape of a large shiny egg resting in a large nest made of coins. 
* [take the egg] -> you_have_the_egg
* [trip] -> death
-> END

-> memory

== memory == 
As you continue out of the cave you realize you're lonely. Might as well name the dragon egg so that you have a companion...

* [eggy] 
 ~ dragon_eggy = "eggy" 
 -> winner
* [finster] 
~  dragon_eggy = "finster"
-> winner
* [M'lady] 
~ dragon_eggy = "M'lady"
-> winner
-> END


== you_have_the_egg == 
You were able to grab the oversized egg. It is so heavy but you are able to carry it while also holding the torch. 
+ [ go back] -> memory
-> END

== death == 
You tripped. Somehow. The dragon woke up and ate you alive. 
-> END 

== winner == 
You've made it out of the cave with the dragon egg! Time to make it to town and get rich with the help of {dragon_eggy}.
{dragon_eggy == "eggy": you and eggy live a wonderful life together} 
{dragon_eggy == "finster" : Finster cheats on you later in life but you stay with him. Your life is long and sorrowful. } 
{dragon_eggy == "M'lady" : You and M'lady get divorced. She took the kids and all of your money. } 
-> END

















