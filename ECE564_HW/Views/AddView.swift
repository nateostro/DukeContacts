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
    @State var dukePerson : DukePerson = DukePerson()

    var body: some View {
        
        VStack {
            HStack(alignment: .top) {
                Spacer()
                Button(action: {
                    self.isAdding = false
                }, label: {
                    Image(systemName: "multiply.circle.fill")
                    .font(Font.system(.title)).accentColor(.red)
                })
            }
                .frame(alignment: .trailing)
                .padding(.init(top: 25, leading: 20, bottom: 0, trailing: 30))
            
            Image(systemName: "photo.fill")
                .resizable()
                .clipShape(Circle())
                .scaledToFill()
                .overlay(Circle().stroke(Color.black, lineWidth: 2))
                .frame(width: 100, height: 100, alignment: .center)
                .padding(.bottom, 10)
 
            
            InfoView(dukePerson: dukePerson, canEdit: $isAdding)
            
            HStack{
                Button(action: {
                    if self.dukePerson.firstName != "" && self.dukePerson.lastName != ""{
                        self.didAddPerson(self.dukePerson)
                        self.isAdding = false
                    } else {
                        self.insufficientInformationAlert.toggle()
                    }
                }, label: {
                    Text("Add Person")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                })
            }.padding(.all, 12)
            .background(Color.green)
            .cornerRadius(5)
            .frame(width: 300, height: 60, alignment: .center)
        
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
