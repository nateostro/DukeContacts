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

    var body: some View {
        
        VStack {
            HStack(alignment: .top) {
                Text("Add a Person:").font(.largeTitle)
                Spacer()
            }.padding(.bottom, 10)
            HStack() {
                Text("First Name:")
                Spacer()
                TextField("Enter first name", text: $firstName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            }.padding(.init(top: 6, leading: 12, bottom: 6, trailing: 12))
            HStack(spacing: 16) {
                Text("Last Name:")
                TextField("Enter last name", text: $lastName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            }.padding(.init(top: 6, leading: 12, bottom: 6, trailing: 12))
            HStack(spacing: 16) {
                Text("Hometown:")
                TextField("Enter hometown", text: $whereFrom)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            }.padding(.init(top: 6, leading: 12, bottom: 6, trailing: 12))
            HStack(spacing: 16) {
                Text("Gender:")
                TextField("Enter gender", text: $gender)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            }.padding(.init(top: 6, leading: 12, bottom: 6, trailing: 12))
            HStack(spacing: 16) {
                Text("Duke Role:")
                TextField("Enter Duke Role", text: $role).textFieldStyle(RoundedBorderTextFieldStyle())
            }.padding(.init(top: 6, leading: 12, bottom: 6, trailing: 12))
            HStack(spacing: 16) {
                Text("Duke Program:")
                TextField("Enter Duke Program", text: $program)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            }.padding(.init(top: 6, leading: 12, bottom: 6, trailing: 12))
            
            Button(action: {
                if self.firstName != "" && self.lastName != ""{
                    self.didAddPerson(.init(firstName: self.firstName, lastName: self.lastName, gender: self.gender, whereFrom: self.whereFrom, profPicName: "defaultProfPic", role: self.role, program: self.program))
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
            })
            
            Button(action: {
                self.isAdding = false
            }, label: {
                Text("Cancel")
                .foregroundColor(.white)
                .fontWeight(.bold)
                .padding(.all, 12)
                .background(Color.red)
                .cornerRadius(5)
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
