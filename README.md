#   ECE564_HW 
This is the project you will use for all four of your ECE564 homework assignments. You need to download to your computer, add your code, and then add a repo under your own ID with this name ("ECE564_HW"). It is important that you use the same project name.  Any notes, additional functions, comments you want to share with the TA and I before grading please put in this file in the correspondiing section below.  Part of the grading is anything you did above and beyond the requirements, so make sure that is included here in the README.

## HW1

Most significantly, I spent quite a lot of time (and dove pretty deep into some more complicated swift code) in order to perform a search when the user gives only some input, and provide all Duke People matching that search in a compact and scrollable format. This means that the user could specify any one field (say, for example, Gender), and find all people matching that search parameter. This will also allow the user to specify no search parameters, press find, and print out all people. Furthermore, this method will allow the creation of people with possibly incomplete data in a safe manner. If, for instance, there were a person in the database for whom data was incomplete or unspecified, we wouldn't want to toss that person out altogether. Instead, we can safely add a person with the parameters we do know, and the resulting person will be searchable by those parameters. If we want to update a person for whom we have incomplete information, the add/update function will only replace the first instance of the closest search match. I don't know if my method for doing so is necessarily the most efficient, but safely handling all of the possible user input took a lot of troubleshooting with many layers of optionals. I also modified the Person and DukePerson classes in order to more safely and readably handle unspecified user input. 

As a note, I spent some time trying to implement a way by which multiple people with the same name but different properties could be added to the array, but after a few hours of effort determined that it would require the instantiation of a third button to be practical. Because the HW instructions specified two buttons, I opted not to pursue this extension.

Added a nicer, bolded Title UILabel, and spent time cleaning up each of the UI Elements and placing them in an even and consistent format. 

Changed the shownDescription to show each person in the registry matching a given search criteria. The find button will display each person in the scrollable shownDescription and the add/update button will show each person updated if multiple matching entries exist in the dukePeople array. 

Safely handled errors (first and last name are not entered, person is not found, etc.) and printed them clearly in the shownDescription UILabel

In Gender, DukeRole, and DukeProgram, because Swift implicitly assumes the case to be a string of itself if the enum is of type String, I got rid of the redundant strings.

I also placed Gender under the Person class, as this enumeration applies to all Person objects, and I placed DukeRole and DukeProgram under the DukePerson class, as these enumerations will only apply to Duke People. 

I added a Gender Non-Binary option for DukePerson objects, and implemented this accordingly in the UISegmentedControl. 

I placed each of the UI elements into setup functions to make the initialization and setup of the UI more readable, as well as to make the setup safer and allow for easer creation of a general "Person Lookup" application if the Duke specificity no longer becomes relevant. 


## HW2

Converted the project to SwiftUI

Added icon markers throughout, including to the Add Person modal view, the Basic Info section, the Duke Info section, the Personal Info section, the edit button, and each of the person type tabs in the main ListView

Added neutral descriptions that account for an absence of information about a particular person. 

Greyed out text to make clear to the user when elements were editable or not editable.

## HW3

Played around with some different ideas, but ultimately made a "playable" guitar in swiftui, with different animations when the guitar comes into the the scene and when the guitar moves after a user "strums" (i.e. swipes).

I wanted it to feel responsive, so while an earlier version of my animation used an explicit UIBezierPath to guide the music notes, in the final animation, I instantiated start and end locations with each DragGesture and used screen data to make music notes that mirror the user's swipe path once the user finishes swiping. Additionally, this way, forceful strums create more forceful movements of music notes, and lighter strums create lighter paths for music notes. 

I also played around quite a lot with SwiftUI to make sure that the guitar and music note lay on top of the scene but don't take the user out of the information screen. Because of this, all of the animation coordinates were significantly off and took many rounds of trial and error to produce a workable animation.

The guitar will also produce a sound with an AVAudioPlayer. This, I will note, was by far the hardest piece to get working. There doesn't seem to be much useful documentation on AVAudioPlayer and SwiftUI, and my computer kept producing an unhelpful error:

[plugin] AddInstanceForFactory: No factory registered for id <CFUUID 0x60000289b040> F8BB1C28-BAE8-11D6-9C31-00039315CD46

Eventually, I found that the source of the problem lied with the D_Chord.mov file I had recorded on my phone. There seemed to be multiple unanswered instances of this question online, so if someone else in the future tries to use audio with SwiftUI and runs into that problem, let them know it's a filetype error. 

## HW4

Made my own app icon in Photoshop

Implemented persistent storage––took some work to make it compliant with SwiftUI and ObservableObject.

Got a warning after I implemented shadows on the ListView and DetailView, but curiously after I reversed my changes the warning did not go away. I did some googling and it looks like it's a common warning given that SwiftUI is in beta, and it can pop up for any number of odd reasons. It didn't cause any issues with functionality or speed so I opted not to chase it any further.

Added the currently selected image in the edit view with an intuitive "plus" image that brings up the custom image picker view. This only saves when the person is saved. 
