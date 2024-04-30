This document contains my overall thoughts on the process of recreation of the video.

1st, I outlined what was happening in the video so I can form my peudo code from.

- We see a blank grey menu window. This menu contains a single button that moves to the left at a constant pace.
- Upon clicking on the button. The button will darken on reaction the being clicked, then jump to a different row.
- The row the button jumps to appears to be random
- This behavior repeats infinitely while this window is open.
- The behavior for being clicked is the same if the button reaches the left end of the screen without being clicked.
- The window appears to have 8 rows where the button can move to and slide on.

From this information, we can make our pseudo code:

void simpleWindow()
{
    Spawn window
    int curr = rand 1 through 8
    spawn button at row of value
    while(despawn condition)
    {
        if(click or button pos == edge)
        {
            button pos = rand (1 through 8, exclude curr);
        }
        else
        {
            button pos -= change dist;
        }
        
    }
    
    despawn window && button
    window cleanup;
    
}

My hangup on this is that there is no way programatically to move the buttons that I could find after days of searching the undocumented sourcecode.

Here is what my lua code would look like if this was a more realistic scenario where I could ask a teammate to fill me in on the function to do this.

Starting from gameinterface.lua

--globals:
myButton = nil
myBox = nil

inside the function show()
local callbackfunction = function()
    local val = math.random(7)
    local startingPos = {(totPixel/7)*val, 0}
    myButton:setPosition(startingPos)
    myBox:addButton(myButton)
    
    
  myBox = displayGeneralBox(tr('trial 7 window'), tr(''), {{text = tr('Jump!'), callback=callbackFunction},
  anchor=AnchorHorizontalCenter})
  myButton = myBox:addButton(tr('Jump!'), callbackFunction)
  myBox:setWidth(600)
  myBox:setHeight(600)


This is more or less the lua code you need to implement the window you want in the engine, if we assume that there is a function to get and set the position.