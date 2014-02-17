Creates a bunch off random points and highlights them based on a mouseover event. 
First attempt at optimizing the mouseover: draw a bunch of larger rectangles and check if the mouse if inside any of those rectangles. If yes, go through all data points within that rectangle and see if the mouse is over any of those.

Search could be better. Instead of going through each rectangle in sequence, I could use a bisection rule based on the mouse x and y positions. 
You could also have successively smaller rectangles within a larger rectangles, dependent upon the density of points in a given rectangle region. 

Current setup involves point filling up the whole screen so the mapping from screen coordinates to plot coordinates is as super-duper straightforward. Need to edit the code to deal with the case where the plot area is just a subset of the screen coordinates.
 
