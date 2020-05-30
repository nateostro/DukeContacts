#  HW3 Instructions

Instructions

The purpose of this Assignment is to have hands-on experience writing to some of the lower-level View and Layer functions – Drawing and Animation.  You use these capabilities when you want to fill a View with your own content – not just use the pre-made Views like a Table View or a Text View.  You will create the “flip side” of the Information View about yourself.  Much like a trading card, one side has your information, the other is a picture, but in this case the picture will be an animated scene of one of your Hobbies.  Here are the specifics:

Start from your last homework code base
Make your Information view a Page View Controller, where your existing Information View is the first View Controller and the new View will be on the second View Controller.  You may also consider using a Tab View Controller that shows "Front" and "Back" as the choices.
When you swipe the Page View to "flip" the view, the View will be replaced by a screen-sized Drawing you created.  Make sure swiping back works as well!
The Drawing MUST reflect something about one of the 3 hobbies you listed on your last homework Assignment.  Not following this will lead to loss of points.  For example, if “Soccer” was one of your Hobbies, then animating a soccer ball going through a goal would be perfect. 
Make sure that the Drawing of you only appears on the Information View about you!  Your code must detect if the current Person has a Drawing or not, and disable "flipping" if there is no associated Drawing.
Finally, the Drawing MUST contain the following elements:
A UIImage
A Graphic Context with VECTOR graphic drawing orders (like a Bezier curve, Rect, Ellipse, Path, etc.), NOT just an image.
Animation – using any of the various animation techniques, make something move in the view.
Rubric

Once again, anything mentioned in earlier homework that is applicable here can cause loss of points.  In addition:

Don’t use the same View Controller to remove the Information screen then add the Drawing screen.  You need to launch into a different View Controller
Make sure you test on the iPhone 8 simulator – that is what we will be grading on.
You need to ensure the drawing is related to one of the 3 hobbies you listed in earlier homework!  This is where we will look to ensure it is truly one of your hobbies.
Make sure you have a Drawing that is not overly simple - just drawing a box or a circle won’t cut it!
Don’t just copy something you find on the Internet.  You can look at examples in tutorials, etc to get ideas but do your own Drawing in your own code. 
Below are the ways to get full points:

The additional points will all be based on the overall Creativity / Complexity in the drawings– put some effort into the actual drawing itself. 
Complex vector graphics are great
Implicit layer animation is good
Explicit layer animation is great.
Add media – Audio, Video, Attributed Text are all good additions.
