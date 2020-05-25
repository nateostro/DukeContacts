#  HW2 Instructions

The goal of HW2 is  to get your first exposure of using Xcode to create an iOS app.  You will use the same ECE564_HW project as in HW1 as your base, but now you will be putting code in the project files.  You can reuse some of the code from the HW1 Playground by cutting and pasting it into your project Swift files.

 You will be creating an app for the "iPhone 8" Simulator - make sure this is the Device you choose as this is the Device we will grade on. I suggest adding a Swift file called something like "DataModel.swift" to store code associated with the Data Model  You will also need to add a file for the TableViewController.  The Views themselves will be created in a Storyboard.  You can use the existing "ViewController.swift" file for the logic to handle the Information View.

You will create a multi-view app that uses a Table View Controller on the first view we will call the Table view and a second view we will call the Information View.  HW2 introduces the concept of a storyboard – using the Xcode Interface Builder.  The Storyboard will just lay out flow using Navigation Controllers, Segues, etc.  The details:

Implement a Table View Controller as the first screen of your app.

Pre-populate the Table with hardcoded “Person” info.  At a minimum, have yourself, the Professor and the TA.

On the Table View, have an “Add” or “+” button on the Navigation Bar.

When “Add” is pressed on the Table View, present an Information view to add a new “Person” to the class.

Create a cell type for displaying the “Person” information.  This will be used to display the different people.  For now, you only need display an avatar image, the name of the person and the Person.description information in the cell.

Use a Section Header to divide the Persons into 3 Sections – Students, TAs, Professors.  NOTE:  Once Teams are formed, the Section Header for Students will change to your Team Name. 

When a “Person” cell is selected, show the Information View.  The Information View will contain full information about that Person.  Think of this as the layout from HW1 but WITHOUT the Add/Update and Find buttons, but WITH information included about Hobbies and Programming Languages.  NOTE:  Where we had "Grad/Undergrad/NA" in HW1 should now be an Input field for a String that can be anything.  The example below shows all text input fields but feel free to keep the Segment control or any others you already have from HW1.

In that space on the bottom of the screen, include space for an ImageView containing an avatar for now.  We will add Pictures in HW3.

The Information View needs to appear in “view mode” only – that is, the data cannot be edited. 

Make the rightBarButtonItem be “Edit”.  When pressed, the fields become Editable and the Button changes to “Save”.  When “Save” is pressed, the information about the Person described in the “First Name” and “Last Name” fields are updated accordingly.

The functions you removed do not go away – they are moved as follows:

The Output Label field with the Person.description information is moved to the Table View cell.  This would be smaller text under the Name.

The “Find” function will move to a Search bar on the Table View in HW3

The “Add/Update” function will move to a “Save” function as described above.

Compile, Run and Test your app on the iPhone 8 Simulator.



Rubric for HW3

To avoid losing points, make sure you test your app.  Here are some things to look out for:

Circular segues.  You will want to use an “unwind” segue to get back to the table view.  HINT:  You can give unique Identifiers to different unwind segues.
Poorly formatted text and images – make sure you maintain the aspect of any pictures / avatars.
Missing files, especially pictures, that don’t get copied up to GitLab.  Sometimes when you add files to a project it creates a link but does not copy the file into the folder.
Data model problems – index gets off when you Add so wrong data is displayed, fields don’t get properly initialized, etc. 
Information View allows editing when it should be in “view mode” and vice versa
Information gets added when it should have been updated, leaving 2 cells for same Person
Save / Cancel / Edit buttons don’t work as expected
Below are the ways to get additional function points in your grade:

Add a “Team” field to the Person information screen and to your data model.  This will be required later but if you want to do it now you can get additional points.  Team only applies to Students (not TAs or Professor) and you will need to search this field for displaying the teams on the Table View properly. 
Use of multiple type controls on the Information view (like a Picker control)
Creativeness in the design of your Table View and Cells.  For example, add pictures or multiple text fields.
Additional functions of your own creation
Clever code – a unique approach or algorithm
