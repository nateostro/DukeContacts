//
//  Actions.swift
//  ECE564_HW
//
//  Created by Nathan Ostrowski on 5/22/20.
//  Copyright © 2020 ECE564. All rights reserved.
//

import Foundation

public class DukePeopleModel : ObservableObject {
    @Published var dukePeople : [DukePerson] = [
        DukePerson(firstName: "Richard", lastName: "Telford", gender: "Male", whereFrom: "Chatham County, NC", profPicName: "defaultProfPic", role: .Professor, program: .NA, languages: "Swift, C, and C++", hobbies: "Biking, Hiking, Golf"),
        DukePerson(firstName: "Ananjaya", lastName: "Tyagi", gender: "Female", whereFrom: "Delhi, India", profPicName: "defaultProfPic", role: .TA, program: .Graduate, languages: "", hobbies: ""),
        DukePerson(firstName: "Nathan", lastName: "Ostrowski", gender: "Male", whereFrom: "Charlotte, NC", profPicName: "defaultProfPic", role: .Student, program: .Undergraduate, languages: "Swift, C, and Mathematica", hobbies: "Backpacking, Playing Guitar, Reading the News")
    ]
    
    @Published var editablePerson : DukePerson = DukePerson()
    
    func searchDukePeople(person: DukePerson) -> Array<DukePerson>?{
                
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
        if person.gender != "" {
            filteredResults = filteredResults.filter({
                $0.gender == person.gender || $0.gender == "" || $0.gender.contains(person.gender)
            })
        }
        if person.role != .Unspecified {
            filteredResults = filteredResults.filter({
                $0.role == person.role
            })
        }
        if person.role != .Unspecified {
            filteredResults = filteredResults.filter({
                $0.program == person.program
            })
        }
        
        return filteredResults
    }
    
}

/*
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
    
}
*/
