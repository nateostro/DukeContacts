//
//  Actions.swift
//  ECE564_HW
//
//  Created by Nathan Ostrowski on 5/22/20.
//  Copyright © 2020 ECE564. All rights reserved.
//

import Foundation

var initialDukePeople : [DukePerson] = [DukePerson]()

func loadInitialData(){
    if let foundDukePeople = DukePeopleModel.loadDukePeople(){
        initialDukePeople = foundDukePeople
    } else {
        initialDukePeople = [
            DukePerson(firstName: "Richard", lastName: "Telford", gender: "Male", whereFrom: "Chatham County, NC", profPicName: "defaultProfPic", role: .Professor, program: .Unspecified, languages: "Swift, C, and C++", hobbies: "Biking, Hiking, Golf", hasAnimation: false),
            DukePerson(firstName: "Ananjaya", lastName: "Tyagi", gender: "Female", whereFrom: "Delhi, India", profPicName: "defaultProfPic", role: .TA, program: .Graduate, languages: "", hobbies: "", hasAnimation: false),
            DukePerson(firstName: "Nathan", lastName: "Ostrowski", gender: "Male", whereFrom: "Charlotte, NC", profPicName: "nathanProfPic", role: .Student, program: .Undergraduate, languages: "Swift, C, and Mathematica", hobbies: "Backpacking, Playing Guitar, Reading the News", hasAnimation: true)
        ]
        
        let _ = DukePeopleModel.saveDukePeople(dukePeople: initialDukePeople)
    }
}

public class DukePeopleModel : ObservableObject {
    
    @Published var dukePeople : [DukePerson] = initialDukePeople
    
    @Published var editablePerson : DukePerson = DukePerson()
    
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("DukePeopleJSON")
    
    
    static func saveDukePeople(dukePeople: [DukePerson]) -> Bool {
        var outputData = Data()
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(dukePeople)
            outputData = data
        } catch {
            print("There's something wrong with the encoding")
        }
        
        do {
            try outputData.write(to: ArchiveURL)
            return true
        } catch {
            print("There's something wrong with the writing")
        }
        return false
    }
    
    static func loadDukePeople() -> [DukePerson]? {
        let decoder = JSONDecoder()
        var foundDukePeople = [DukePerson]()
        let tempData: Data
        
        do {
            tempData = try Data(contentsOf: ArchiveURL)
        } catch let error as NSError {
            print(error)
            return nil
        }
        if let decoded = try? decoder.decode([DukePerson].self, from: tempData) {
            foundDukePeople = decoded
        }
        return foundDukePeople
    }
}

