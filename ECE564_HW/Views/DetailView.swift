//
//  DetailView.swift
//  ECE564_HW
//
//  Created by Nathan Ostrowski on 5/22/20.
//  Copyright © 2020 ECE564. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    @ObservedObject var dukePeopleModel : DukePeopleModel
    var thisPersonIndex : Int
    @State var copiedPerson : DukePerson
    @State var editablePerson : DukePerson
    
    @State var isEditing : Bool = false
    @State var insufficientInformationAlert = false
    @State var isAnimating : Bool = false
            
    var body: some View {
        VStack {
            
            InfoView(dukePerson: self.editablePerson, canEdit: $isEditing, isAnimating: $isAnimating)
               
            if isEditing {
               HStack{
                   Button(action: {
                    if self.editablePerson.firstName != "" && self.editablePerson.lastName != "" {
                        self.dukePeopleModel.dukePeople[self.thisPersonIndex] = self.editablePerson
                        let _ = DukePeopleModel.saveDukePeople(dukePeople: self.dukePeopleModel.dukePeople)
                    } else {
                        self.insufficientInformationAlert.toggle()
                    }
                    
                   }, label: {
                       Text("Save")
                       .foregroundColor(.white)
                       .fontWeight(.bold)
                   })
               }.padding(.all, 12)
                .background(Color.green)
                .cornerRadius(5)
                .frame(width: 300, height: 60, alignment: .center)
            }
           
        }.alert(isPresented: $insufficientInformationAlert){
               .init(title: Text("Insufficient Information"), message: Text("Please enter both a first and last name"))}
            .navigationBarTitle(Text(self.editablePerson.fullName), displayMode: .inline)
            .navigationBarItems(trailing:
                Button(action: {
                    if self.isEditing {
                        self.editablePerson = self.copiedPerson
                    }
                     self.isEditing.toggle()
                }, label: {
                 Image(systemName: (isEditing ? "multiply.circle.fill" : "square.and.pencil"))
                    .font(Font.system(.title)).accentColor((isEditing ? .blue : .red))
                })
            )
        
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(dukePeopleModel: DukePeopleModel(), thisPersonIndex: 1, copiedPerson: DukePeopleModel().dukePeople[1].mutableCopy() as! DukePerson, editablePerson: DukePeopleModel().dukePeople[1].mutableCopy() as! DukePerson, isAnimating: false)
    }
}
