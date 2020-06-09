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
    @Binding var isAnimating : Bool
    @State var showImagePicker: Bool = false
    @Binding var pickedImage: UIImage?
    
    var body: some View {
        ZStack {
            VStack {
                HStack(alignment: .top) {
                    ZStack(alignment: .center){
                        Image(uiImage: pickedImage ?? (dukePerson.imageString == "" ?
                            UIImage(named: "defaultProfPic") :
                            UIImage(data: Data(base64Encoded: dukePerson.imageString)!))!
                        )
                           .resizable()
                           .clipShape(Circle())
                           .scaledToFill()
                           .overlay(Circle().stroke(Color.black, lineWidth: 2))
                           .frame(width: 100, height: 100, alignment: .center)
                           .shadow(radius: 5)
                           .brightness((canEdit ? -0.5 : 0))
                        .frame(alignment: .trailing)
                        .padding(.init(top: 5, leading: 20, bottom: 0, trailing: 20))
                        if canEdit {
                            Button(action: {
                                self.showImagePicker.toggle()
                            }){
                                Image(systemName: "plus")
                                .resizable()
                                .frame(width: 25, height: 25, alignment: .center)
                                .accentColor(.white)
                            }
                        }
                    }
                }.background(Color.white.opacity(0))
                Form {
                    Section(header: BasicInfoHeader()) {
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
                    }
                    Section(header: DukeInfoHeader()) {
                        HStack(spacing: 16) {
                            Picker(selection: $dukePerson.role, label: Text("Role")) {
                                ForEach(DukePerson.DukeRole.allCases, id: \.self) {
                                    Text($0.rawValue)
                                }
                            }.pickerStyle(SegmentedPickerStyle())
                                .foregroundColor((!canEdit ? .gray : .black))
                                .font(.callout)
                                .disabled(!canEdit)
                            }.padding(.init(top: 2, leading: 0, bottom: 2, trailing: 0))
                        
                        HStack {
                            Picker(selection: $dukePerson.program, label: Text("Program")) {
                                ForEach(DukePerson.DukeProgram.allCases, id: \.self) {
                                    Text($0.rawValue)
                                }
                            }.pickerStyle(SegmentedPickerStyle())
                                .foregroundColor((!canEdit ? .gray : .black))
                                .font(.callout)
                                .disabled(!canEdit)
                            }.padding(.init(top: 2, leading: 0, bottom: 2, trailing: 0))
                    }
                    Section(header: PersonalInfoHeader()) {
                        HStack {
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
                    if dukePerson.hasAnimation {
                        Section(header: AnimationInfoHeader()) {
                            HStack {
                                Text("Animation:").frame(alignment: .leading)
                                Spacer()
                                Button(action: {
                                    withAnimation(.easeInOut(duration: 1)) {
                                        self.isAnimating.toggle()
                                    }
                                }){
                                    Image(systemName: (isAnimating ? "multiply.circle.fill": "play.fill")).accentColor((isAnimating ? .red : .blue))
                                }
                            }.padding(.init(top: 2, leading: 10, bottom: 2, trailing: 20))
                        }
                    }
                }
            }.sheet(isPresented: $showImagePicker, onDismiss: {
                self.showImagePicker = false
            }, content: {
                ImagePicker(image: self.$pickedImage, imageIsShown: self.$showImagePicker)
            })
            if isAnimating {
                AnimationView()
            }
        }
    }

}

struct BasicInfoHeader: View {
    var body: some View {
        HStack {
            Image(systemName: "person.circle.fill")
            Text("Basic Info")
        }
    }
}

struct DukeInfoHeader: View {
    var body: some View {
        HStack {
            Image(systemName: "briefcase.fill")
            Text("Duke Info")
        }
    }
}

struct PersonalInfoHeader: View {
    var body: some View {
        HStack {
            Image(systemName: "star.circle.fill")
            Text("Personal Info")
        }
    }
}

struct AnimationInfoHeader: View {
    var body: some View {
        HStack {
            Image(systemName: "livephoto.play")
            Text("Animation")
        }
    }
}
