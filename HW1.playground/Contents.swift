//: This is the playground file to use for submitting HW1.  You will add your code where noted below.  Make sure you only put the code required at load time in the ``loadView()`` method.  Other code should be set up as additional methods (such as the code called when a button is pressed).
  
import UIKit
import PlaygroundSupport

// MARK: Person and DukePerson Classes

class Person : CustomStringConvertible {
    var firstName : String = ""
    var lastName : String = ""
    var whereFrom : String = ""
    var gender : Gender = .NonBinary
    enum Gender : String {
        case Male
        case Female
        case NonBinary
        case Unspecified
    }
    init() {}
    init(firstName: String, lastName: String, gender: Gender, whereFrom: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.gender = gender
        self.whereFrom = whereFrom
    }
    var description: String {
        // Because first name and last name are required by the add function, both are assumed to not be empty.
        // This description safely handles whereFrom and Gender because they are not required by my modified creation of a new person, thus incorporating intentionally incomplete information.
        return "\(firstName) \(lastName) is from "
        + (whereFrom != "" ? "\(whereFrom)." : "an unknown place.")
    }
}

class DukePerson : Person {
    enum DukeProgram : String {
        case Undergrad
        case Grad
        case NA
        case Unspecified
    }
    enum DukeRole : String {
        case Student
        case Professor
        case TA
        case Unspecified
    }
    var dukeRole : DukeRole = .Student
    var dukeProgram : DukeProgram = .NA
    override init() {
        super.init()
    }
    init(firstName: String, lastName: String, gender: Gender, whereFrom: String, role: DukeRole, program: DukeProgram){
        self.dukeRole = role
        self.dukeProgram = program
        super.init(firstName: firstName, lastName: lastName, gender: gender, whereFrom: whereFrom)
    }
    override var description: String {
        var genderDescription : String
        switch gender {
        case .Female:
            genderDescription = " She is"
        case .Male:
            genderDescription = " He is"
        default:
            genderDescription = " They are"
        }
        // This description safely handles unspecified roles and makes the description output accurate no matter the input.
        return (super.description
                + genderDescription
                + (dukeRole.rawValue == "Unspecified" ? " at Duke in an unspecified role." : " a " + dukeRole.rawValue + "."))
    }
}


class HW1ViewController : UIViewController, UITextFieldDelegate {
        
    // MARK: Array dukePeople Initially Populated:

    var dukePeople : [DukePerson] = [
        DukePerson(firstName: "Richard", lastName: "Telford", gender: .Male, whereFrom: "Chatham County, NC", role: .Professor, program: .NA),
        DukePerson(firstName: "Ananjaya", lastName: "Tyagi", gender: .Female, whereFrom: "Delhi, India", role: .TA, program: .Grad),
        DukePerson(firstName: "Nathan", lastName: "Ostrowski", gender: .Male, whereFrom: "Charlotte, NC", role: .Student, program: .Undergrad)
    ]
        
    // MARK: All Subviews Initialized
    
    let hwTitle = UILabel()
    let dukeLookupTitle = UILabel()
    let firstNameLabel = UILabel()
    let lastNameLabel = UILabel()
    let whereFromLabel = UILabel()
    let shownDescription = UITextView()
    
    let firstNameField = UITextField()
    let lastNameField = UITextField()
    let whereFromField = UITextField()
    
    let genderControl = UISegmentedControl(items:
        ["Male", "Female", "NonBinary"])
    let roleControl = UISegmentedControl(items:
        ["Professor", "Student", "TA"])
    let programControl = UISegmentedControl(items:
        ["Undergrad", "Grad", "NA"])
    
    let addUpdateButton = UIButton(type: .system)
    let findButton = UIButton(type:
        .system)
    
    // MARK: All Subview Setup Functions Called
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Sets Up All Labels
        setupHwLabel(hwTitle)
        setupDukeLookupTitle(dukeLookupTitle)
        setupFirstNameLabel(firstNameLabel)
        setupLastNameLabel(lastNameLabel)
        setupWhereFromLabel(whereFromLabel)
        setupShownDescripton(shownDescription)
        
        // Sets Up All Text Fields
        setupFirstNameField(firstNameField)
        setupLastNameField(lastNameField)
        setupWhereFromField(whereFromField)
        
        // Sets Up All Controls
        setupGenderControl(genderControl)
        setupRoleControl(roleControl)
        setupProgramControl(programControl)
        
        // Sets Up All Buttons
        setupAddUpdateButton(addUpdateButton)
        addUpdateButton.addTarget(self, action: #selector(self.addUpdateButtonTapped(_:)), for: .touchUpInside)
        setupFindButton(findButton)
        findButton.addTarget(self, action: #selector(self.findButtonTapped(_:)), for: .touchUpInside)

    }

    // MARK: All Subview Setup Functions Created
        
    // HWLabel Subview Setup Function
    
    func setupHwLabel(_ hwLabel: UILabel){
        hwLabel.frame = CGRect(x: 0, y: 10, width: 190, height: 20)
        hwLabel.center.x = view.center.x
        hwLabel.text = "ECE 564 Homework One"
        hwLabel.textColor = .black
        view.addSubview(hwLabel)
    }
        
    // Title Subview Setup Function
    
    func setupDukeLookupTitle(_ dukeLookupTitle: UILabel){
        dukeLookupTitle.frame = CGRect(x: 0, y: 45, width: 240, height: 41)
        dukeLookupTitle.center.x = view.center.x
        dukeLookupTitle.text = "Duke Lookup"
        dukeLookupTitle.font = UIFont.boldSystemFont(ofSize: 40.0)
        dukeLookupTitle.textColor = .black
        view.addSubview(dukeLookupTitle)
    }
        
    // FirstNameLabel Subview Setup Function
    
    func setupFirstNameLabel(_ firstNameLabel: UILabel){
        firstNameLabel.frame = CGRect(x: 40, y: 120, width: 88, height: 21)
        firstNameLabel.text = "First Name:"
        firstNameLabel.textColor = .black
        view.addSubview(firstNameLabel)
    }
        
    // FirstNameField Subview Setup Function
    
    func setupFirstNameField(_ firstNameField: UITextField){
        firstNameField.frame = CGRect(x: 200, y: 114, width: 144, height: 34)
        firstNameField.text = ""
        firstNameField.textColor = .black
        firstNameField.borderStyle = UITextField.BorderStyle.roundedRect
        view.addSubview(firstNameField)
    }
        
    // LastNameLabel Subview Setup Function
        
    func setupLastNameLabel(_ lastNameLabel: UILabel){
        lastNameLabel.frame = CGRect(x: 40, y: 166, width: 87, height: 21)
        lastNameLabel.text = "Last Name:"
        lastNameLabel.textColor = .black
        view.addSubview(lastNameLabel)
    }

    // LastNameField Subview Setup Function
       
    func setupLastNameField(_ lastNameField: UITextField){
        lastNameField.frame = CGRect(x: 200, y: 160, width: 144, height: 34)
        lastNameField.text = ""
        lastNameField.textColor = .black
        lastNameField.borderStyle = UITextField.BorderStyle.roundedRect
        view.addSubview(lastNameField)
    }
        
    // WhereFromLabel Subview Setup Function
    
    func setupWhereFromLabel(_ whereFromLabel: UILabel){
        whereFromLabel.frame = CGRect(x: 40, y: 216, width: 44, height: 21)
        whereFromLabel.text = "From:"
        whereFromLabel.textColor = .black
        view.addSubview(whereFromLabel)
    }
        
    // WhereFromField Subview Setup Function
    
    func setupWhereFromField(_ whereFromField: UITextField){
        whereFromField.frame = CGRect(x: 200, y: 209, width: 144, height: 34)
        whereFromField.text = ""
        whereFromField.textColor = .black
        whereFromField.borderStyle = UITextField.BorderStyle.roundedRect
        view.addSubview(whereFromField)
    }
                
    // GenderControl Subview Setup Function
    
    func setupGenderControl(_ genderControl: UISegmentedControl){
        genderControl.frame = CGRect(x: 40, y: 267, width: 304, height: 32)
        genderControl.layer.cornerRadius = 5
        view.addSubview(genderControl)
    }

    // RoleControl Subview Setup Function
        
    func setupRoleControl(_ roleControl: UISegmentedControl){
        roleControl.frame = CGRect(x: 40, y: 317, width: 304, height: 32)
        roleControl.layer.cornerRadius = 5
        view.addSubview(roleControl)
    }
        
    // ProgramControl Subview Setup Function
        
    func setupProgramControl(_ programControl: UISegmentedControl){
        programControl.frame = CGRect(x: 40, y: 367, width: 304, height: 32)
        programControl.layer.cornerRadius = 5
        view.addSubview(programControl)
    }
        
    // AddUpdateButton Subview Setup Function
    
    func setupAddUpdateButton(_ addUpdateButton: UIButton){
        addUpdateButton.frame = CGRect.init(x: 40, y: 426, width: 144, height: 40)
        addUpdateButton.backgroundColor = .blue
        addUpdateButton.layer.cornerRadius = 5
        addUpdateButton.tintColor = .blue
        addUpdateButton.setTitle("Add / Update", for: .normal)
        addUpdateButton.setTitleColor(.white, for: .normal)
        view.addSubview(addUpdateButton)
    }
        
    // FindButton Subview Setup Function
        
    func setupFindButton(_ findButton: UIButton){
        findButton.frame = CGRect.init(x: 200, y: 426, width: 144, height: 40)
        findButton.backgroundColor = .blue
        findButton.layer.cornerRadius = 5
        findButton.tintColor = .blue
        findButton.setTitle("Find", for: .normal)
        findButton.setTitleColor(.white, for: .normal)
        view.addSubview(findButton)
    }
        
    // ShownDescription Subview Setup Function
    
    func setupShownDescripton(_ shownDescription: UITextView){
        shownDescription.isEditable = false
        shownDescription.textAlignment = NSTextAlignment.left
        shownDescription.frame = CGRect(x: 40, y: 490, width: 303, height: 140)
        shownDescription.layer.borderColor = .init(srgbRed: 0, green: 0, blue: 0, alpha: 255)
        shownDescription.layer.borderWidth = 2
        shownDescription.layer.cornerRadius = 5
        shownDescription.text = "Lookup results will display here."
        shownDescription.textColor = .black
        view.addSubview(shownDescription)
    }
        
    
    // MARK: View Actions

    @objc func addUpdateButtonTapped(_ sender: UIButton){
        
        // Finds all people matching any and all user-provided attributes.
            // If a matching DukePerson object exists, the first instance of DukePerson matching first name and last name in dukePeople is modified to match the current user input (rather than being taken out of the array and re-inserted).
            // If none exist, the function adds the DukePerson created by user input to the dukePeople array.
        // Then, updates shownDescription
        
        let person = getCurrentPerson()
        
        if person.firstName == "" || person.lastName == "" {
            shownDescription.text = "Please enter a valid first and last name to add a person."
        } else if let foundIndex = dukePeople.firstIndex(where: {$0.firstName == person.firstName && $0.lastName == person.lastName}){
            self.dukePeople.remove(at: foundIndex)
            self.dukePeople.append(person)
            shownDescription.text = "Person attributes changed. \n" + person.description
        } else {
            self.dukePeople.append(person)
            shownDescription.text = "New person added to Lookup. \n" + person.description
        }
    }
    

    @objc func findButtonTapped(_ sender: UIButton){
        
        // Finds all people matching current DukePerson specified by user.
        // If no people are found, stops and lets the user know.
        let searchResults = searchDukePeople()
        if searchResults!.isEmpty {
            shownDescription.text = "Error: No person found with those attributes"
            return
        }
        
        // Updates shownDescription, adding each person matching the query
        var totalDescription = ""
        for dukePerson in searchResults! {
            totalDescription += (dukePerson.description + " \n\n")
        }
        shownDescription.text = totalDescription
        
    }
    
    func getCurrentPerson() -> DukePerson {
        // Assigns each user input element to a variable. If none is found, it safely assigns each to "" or .Unspecified.
        let firstName = firstNameField.text ?? ""
        let lastName = lastNameField.text ?? ""
        let gender =
            genderControl.selectedSegmentIndex != UISegmentedControl.noSegment ?
                Person.Gender(rawValue: genderControl.titleForSegment(at: genderControl.selectedSegmentIndex)!)! :
                Person.Gender.Unspecified
        let whereFrom = whereFromField.text ?? ""
        let role =
            roleControl.selectedSegmentIndex != UISegmentedControl.noSegment ?
                DukePerson.DukeRole(rawValue: roleControl.titleForSegment(at: roleControl.selectedSegmentIndex)!)! :
                DukePerson.DukeRole.Unspecified
        let program =
            programControl.selectedSegmentIndex != UISegmentedControl.noSegment ?
                DukePerson.DukeProgram(rawValue: programControl.titleForSegment(at: programControl.selectedSegmentIndex)!)! :
                DukePerson.DukeProgram.Unspecified
        return DukePerson(firstName: firstName, lastName: lastName, gender: gender, whereFrom: whereFrom, role: role, program: program)
    }
        
    func searchDukePeople() -> Array<DukePerson>?{
        
        // Creates new DukePerson from user input
        let person = getCurrentPerson()
        
        // Creates a filteredResults array and adds all Duke People.
        var filteredResults : Array<DukePerson> = dukePeople
        
        // Filters for each search criteria that is neither empty nor unspecified. (Not necessarily the most concise solution I found, but by far the most readable).
        if person.firstName != "" {
            filteredResults = filteredResults.filter({
                $0.firstName == person.firstName || $0.firstName.contains(person.whereFrom)
            })
        }
        if person.lastName != "" {
            filteredResults = filteredResults.filter({
                $0.lastName == person.lastName || $0.lastName.contains(person.whereFrom)
            })
        }
        if person.whereFrom != "" {
            filteredResults = filteredResults.filter({
                $0.whereFrom == person.whereFrom || $0.whereFrom == "" || $0.whereFrom.contains(person.whereFrom)
            })
        }
        if person.gender != Person.Gender.Unspecified {
            filteredResults = filteredResults.filter({
                $0.gender == person.gender || $0.gender == .Unspecified
            })
        }
        if person.dukeRole != DukePerson.DukeRole.Unspecified {
            filteredResults = filteredResults.filter({
                $0.dukeRole == person.dukeRole || $0.dukeRole == .Unspecified
            })
        }
        if person.dukeProgram != DukePerson.DukeProgram.Unspecified {
            filteredResults = filteredResults.filter({
                $0.dukeProgram == person.dukeProgram || $0.dukeProgram == .Unspecified
            })
        }
        
        return filteredResults
    }
     
}

PlaygroundPage.current.liveView = HW1ViewController()
PlaygroundPage.current.needsIndefiniteExecution = true
