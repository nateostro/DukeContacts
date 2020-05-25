//
//  DetailView.swift
//  ECE564_HW
//
//  Created by Nathan Ostrowski on 5/22/20.
//  Copyright © 2020 ECE564. All rights reserved.
//

import SwiftUI

struct DetailView: View {
        
    @ObservedObject var dukePerson : DukePerson

    @State var editablePerson : DukePerson = dukePerson.mutableCopy() as! DukePerson
    
    @State var isEditing : Bool = false
    @State var insufficientInformationAlert = false
            
    var body: some View {
        VStack {
               HStack(alignment: .top) {
                   Spacer()
                   Button(action: {
                        self.isEditing.toggle()
                   }, label: {
                    Image(systemName: (isEditing ? "square.and.pencil" :"multiply.circle.fill"))
                        .font(Font.system(.title)).accentColor((isEditing ? .red : .blue))
                   })
                   .frame(alignment: .trailing)
                   .padding(.init(top: 25, leading: 20, bottom: 0, trailing: 30))
               
               Image(systemName: "photo.fill")
                   .resizable()
                   .clipShape(Circle())
                   .scaledToFill()
                   .overlay(Circle().stroke(Color.black, lineWidth: 2))
                   .frame(width: 100, height: 100, alignment: .center)
                   .padding(.bottom, 10)
    
               
               InfoView(dukePerson: dukePerson, canEdit: $isEditing)
               
            if isEditing {
               HStack{
                   Button(action: {
                    /*
                    if editablePerson.firstName != "" && self.editablePerson.lastName != ""{
                        self.dukePerson.firstName = self.editablePerson.firstName
                            self.dukePerson.lastName = self.lastName
                            self.dukePerson.gender = self.gender
                            self.dukePerson.whereFrom = self.whereFrom
                            self.dukePerson.dukeRole = self.role
                            self.dukePerson.dukeProgram = self.program
                            self.dukePerson.languages = self.languages
                            self.dukePerson.hobbies = self.hobbies
                            self.isEditing = false
        
                       } else {
                            self.insufficientInformationAlert.toggle()
                       }
                    */
                    print(editablePerson.description)
                   }, label: {
                       Text("Save")
                       .foregroundColor(.white)
                       .fontWeight(.bold)
                   })
               }.padding(.all, 12)
                .background(Color.green)
               .cornerRadius(5)
               .frame(width: 300, height: 60, alignment: .center)
            } else {
                
            }
           
           }.alert(isPresented: $insufficientInformationAlert){
               .init(title: Text("Insufficient Information"), message: Text("Please enter both a first and last name"))}
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(dukePerson: DukePeopleModel.init().dukePeople[0])
    }
}
