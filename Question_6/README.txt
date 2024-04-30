This document contains my overall thoughts on the process of recreation of the video.

1st, I outlined what was happening in the video so I can form my peudo code from.

- Player dashes forward a set distance or until they collide with terrain.
- Once the dash ends due to colliding with the environment, display text on the bottom of the screen, stating "you can't dash any further"
- The dash is broken up into segments when uninterupted
- The player is outlined in red while they dash.
- 4 semi-transparent players-models trail behind the player during the dash.
- The opacity of the "afterimages" decreases the further it is from the player, with the last, or the original player position being totally invisible
- From what I can see, the initial uninterupted dash is about 6 player lengths,
- Subsequent dashes are 2 additional players long. 3 Of these short dashes are done if not blocked by terrain.
- A full, uninterupted sequence is a total of 12 players long

From this, we can make our pseudo code. The unique challenge with this as opposed to the other problems is cleanly managing our resources when applying the effects.

void playerDash()
{
    if(button pressed)
    {
        Outline player in red.
        attempt to move forward 6 players of distance.
        if collision
            move as far as you can.
        for each space behind player, spawn sprite with decreasing opacity, with 5 behind being 0.
        
        if can move forward more, 
            repeat 3 times
                attempt to dash 2 spaces forward, moving trailing sprites with player
                
    }
}

I believe you could accomplish the red outline by utilizing some spell effect, and calling the related functions. 
If I had more time, I'd love to explore this sort of effect in a more easy to understand engine.


