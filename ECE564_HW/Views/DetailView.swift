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
    
    @State var pickedImage: UIImage? = nil
            
    var body: some View {
        VStack {
            
            InfoView(dukePerson: self.editablePerson, canEdit: $isEditing, isAnimating: $isAnimating, pickedImage: $pickedImage)
               
            if isEditing {
               HStack{
                   Button(action: {
                    if self.editablePerson.firstName != "" && self.editablePerson.lastName != "" {
                        if self.pickedImage != nil {
                            self.editablePerson.imageString = self.pickedImage!.jpegData(compressionQuality: 0.1)!.base64EncodedString()
                        }
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
                
               }.padding(.init(top: 12, leading: 150, bottom: 12, trailing: 150))
                .background(Color.green)
                .cornerRadius(5)
                .frame(width: 340, height: 60, alignment: .center)
                .transition(.move(edge: .bottom))
                .animation(.easeInOut)
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
                    self.pickedImage = nil
                }, label: {
                 Image(systemName: (isEditing ? "multiply.circle.fill" : "square.and.pencil"))
                    .font(Font.system(.title))
                    .accentColor((isEditing ? .red : .blue))
                })
            )
        
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(dukePeopleModel: DukePeopleModel(), thisPersonIndex: 1, copiedPerson: DukePeopleModel().dukePeople[1].mutableCopy() as! DukePerson, editablePerson: DukePeopleModel().dukePeople[1].mutableCopy() as! DukePerson, isAnimating: false)
    }
}
