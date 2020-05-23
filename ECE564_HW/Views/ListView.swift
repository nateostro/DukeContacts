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
    @ObservedObject var dukePeople = DukePeople()
    
    var body: some View {
        NavigationView {
            List(){
            }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
