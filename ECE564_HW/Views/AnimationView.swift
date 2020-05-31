//
//  AnimationModal.swift
//  ECE564_HW
//
//  Created by Nathan Ostrowski on 5/30/20.
//  Copyright © 2020 ECE564. All rights reserved.
//

import SwiftUI

struct AnimationView: View {
    @State var guitarIsBouncing : Bool = false
    @State var guitarIsShaking : Bool = false
    @State var notesArePlaying : Bool = false
    @State var showNoteOne = false
    @State var showNoteTwo = false
    @State var showNoteThree = false
    @State var opacity = 1
    
    var body: some View {
        ZStack {
            Image("guitar")
                .offset(y: guitarIsBouncing ? 0 : -300)
                .rotationEffect(.degrees(guitarIsShaking ? 2 : 0))
                .onAppear(perform: {
                    withAnimation(Animation.interpolatingSpring(stiffness: 110, damping: 10)) {
                        self.guitarIsBouncing.toggle()
                    }
                    withAnimation(Animation.interpolatingSpring(stiffness: 150, damping: 5).repeatForever(autoreverses: true).delay(2)) {
                        self.guitarIsShaking.toggle()
                    }
                })
            

            Image(systemName: "music.note") // Splash
                .resizable()
                //.opacity(showSplash ? 0 : 1)
                .frame(width: (showNoteOne ? 20 : 5), height: (showNoteOne ? 30 : 5))
                .opacity(showNoteOne ? 1 : 0)
                .position(x: (guitarIsShaking ? 185 : 190), y: (guitarIsShaking ? 220 : 230))
                .rotationEffect(.degrees(showNoteOne ? -5 : 5))
                //.offset(x: 50, y: 340)
                .animation(Animation.easeIn(duration: 0.5).repeatForever(autoreverses: true).delay(2.3))
                .onAppear() {
                    self.showNoteOne.toggle()
                }
            
            Image(systemName: "music.note") // Splash
                .resizable()
                //.opacity(showSplash ? 0 : 1)
                .frame(width: (showNoteTwo ? 20 : 5), height: (showNoteTwo ? 30 : 5))
                .opacity(showNoteTwo ? 1 : 0)
                .rotationEffect(.degrees(showNoteTwo ? -5 : 5))
                .position(x: 275, y: 320)
                //.offset(x: 50, y: 340)
                .animation(Animation.easeIn(duration: 0.5).repeatForever(autoreverses: true).delay(2.46))
                .onAppear() {
                    self.showNoteTwo.toggle()
                }
            
            Image(systemName: "music.note") // Splash
                .resizable()
                //.opacity(showSplash ? 0 : 1)
                .frame(width: (showNoteThree ? 20 : 5), height: (showNoteThree ? 30 : 5))
                .opacity(showNoteThree ? 1 : 0)
                .rotationEffect(.degrees(showNoteThree ? -5 : 5))
                .position(x: 300, y: 230)
                //.offset(x: 50, y: 340)
                .animation(Animation.easeIn(duration: 0.5).repeatForever(autoreverses: true).delay(2.62))
                .onAppear() {
                    self.showNoteThree.toggle()
                }
                
            
            
        }
    }

}

struct Blur: UIViewRepresentable {
    var style: UIBlurEffect.Style = .systemMaterial
    func makeUIView(context: Context) -> UIVisualEffectView {
        return UIVisualEffectView(effect: UIBlurEffect(style: style))
    }
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = UIBlurEffect(style: style)
    }
}

struct AnimationModal_Previews: PreviewProvider {
    static var previews: some View {
        AnimationView()
    }
}
