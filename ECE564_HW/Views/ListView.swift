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
    @State var searchText = ""
    @State var isSearching = false
    
    var body: some View {
        NavigationView {
            // Because this list observes the dukePeople variable contained in dukePeopleModel, it will change whenever that list changes
            List {
                if isSearching {
                    SearchBar(text: $searchText).animation(.default)
                }
                Section(header: StudentHeader()) {
                    ForEach(isSearching ?
                        dukePeopleModel.dukePeople.filter{$0.role == .Student && ($0.fullName.contains(searchText) || searchText == "")} :
                        dukePeopleModel.dukePeople.filter{$0.role == .Student}
                    ){ dukePerson in
                        PersonRow(dukePeopleModel : self.dukePeopleModel, dukePerson: dukePerson, thisPersonIndex: self.dukePeopleModel.dukePeople.firstIndex(of: dukePerson)!)
                    }.onDelete(perform: deleteItems(at:))
                }
                Section(header: ProfHeader()) {
                    ForEach(isSearching ?
                        dukePeopleModel.dukePeople.filter{$0.role == .Professor && ($0.fullName.contains(searchText) || searchText == "")} :
                        dukePeopleModel.dukePeople.filter{$0.role == .Professor}
                    ){ dukePerson in
                        PersonRow(dukePeopleModel : self.dukePeopleModel, dukePerson: dukePerson, thisPersonIndex: self.dukePeopleModel.dukePeople.firstIndex(of: dukePerson)!)
                    }.onDelete(perform: deleteItems(at:))
                }
                Section(header: TAHeader()) {
                    ForEach(isSearching ?
                        dukePeopleModel.dukePeople.filter{$0.role == .TA && ($0.fullName.contains(searchText) || searchText == "")} :
                        dukePeopleModel.dukePeople.filter{$0.role == .TA}
                    ){ dukePerson in
                        PersonRow(dukePeopleModel : self.dukePeopleModel, dukePerson: dukePerson, thisPersonIndex: self.dukePeopleModel.dukePeople.firstIndex(of: dukePerson)!)
                    }.onDelete(perform: deleteItems(at:))
                }
            }
            .navigationBarTitle("Duke People")
            .navigationBarItems(trailing:
                HStack {
                    Button(action: {
                        self.isSearching.toggle()
                    }, label: {
                        Image(systemName: "magnifyingglass")
                            .font(Font.system(.title)).accentColor(.blue)
                    })
                    Spacer()
                    Spacer()
                    Button(action: {
                        self.isAdding.toggle()
                    }, label: {
                        Image(systemName: "person.crop.circle.fill.badge.plus")
                            .font(Font.system(.title)).accentColor(.green)
                    })
                }
            )
            .sheet(isPresented: $isAdding, content: {
                AddView(isAdding: self.$isAdding, didAddPerson: { person in
                    if let foundIndex = self.dukePeopleModel.dukePeople.firstIndex(where: {$0.firstName == person.firstName && $0.lastName == person.lastName}){
                        self.dukePeopleModel.dukePeople.remove(at: foundIndex)
                    }
                    self.dukePeopleModel.dukePeople.append(person)
                    let _ = DukePeopleModel.saveDukePeople(dukePeople: self.dukePeopleModel.dukePeople)
                })
            })
        }
    }
    
    func deleteItems(at offsets: IndexSet){
        dukePeopleModel.dukePeople.remove(atOffsets: offsets)
        let _ = DukePeopleModel.saveDukePeople(dukePeople: self.dukePeopleModel.dukePeople)
    }
}

struct PersonRow : View {
    @ObservedObject var dukePeopleModel : DukePeopleModel
    @ObservedObject var dukePerson : DukePerson
    var thisPersonIndex : Int
    
    var body : some View {
        NavigationLink(destination:
            DetailView(
                dukePeopleModel: dukePeopleModel,
                thisPersonIndex: thisPersonIndex,
                copiedPerson: self.dukePeopleModel.dukePeople[self.thisPersonIndex].mutableCopy() as! DukePerson,
                editablePerson: self.dukePeopleModel.dukePeople[self.thisPersonIndex].mutableCopy() as! DukePerson)
            ){
            HStack {
                Image(uiImage: ((dukePerson.imageString == "" ?
                    UIImage(named: "defaultProfPic") :
                    UIImage(data: Data(base64Encoded: dukePerson.imageString)!))!
                ))
                    .resizable()
                    .clipShape(Circle())
                    .scaledToFill()
                    .overlay(Circle().stroke(Color.black, lineWidth: 1.5))
                    .frame(width: 70, height: 70)
                    .shadow(radius: 4)
                VStack (alignment: .leading) {
                    Text(dukePerson.fullName).font(.headline).padding(.init(top: 0, leading: 0, bottom: 5, trailing: 0))
                    Text(dukePerson.description).fontWeight(.light).lineLimit(nil).font(.system(size: 14))
                    
                }
                .padding(.leading, 8)
                .layoutPriority(1)
                
            }.padding(.init(top: 12, leading: 0, bottom: 12, trailing: 0))
        }

    }
}

struct StudentHeader: View {
    var body: some View {
        HStack {
            Image(systemName: "s.circle.fill")
            Text("Students")
        }
    }
}

struct ProfHeader: View {
    var body: some View {
        HStack {
            Image(systemName: "p.circle.fill")
            Text("Professors")
        }
    }
}

struct TAHeader: View {
    var body: some View {
        HStack {
            Image(systemName: "t.circle.fill")
            Text("Teaching Assistants")
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
