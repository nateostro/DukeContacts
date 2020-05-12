//: This is the playground file to use for submitting HW1.  You will add your code where noted below.  Make sure you only put the code required at load time in the ``loadView()`` method.  Other code should be set up as additional methods (such as the code called when a button is pressed).
  
import UIKit
import PlaygroundSupport

enum Gender : String {
    case Male = "Male"
    case Female = "Female"
}

class Person {
    var firstName = "First"
    var lastName = "Last"
    var whereFrom = "Anywhere"  // this is just a free String - can be city, state, both, etc.
    var gender : Gender = .Male
}

enum DukeRole : String {
    case Student = "Student"
    case Professor = "Professor"
    case TA = "Teaching Assistant"
}

enum DukeProgram : String {
    case Undergrad = "Undergrad"
    case Grad = "Grad"
    case NA = "Not Applicable"
}

// You can add code here

class HW1ViewController : UIViewController {
    override func loadView() {
// You can change color scheme if you wish
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
