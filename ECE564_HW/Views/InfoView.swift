//
//  InfoView.swift
//  ECE564_HW
//
//  Created by Nathan Ostrowski on 5/25/20.
//  Copyright © 2020 ECE564. All rights reserved.
//

import SwiftUI

struct InfoView: View {
    
    @ObservedObject var dukePerson : DukePerson
        
    @Binding var canEdit : Bool
    
    var body: some View {
        Form {
            Section {
                HStack {
                    Text("First Name:").frame(alignment: .leading)
                    Spacer()
                 TextField("Enter first name", text: $dukePerson.firstName)
                    .frame(width: 180, alignment: .trailing)
                    .foregroundColor((!canEdit ? .gray : .black))
                    .font(.callout)
                    .disabled(!canEdit)
                }.padding(.init(top: 2, leading: 10, bottom: 2, trailing: 20))
                
                HStack {
                    Text("Last Name:").frame(alignment: .leading)
                    Spacer()
                 TextField("Enter last name", text: $dukePerson.lastName)
                    .frame(width: 180, alignment: .trailing)
                    .foregroundColor((!canEdit ? .gray : .black))
                    .font(.callout)
                    .disabled(!canEdit)
                }.padding(.init(top: 2, leading: 10, bottom: 2, trailing: 20))
                
                HStack(spacing: 16) {
                    Text("Hometown:").frame(alignment: .leading)
                    Spacer()
                 TextField("Enter hometown", text: $dukePerson.whereFrom)
                    .frame(width: 180, alignment: .trailing)
                        .foregroundColor((!canEdit ? .gray : .black))
                        .font(.callout)
                        .disabled(!canEdit)
                    }.padding(.init(top: 2, leading: 10, bottom: 2, trailing: 20))
                
                HStack(spacing: 16) {
                    Text("Gender:").frame(alignment: .leading)
                    Spacer()
                 TextField("Enter gender", text: $dukePerson.gender)
                    .frame(width: 180, alignment: .trailing)
                        .foregroundColor((!canEdit ? .gray : .black))
                        .font(.callout)
                        .disabled(!canEdit)
                    }.padding(.init(top: 2, leading: 10, bottom: 2, trailing: 20))
                
                HStack(spacing: 16) {
                    Text("Role:").frame(alignment: .leading)
                    Spacer()
                 TextField("Enter Duke Role", text: $dukePerson.dukeRole)
                    .frame(width: 180, alignment: .trailing)
                        .foregroundColor((!canEdit ? .gray : .black))
                        .font(.callout)
                        .disabled(!canEdit)
                    }.padding(.init(top: 2, leading: 10, bottom: 2, trailing: 20))
                
                HStack(spacing: 16) {
                    Text("Program:").frame(alignment: .leading)
                    Spacer()
                 TextField("Enter Duke Program", text: $dukePerson.dukeProgram)
                    .frame(width: 180, alignment: .trailing)
                        .foregroundColor((!canEdit ? .gray : .black))
                        .font(.callout)
                        .disabled(!canEdit)
                    }.padding(.init(top: 2, leading: 10, bottom: 2, trailing: 20))
                
                HStack(spacing: 16) {
                    Text("Languages:").frame(alignment: .leading)
                    Spacer()
                 TextField("Enter CS Languages", text: $dukePerson.languages)
                    .frame(width: 180, alignment: .trailing)
                        .foregroundColor((!canEdit ? .gray : .black))
                        .font(.callout)
                        .disabled(!canEdit)
                    }.padding(.init(top: 2, leading: 10, bottom: 2, trailing: 20))
                
                HStack(spacing: 16) {
                    Text("Hobbies:").frame(alignment: .leading)
                    Spacer()
                 TextField("Enter Hobbies", text: $dukePerson.hobbies)
                    .frame(width: 180, alignment: .trailing)
                        .foregroundColor((!canEdit ? .gray : .black))
                        .font(.callout)
                        .disabled(!canEdit)
                    }.padding(.init(top: 2, leading: 10, bottom: 2, trailing: 20))
            }
        }
    }
}
