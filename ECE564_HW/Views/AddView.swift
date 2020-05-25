//
//  AddView.swift
//  ECE564_HW
//
//  Created by Nathan Ostrowski on 5/22/20.
//  Copyright © 2020 ECE564. All rights reserved.
//

import SwiftUI

struct AddView: View {
    
    @ObservedObject var dukePeopleModel = DukePeopleModel()
        
    @Binding var isAdding : Bool
    
    @State var insufficientInformationAlert = false
    
    var didAddPerson: (DukePerson) -> ()
    
    @State var firstName : String = ""
    @State var lastName : String = ""
    @State var whereFrom : String = ""
    @State var gender : String = ""
    @State var role : String = ""
    @State var program : String = ""
    @State var languages : String = ""
    @State var hobbies : String = ""

    var body: some View {
        
        VStack {
            HStack(alignment: .top) {
                Text("New Person:")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.leading, 20)
                Spacer()
                Button(action: {
                    self.isAdding = false
                }, label: {
                    Text("Cancel")
                    .foregroundColor(.white)
                    .padding(.all, 12)
                    .background(Color.red)
                    .cornerRadius(5)
                }).padding(.trailing, 20)
            }.padding(.bottom, 10)
            .padding(.top, 25)
            
            HStack(spacing: 16) {
                Text("First Name:").frame(alignment: .leading)
                Spacer()
                TextField("Enter first name", text: $firstName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(width: 200, alignment: .trailing)
            }.padding(.init(top: 2, leading: 20, bottom: 2, trailing: 20))
            
            HStack(spacing: 16) {
                Text("Last Name:").frame(alignment: .leading)
                Spacer()
                TextField("Enter last name", text: $lastName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(width: 200, alignment: .trailing)
            }.padding(.init(top: 2, leading: 20, bottom: 2, trailing: 20))
            
            HStack(spacing: 16) {
                Text("Hometown:").frame(alignment: .leading)
                Spacer()
                TextField("Enter hometown", text: $whereFrom)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(width: 200, alignment: .trailing)
            }.padding(.init(top: 2, leading: 20, bottom: 2, trailing: 20))
            
            HStack(spacing: 16) {
                Text("Gender:").frame(alignment: .leading)
                Spacer()
                TextField("Enter gender", text: $gender)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(width: 200, alignment: .trailing)
            }.padding(.init(top: 2, leading: 20, bottom: 2, trailing: 20))
            
            HStack(spacing: 16) {
                Text("Role:").frame(alignment: .leading)
                Spacer()
                TextField("Enter Duke Role", text: $role).textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(width: 200, alignment: .trailing)
            }.padding(.init(top: 2, leading: 20, bottom: 2, trailing: 20))
            
            HStack(spacing: 16) {
                Text("Program:").frame(alignment: .leading)
                Spacer()
                TextField("Enter Duke Program", text: $program)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 200, alignment: .trailing)
            }.padding(.init(top: 2, leading: 20, bottom: 2, trailing: 20))
            
            HStack(spacing: 16) {
                Text("Languages:").frame(alignment: .leading)
                Spacer()
                TextField("Enter CS Languages", text: $languages)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(width: 200, alignment: .trailing)
            }.padding(.init(top: 2, leading: 20, bottom: 2, trailing: 20))
            
            HStack(spacing: 16) {
                Text("Hobbies:").frame(alignment: .leading)
                Spacer()
                TextField("Enter Hobbies", text: $hobbies)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(width: 200, alignment: .trailing)
            }.padding(.init(top: 2, leading: 20, bottom: 2, trailing: 20))
            
            Button(action: {
                if self.firstName != "" && self.lastName != ""{
                    self.didAddPerson(.init(firstName: self.firstName, lastName: self.lastName, gender: self.gender, whereFrom: self.whereFrom, profPicName: "defaultProfPic", role: self.role, program: self.program, languages: self.languages, hobbies: self.hobbies))
                    self.isAdding = false
                } else {
                    self.insufficientInformationAlert.toggle()
                }
            }, label: {
                Text("Add Person")
                .foregroundColor(.white)
                .fontWeight(.bold)
                .padding(.all, 12)
                .background(Color.green)
                .cornerRadius(5)
                .frame(width: 300, height: 60, alignment: .center)
                    .padding(.all, 20)
            })
        
        }.alert(isPresented: $insufficientInformationAlert){
            .init(title: Text("Insufficient Information"), message: Text("Please enter both a first and last name"))
            }
    }
}


struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(dukePeopleModel: DukePeopleModel.init(), isAdding: true)
    }
}
