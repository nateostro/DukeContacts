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
    }
    init() {}
    init(firstName: String, lastName: String, gender: Gender, whereFrom: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.gender = gender
        self.whereFrom = whereFrom
    }
    var description: String {
         return "\(firstName) \(lastName) is from \(whereFrom)."
    }
}

class DukePerson : Person {
    enum DukeProgram : String {
        case Undergrad
        case Grad
        case NA = "Not Applicable"
    }
    enum DukeRole : String {
        case Student
        case Professor
        case TA
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
        case .NonBinary:
            genderDescription = " They are"
        }
        return super.description + genderDescription + " a " + dukeRole.rawValue
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
    let shownDescription = UILabel()
    
    let firstNameField = UITextField()
    let lastNameField = UITextField()
    let whereFromField = UITextField()
    
    let genderControl = UISegmentedControl(items:
        ["Male", "Female", "NonBinary"])
    let roleControl = UISegmentedControl(items:
        ["Professor", "Student", "TA"])
    let programControl = UISegmentedControl(items:
        ["Undergrad", "Grad", "TA"])
    
    let addUpdateButton = UIButton(type: .system)
    let findButton = UIButton(type:
        .system)
    
    var thisPerson : DukePerson = DukePerson()

    // MARK: All Subview Setup Functions Called
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set Up All Labels
        setupHwLabel(hwTitle)
        setupDukeLookupTitle(dukeLookupTitle)
        setupFirstNameLabel(firstNameLabel)
        setupLastNameLabel(lastNameLabel)
        setupWhereFromLabel(whereFromLabel)
        setupShownDescripton(shownDescription)
        
        // Set Up All Text Fields
        setupFirstNameField(firstNameField)
        setupLastNameField(lastNameField)
        setupWhereFromField(whereFromField)
        
        // Set Up All Controls
        setupGenderControl(genderControl)
        setupRoleControl(roleControl)
        setupProgramControl(programControl)
        
        // Set Up All Buttons
        setupAddUpdateButton(addUpdateButton)
        //addUpdateButton.addTarget(self, action: #selector(self.addUpdateButtonTapped(_:)), for: .touchUpInside)
        setupFindButton(findButton)
        //findButton.addTarget(self, action: #selector(self.findButtonTapped(_:)), for: .touchUpInside)

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
        dukeLookupTitle.frame = CGRect(x: 0, y: 50, width: 240, height: 41)
        dukeLookupTitle.center.x = view.center.x
        dukeLookupTitle.text = "Duke Lookup"
        dukeLookupTitle.font = UIFont.boldSystemFont(ofSize: 40.0)
        dukeLookupTitle.textColor = .black
        view.addSubview(dukeLookupTitle)
    }
        
    // FirstNameLabel Subview Setup Function
    
    func setupFirstNameLabel(_ firstNameLabel: UILabel){
        firstNameLabel.frame = CGRect(x: 40, y: 142, width: 88, height: 21)
        firstNameLabel.text = "First Name:"
        firstNameLabel.textColor = .black
        view.addSubview(firstNameLabel)
    }
        
    // FirstNameField Subview Setup Function
    
    func setupFirstNameField(_ firstNameField: UITextField){
        firstNameField.frame = CGRect(x: 200, y: 136, width: 144, height: 34)
        firstNameField.text = ""
        firstNameField.textColor = .black
        firstNameField.borderStyle = UITextField.BorderStyle.roundedRect
        view.addSubview(firstNameField)
    }
        
    // LastNameLabel Subview Setup Function
        
    func setupLastNameLabel(_ lastNameLabel: UILabel){
        lastNameLabel.frame = CGRect(x: 40, y: 188, width: 87, height: 21)
        lastNameLabel.text = "Last Name:"
        lastNameLabel.textColor = .black
        view.addSubview(lastNameLabel)
    }

    // LastNameField Subview Setup Function
       
    func setupLastNameField(_ lastNameField: UITextField){
        lastNameField.frame = CGRect(x: 200, y: 183, width: 144, height: 34)
        lastNameField.text = ""
        lastNameField.textColor = .black
        lastNameField.borderStyle = UITextField.BorderStyle.roundedRect
        view.addSubview(lastNameField)
    }
        
    // WhereFromLabel Subview Setup Function
    
    func setupWhereFromLabel(_ whereFromLabel: UILabel){
        whereFromLabel.frame = CGRect(x: 40, y: 238, width: 44, height: 21)
        whereFromLabel.text = "From:"
        whereFromLabel.textColor = .black
        view.addSubview(whereFromLabel)
    }
        
    // WhereFromField Subview Setup Function
    
    func setupWhereFromField(_ whereFromField: UITextField){
        whereFromField.frame = CGRect(x: 200, y: 231, width: 144, height: 34)
        whereFromField.text = ""
        whereFromField.textColor = .black
        whereFromField.borderStyle = UITextField.BorderStyle.roundedRect
        view.addSubview(whereFromField)
    }
                
    // GenderControl Subview Setup Function
    
    func setupGenderControl(_ genderControl: UISegmentedControl){
        genderControl.frame = CGRect(x: 40, y: 304, width: 304, height: 32)
        genderControl.layer.cornerRadius = 5
        view.addSubview(genderControl)
        genderControl.selectedSegmentIndex = 0
    }

    // RoleControl Subview Setup Function
        
    func setupRoleControl(_ roleControl: UISegmentedControl){
        roleControl.frame = CGRect(x: 40, y: 359, width: 304, height: 32)
        roleControl.layer.cornerRadius = 5
        view.addSubview(roleControl)
        roleControl.selectedSegmentIndex = 0
    }
        
    // ProgramControl Subview Setup Function
        
    func setupProgramControl(_ programControl: UISegmentedControl){
        programControl.frame = CGRect(x: 40, y: 414, width: 304, height: 32)
        programControl.layer.cornerRadius = 5
        view.addSubview(programControl)
        programControl.selectedSegmentIndex = 0
    }
        
    // AddUpdateButton Subview Setup Function
    
    func setupAddUpdateButton(_ addUpdateButton: UIButton){
        addUpdateButton.frame = CGRect.init(x: 40, y: 478, width: 144, height: 40)
        addUpdateButton.backgroundColor = .blue
        addUpdateButton.layer.cornerRadius = 5
        addUpdateButton.tintColor = .blue
        addUpdateButton.setTitle("Add / Update", for: .normal)
        addUpdateButton.setTitleColor(.white, for: .normal)
        view.addSubview(addUpdateButton)
    }
        
    // FindButton Subview Setup Function
        
    func setupFindButton(_ findButton: UIButton){
        findButton.frame = CGRect.init(x: 200, y: 478, width: 144, height: 40)
        findButton.backgroundColor = .blue
        findButton.layer.cornerRadius = 5
        findButton.tintColor = .blue
        findButton.setTitle("Find", for: .normal)
        findButton.setTitleColor(.white, for: .normal)
        view.addSubview(findButton)
    }
        
    // ShownDescription Subview Setup Function
    
    func setupShownDescripton(_ shownDescription: UILabel){
        shownDescription.numberOfLines = 0
        findButton.frame = CGRect.init(x: 40, y: 530, width: 304, height: 60)
        view.addSubview(shownDescription)
    }
        
    
    // MARK: View Actions

    @objc func addUpdateButtonTapped(_ sender: UIButton){
        
        // Create new DukePerson from user input
        let person = DukePerson(
        firstName: firstNameField.text ?? "",
        lastName: lastNameField.text ?? "",
        gender: Person.Gender(rawValue: genderControl.titleForSegment(at: genderControl.selectedSegmentIndex)!)!,
        whereFrom: whereFromField.text ?? "",
        role: DukePerson.DukeRole(rawValue:
            roleControl.titleForSegment(at: roleControl.selectedSegmentIndex)!)!,
        program: DukePerson.DukeProgram(rawValue:
            programControl.titleForSegment(at: programControl.selectedSegmentIndex)!)!)
        
        // Find all people matching user-provided first and last name. If none, initiate new DukePerson and add to Array.
        // Then, update shownDescription
        if dukePeople.filter({$0.firstName == person.firstName && $0.lastName == person.lastName}).isEmpty {
            self.dukePeople.append(person)
            shownDescription.text = "New person added to Lookup. \n" + person.description
            print("New person added to Lookup. \n" + person.description)
        } else {
            let foundIndex = dukePeople.firstIndex(where: {$0.firstName == person.firstName && $0.lastName == person.lastName})
            self.dukePeople[foundIndex!] = person
            shownDescription.text = "Person attributes changed. \n" + person.description
            print("Person attributes changed. \n" + person.description)
        }
    }
    
    @objc func findButtonTapped(_ sender: UIButton){
        
        // Create new DukePerson from user input
        let person = DukePerson(
            firstName: firstNameField.text ?? "",
            lastName: lastNameField.text ?? "",
            gender: Person.Gender(rawValue: genderControl.titleForSegment(at: genderControl.selectedSegmentIndex)!)!,
            whereFrom: whereFromField.text ?? "",
            role: DukePerson.DukeRole(rawValue:
                roleControl.titleForSegment(at: roleControl.selectedSegmentIndex)!)!,
            program: DukePerson.DukeProgram(rawValue:
                programControl.titleForSegment(at: programControl.selectedSegmentIndex)!)!)
        
        // Find all people matching user-provided first and last name
        let searchResults = dukePeople.filter({$0.firstName == person.firstName && $0.lastName == person.lastName})
        
        // Update shownDescription
        if searchResults.isEmpty {
            shownDescription.text = "Error: No person found by that name"
            print("Error: No person found by that name")
        } else {
            var totalDescription = ""
            for dukePerson in searchResults {
                totalDescription += (dukePerson.description + " \n\n")
            }
            shownDescription.text = totalDescription
            print(totalDescription)
        }
    }
     
}
// Don't change the following line - it is what allowsthe view controller to show in the Live View window
PlaygroundPage.current.liveView = HW1ViewController()
PlaygroundPage.current.needsIndefiniteExecution = true

