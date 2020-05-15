#  Homework 1 Instructions:

(From sakai.duke.edu):

The purpose of Homework 1 (HW1) is to get comfortable with writing Swift code in a simulated iOS environment.  We won’t be doing any compiling in this homework – the code will be written in the Xcode “Playground” – an interactive coding environment that runs the code real time.  We will be using the "Single View" Playground which enables us to create a simple UI using iOS objects. Here are your instructions for HW1 – follow them carefully to avoid deductions in grading:

In this first assignment, you are going to create a data model for the Students, TAs and Professor in this class.  This data model will be used to store information about each person in a "data base" using an Array.

You need to create your own object (class) for the data model.  You can call the class whatever you want, but for the purpose of this description we will call your class DukePerson. 

DukePerson must sub-class the Person class and support the additional properties of DukeRole and DukeProgram.  
Your DukePerson class must also support the CustomStringConvertible protocol.

Pre-populate your array of DukePerson objects, as you must have at least 3 entries in your array for us to test (although you can add as many others as you want):

Yourself
Me (I am from Chatham County, NC)
The TA (Ananjaya Tyagi.  She is an MS student from Delhi, India)

I also suggest you implement CustomStringConvertible in a way that the description property is actually the output string that you will print at the bottom.

Once you have your data model, you should create methods for adding a new entry in the "data base", updating an entry in the "data base" and searching for an entry in the "data base" using firstname AND lastname as the keys to match.

You then can create a UI that allows you to Add / Update and to Find.  These would be two buttons on the UI.  You also will have fields that allow for the input of the information.  

There will also be a Label field on the bottom which will act as an output field.

See the attached file for an example of what your user interface should look like.  You don't have to match this exactly but you are certainly welcome to.  

To use the Add / Update function, you would enter information in all the fields and then press the button.  You would first do a find - if there is a match then the old entry would be removed and the new entry would replace it.  If there is not a match, you would add the new entry to the "data base".  The output field would display "The person has been added" or "The person has been updated"

To use the Find function, you would first type in a First Name and Last Name and then press Find.  If there is no match, the output field would display "The person was not found".  If the person is found, the output field would display the description information about the user in sentence form (for example "Ric Telford is from Chatham County, NC.  He is a Professor")

