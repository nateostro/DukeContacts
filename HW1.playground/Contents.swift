//: This is the playground file to use for submitting HW1.  You will add your code where noted below.  Make sure you only put the code required at load time in the ``loadView()`` method.  Other code should be set up as additional methods (such as the code called when a button is pressed).
  
import UIKit
import PlaygroundSupport

// In Gender, DukeRole, and DukeProgram, because Swift implicitly assumes the case to be a string of itself if the enum is of type String, I got rid of the redundant strings.
enum Gender : String {
    case Male
    case Female
    case NonBinary = "Non-Binary"
}

class Person : CustomStringConvertible {
    var firstName : String = ""
    var lastName : String = ""
    var whereFrom : String = ""
    var gender : Gender = .NonBinary
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


// TODO: Add a custom .sorted() method by specific parameters.

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

class HW1ViewController : UIViewController {
    override func loadView() {
// You can change color scheme if you wish
        var dukePeople : [DukePerson] = [
            DukePerson(firstName: "Richard", lastName: "Telford", gender: .Male, whereFrom: "Chatham County, NC", role: .Professor, program: .NA),
            DukePerson(firstName: "Ananjaya", lastName: "Tyagi", gender: .Female, whereFrom: "Delhi, India", role: .TA, program: .Grad),
            DukePerson(firstName: "Nathan", lastName: "Ostrowski", gender: .Male, whereFrom: "Charlotte, NC", role: .Student, program: .Undergrad)
        ]
        dump(dukePeople)
        let view = UIView()
        view.backgroundColor = .black
        let label = UILabel()
        label.frame = CGRect(x: 100, y: 10, width: 200, height: 20)
        label.text = "ECE 564 Homework 1"
        label.textColor = .white
        view.addSubview(label)
        self.view = view
        
// You can add code here
    
    }
    
// You can add code here

}
// Don't change the following line - it is what allowsthe view controller to show in the Live View window
PlaygroundPage.current.liveView = HW1ViewController()
