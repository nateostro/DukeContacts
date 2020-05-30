//
//  Person.swift
//  ECE564_HW
//
//  Created by Nathan Ostrowski on 5/22/20.
//  Copyright © 2020 ECE564. All rights reserved.
//

import Foundation

// MARK: Person and DukePerson Classes

class Person : CustomStringConvertible, Identifiable {
    
    // In this iteration, added a unique identifier––found that it played nicer with SwiftUI
    var id = UUID()
    var firstName : String = ""
    var lastName : String = ""
    var fullName : String {
        get {
            return firstName + " " + lastName
        }
    }
    var whereFrom : String = ""
    var profPicName : String = "defaultProfPic"
    var gender : String = ""
    init() {}
    init(firstName: String, lastName: String, gender: String, whereFrom: String, profPicName: String) {
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
        + (whereFrom != "" ? "\(whereFrom)" : "an unknown place")
    }
}

class DukePerson : Person, NSMutableCopying, ObservableObject, Equatable {
    static func == (lhs: DukePerson, rhs: DukePerson) -> Bool {
        return lhs.description == rhs.description
    }

    func mutableCopy(with zone: NSZone? = nil) -> Any {
        var copy = DukePerson(firstName: firstName, lastName: lastName, gender: gender, whereFrom: whereFrom, profPicName: profPicName, role: role, program: program, languages: languages, hobbies: hobbies)
        return copy
    }
    
    enum DukeRole : String, CaseIterable {
        case Student
        case TA
        case Professor
        case Unspecified
    }
    
    enum DukeProgram : String, CaseIterable {
        case Undergraduate
        case Graduate
        case Unspecified
    }

    var role : DukeRole = .Unspecified
    var program : DukeProgram = .Unspecified
    var languages: String = ""
    var hobbies : String = ""
    override init() {
        super.init()
    }
    init(firstName: String, lastName: String, gender: String, whereFrom: String, profPicName: String, role: DukeRole, program: DukeProgram, languages: String, hobbies: String){
        self.role = role
        self.program = program
        self.languages = languages
        self.hobbies = hobbies
        super.init(firstName: firstName, lastName: lastName, gender: gender, whereFrom: whereFrom, profPicName: profPicName)
    }
    override var description: String {
        var genderDescription : String
        if gender == "Male" {
            genderDescription = "He is"
        } else if gender == "Female" {
            genderDescription = "She is"
        } else {
            genderDescription = "They are"
        }
        return (super.description
            + " and is " + (role != .Unspecified ? "a \(role)" : "at Duke in an unspecified role") + "."
                + " " + genderDescription + " proficient in " + (languages != "" ? languages : "some languages") + "."
                + " " + firstName + " enjoys " + (hobbies != "" ? hobbies : "some activities") + "."
        )
    }
}
