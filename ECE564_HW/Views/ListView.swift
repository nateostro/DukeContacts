//
//  MainView.swift
//  ECE564_HW
//
//  Created by Nathan Ostrowski on 5/22/20.
//  Copyright © 2020 ECE564. All rights reserved.
//

import SwiftUI
import Combine

struct ListView: View {
    @ObservedObject var dukePeopleModel = DukePeopleModel()
    
    @State var isAdding : Bool = false
    
    var body: some View {
        NavigationView {
            // Because this list observes the dukePeople variable contained in dukePeopleModel, it will change whenever that list changes.
            List {
                Section {
                    ForEach(dukePeopleModel.dukePeople){ dukePerson in
                        PersonRow(dukePerson: dukePerson)
                    }.onDelete(perform: deleteItems(at:))
                }
            }
            .navigationBarTitle("Duke People")
            .navigationBarItems(trailing: Button(action: {
                    self.isAdding.toggle()
                }, label: {
                    Image(systemName: "plus.circle.fill")
                        .font(Font.system(.title)).accentColor(.green)
                })
            )
            .sheet(isPresented: $isAdding, content: {
                AddView(isAdding: self.$isAdding, didAddPerson: { person in
                    if let foundIndex = self.dukePeopleModel.dukePeople.firstIndex(where: {$0.firstName == person.firstName && $0.lastName == person.lastName}){
                        self.dukePeopleModel.dukePeople.remove(at: foundIndex)
                    }
                    self.dukePeopleModel.dukePeople.append(person)
                })
            })
        }
    }
    
    func deleteItems(at offsets: IndexSet){
        dukePeopleModel.dukePeople.remove(atOffsets: offsets)
    }
}

struct PersonRow : View {
    var dukePerson : DukePerson
    
    var body : some View {
        NavigationLink(destination: DetailView(dukePerson: dukePerson)){
            HStack {
                Image(dukePerson.profPicName)
                    .resizable()
                    .clipShape(Circle())
                    .scaledToFill()
                    .overlay(Circle().stroke(Color.black, lineWidth: 2))
                    .frame(width: 70, height: 70)
                
                VStack (alignment: .leading) {
                    Text(dukePerson.fullName).font(.headline).padding(.init(top: 0, leading: 0, bottom: 5, trailing: 0))
                    Text(dukePerson.description).fontWeight(.light).lineLimit(nil).font(.subheadline)
                    
                }
                .padding(.leading, 8)
                .layoutPriority(1)
                
            }.padding(.init(top: 12, leading: 0, bottom: 12, trailing: 0))
        }

    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
