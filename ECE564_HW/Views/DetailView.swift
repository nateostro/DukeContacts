//
//  DetailView.swift
//  ECE564_HW
//
//  Created by Nathan Ostrowski on 5/22/20.
//  Copyright © 2020 ECE564. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    var dukePerson : DukePerson
    
    var body: some View {
        VStack(alignment: .center) {
            Image(dukePerson.profPicName)
                .resizable()
                .clipShape(Circle())
                .scaledToFill()
                .overlay(Circle().stroke(Color.black, lineWidth: 2))
                .frame(width: 70, height: 70)
            Spacer()
            
        }.frame(alignment: .top)
        
        
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(dukePerson: DukePerson.init())
    }
}
