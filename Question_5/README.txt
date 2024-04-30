This document contains my overall thoughts on the process of recreation of the video.

1st, I outlined what was happening in the video so I can form my peudo code from.

- Player says the word "frigo" in chat, centered at the players body.
- tornados will form a 4x4 diamond around the player, with the player at the center. It will look something like the following when all are active:
      1 
    1   1
  1   1   1 
1   1 p 1   1
  1   1   1 
    1   1
      1

- we can see there are 2 types of tornados:
- Large tornados, which spawn and animate for set duration seconds before fizzling out.
- small tornados, which spawn, animate for set duration, blink off for set duration, then repeat that twice more before despawning.
- This magic effect spawns the tornados at a slight delay, which we can see as follows(S is small, L is large, 0 is not spawned yet, p = player):

   stage 1:                 stage 2:                 stage 3:                 stage 4:
      S                        S                        S                        S
    0   L                    0   L                    L   L                    L   L
  0   0   S                S   S   S                S   S   S                S   S   S
L   0 p 0   L  |  ->  |  L   0 p 0   L  |  ->  |  L   L p L   L  |  ->  |  L   L p L   L
  0   0   S                S   0   S                S   0   S                S   S   S
    0   0                    L   L                    L   L                    L   L
      0                        0                        0                        S
      
- With This, we can see how we need to break up the spawn calls into groups.
- In terms of length, stage 4 begins around when stage 1 finishes their first animation cycle, which seems to be about 2 seconds based on the video

- From this, we can make our pseudo code so we can track down the calls we will need to do something like this:

void Frigo()
{
    timer variable = 0;
    if(spell flag != true) //so we only print once and we don't hold up game
    {
        access chat system
        print("Frigo")
        spell flag = true;
    }
    else
    {
        //assuming epsilon function for float comparison
        if(timer variable == start)
        {
            spawn first group;
        }
        else if (timer variable == first interval)
        {
            spawn second group;
        }
        else if (timer variable == second interval)
        {
            spawn third group;
        }
        else if (timer variable == third interval)
        {
            spawn fourth group;
        }
        else 
        {
            some way to check that all tornados have finished
            spell flag = false;
        }
    }
    
    remaining stuff for when spell finishes, etc
}

With this, we know what we need for this event.

To add our new, custom spell to the game, we need to modify the spells.xml file in the TFS folder, then write the associated LUA script called frigo.lua.
From here, we can get very close to the total shape.

Something that is odd, however, is when the player moves after casting the spell, we can get much closer to the original design.

However, I was unable to 100% recreate the given video. 
This is the following information I would need to finish the assignment:
-How to change the duration of spells 
-How to move the spells closer to the player without moving
-how to stagger the spawning of spell objects in a single script file.

The problem with aquiring this information is TFS and OTClient have negligible documentation, and with the abstraction between the LUA and the C++, I would have to scoure the source files, which stops being what this trial is about.
If I got blocked like this on a team project, I would make a point to reach out to more senior or knowledgeable teammates to point me in the right direction instead of wasting time trying to look for it myself.

In this folder, I also have the recordings of what my results look like, labled as such