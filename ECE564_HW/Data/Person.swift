//
//  Person.swift
//  ECE564_HW
//
//  Created by Nathan Ostrowski on 5/22/20.
//  Copyright © 2020 ECE564. All rights reserved.
//

import Foundation

// MARK: Person and DukePerson Classes

class Person : CustomStringConvertible {
    var firstName : String = ""
    var lastName : String = ""
    var whereFrom : String = ""
    var profPicName : String = "defaultProfPic"
    var gender : Gender = .NonBinary
    enum Gender : String {
        case Male
        case Female
        case NonBinary
        case Unspecified
    }
    init() {}
    init(firstName: String, lastName: String, gender: Gender, whereFrom: String, profPicName: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.gender = gender
        self.whereFrom = whereFrom
        self.profPicName = profPicName
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
    init(firstName: String, lastName: String, gender: Gender, whereFrom: String, profPicName: String, role: DukeRole, program: DukeProgram){
        self.dukeRole = role
        self.dukeProgram = program
        super.init(firstName: firstName, lastName: lastName, gender: gender, whereFrom: whereFrom, profPicName: profPicName)
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

class DukePeople: ObservableObject {
    // This
    @Published var dukePeopleArray : [DukePerson] = [
        DukePerson(firstName: "Richard", lastName: "Telford", gender: .Male, whereFrom: "Chatham County, NC", profPicName: "defaultProfPic", role: .Professor, program: .NA),
        DukePerson(firstName: "Ananjaya", lastName: "Tyagi", gender: .Female, whereFrom: "Delhi, India", profPicName: "defaultProfPic", role: .TA, program: .Grad),
        DukePerson(firstName: "Nathan", lastName: "Ostrowski", gender: .Male, whereFrom: "Charlotte, NC", profPicName: "defaultProfPic", role: .Student, program: .Undergrad)
    ]
}