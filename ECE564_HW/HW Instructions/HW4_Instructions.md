#  HW4 Instructions

Instructions

The main purpose of this homework is to persist your student information to storage so your list of people information goes from session to session.  You will also be adding Picture support and a few new Table functions.  Here is the list of capabilities to add in this homework:

As mentioned above, you need to be able to save and load your array of DukePerson so that it persists from session to session.  At a minimum you need to support JSONEncoder, but you may want to also support something different, which is fine.

.editmode/.EditingStyle Support.  On the Table View, enable the “Swipe left to Delete" function.  If the user swipes left and selects Delete, remove the entry from the table and the data model.

Search support. On the Table view, enable the search bar, then search/filter results on Table based on searching the firstName and lastName fields (/n parameter).

AppIcon support.  Create a nice AppIcon for your homework.

Picture support. If you have not done so, you need to be able to support pictures in this Homework.  At a minimum, this means:

Add an Image view to your Table Cell to show pictures in the Table View.

Add an Image view on the Information view for youself, the TAs and the Professor.

Add support for picking a picture from the camera roll to the Add view and the Edit view.

Add support for the picture property in the ECE564 protocol to your DukePerson (it is a String).  You can manage the picture how you want in DukePerson (.jpg into a UIImage, etc) but when it goes to JSON it needs to be a String of base64 encoding.  I will give you an example of this in class.  Make sure the picture is not too big – keep it at 100 dpi and no bigger than 2x2 inches. 
Rubric

In addition to the types of things mentioned in previous HW rubrics, make sure:

You test from both a new install and an existing install.  Apps have been known to crash after changes are made but a “fresh install” is not re-tested.
All fields from the Information view save correctly
All fields on the information get loaded correctly after saving.
Pictures don’t get skewed (I would use square pictures and square imageViews)
Ways to earn points towards full credit:

More complex Search.  You can search all fields, have multiple search fields, etc.
More options on the “Swipe Left” or “Swipe Right” of a table entry
=============

EXTRA CREDIT.  I will have some recorded lectures on using the Logon Framework and the ECE 564 Server.  If you want, you can try your hand at the following for Extra Credit (up to 10 more points):

Logon support – More info to follow but essentially you will integrate the Logon Framework into your code.  This will allow you to authenticate with the Duke system and get a block of data in return.  You need to save some of the fields coming back from the logon, including firstname, lastname, netid, and email.
Communications support – You will be using HTTP / REST to send your student information to a web server in the ECE 564 JSON Grammar.  You will also be able to get student info from the server.


