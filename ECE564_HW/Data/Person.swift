//
//  Person.swift
//  ECE564_HW
//
//  Created by Nathan Ostrowski on 5/22/20.
//  Copyright © 2020 ECE564. All rights reserved.
//

import Foundation
import UIKit

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
    var gender : String = ""
    var imageString : String = ""
    
    init() {}
    init(firstName: String, lastName: String, gender: String, whereFrom: String, imageString: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.gender = gender
        self.whereFrom = whereFrom
        self.imageString = imageString
    }
    var description: String {
        // Because first name and last name are required by the add function, both are assumed to not be empty.
        // This description safely handles whereFrom and Gender because they are not required by my modified creation of a new person, thus incorporating intentionally incomplete information.
        return "\(firstName) \(lastName) is from "
        + (whereFrom != "" ? "\(whereFrom)" : "an unknown place")
    }
}

class DukePerson : Person, NSMutableCopying, ObservableObject, Equatable, Codable {
    
    static func == (lhs: DukePerson, rhs: DukePerson) -> Bool {
        return lhs.description == rhs.description
    }

    func mutableCopy(with zone: NSZone? = nil) -> Any {
        let copy = DukePerson(firstName: firstName, lastName: lastName, gender: gender, whereFrom: whereFrom, imageString: imageString, role: role, program: program, languages: languages, hobbies: hobbies, hasAnimation: hasAnimation)
        return copy
    }
    
    enum DukeRole : String, CaseIterable, Codable {
        case Student
        case TA
        case Professor
    }
    
    enum DukeProgram : String, CaseIterable, Codable {
        case Undergraduate
        case Graduate
        case Unspecified
    }

    var role : DukeRole = .Student
    var program : DukeProgram = .Unspecified
    var languages: String = ""
    var hobbies : String = ""
    var hasAnimation : Bool = false
    override init() {
        super.init()
    }
    init(firstName: String, lastName: String, gender: String, whereFrom: String, imageString: String, role: DukeRole, program: DukeProgram, languages: String, hobbies: String, hasAnimation: Bool){
        self.role = role
        self.program = program
        self.languages = languages
        self.hobbies = hobbies
        self.hasAnimation = hasAnimation
        super.init(firstName: firstName, lastName: lastName, gender: gender, whereFrom: whereFrom, imageString: imageString)
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
            + " and is " +  "a \(role)."
                + " " + genderDescription + " proficient in " + (languages != "" ? languages : "some languages") + "."
                + " " + firstName + " enjoys " + (hobbies != "" ? hobbies : "some activities") + "."
        )
    }
    
    enum CodingKeys : CodingKey {
        case firstName, lastName, gender, whereFrom, imageString, role, program, languages, hobbies, hasAnimation
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(firstName, forKey: .firstName)
        try container.encode(lastName, forKey: .lastName)
        try container.encode(gender, forKey: .gender)
        try container.encode(whereFrom, forKey: .whereFrom)
        try container.encode(imageString, forKey: .imageString)
        
        try container.encode(role.rawValue, forKey: .role)
        try container.encode(program.rawValue, forKey: .program)

        try container.encode(languages, forKey: .languages)
        try container.encode(hobbies, forKey: .hobbies)
        try container.encode(hasAnimation, forKey: .hasAnimation)
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        super.init()

        firstName = try container.decode(String.self, forKey: .firstName)
        lastName = try container.decode(String.self, forKey: .lastName)
        gender = try container.decode(String.self, forKey: .gender)
        whereFrom = try container.decode(String.self, forKey: .whereFrom)
        imageString = try container.decode(String.self, forKey: .imageString)

        role = try container.decode(DukeRole.self, forKey: .role)
        program = try container.decode(DukeProgram.self, forKey: .program)

        languages = try container.decode(String.self, forKey: .languages)
        hobbies = try container.decode(String.self, forKey: .hobbies)
        hasAnimation = try container.decode(Bool.self, forKey: .hasAnimation)
    }
    
}
