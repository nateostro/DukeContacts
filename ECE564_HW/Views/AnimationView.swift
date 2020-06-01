//
//  AnimationModal.swift
//  ECE564_HW
//
//  Created by Nathan Ostrowski on 5/30/20.
//  Copyright © 2020 ECE564. All rights reserved.
//

import SwiftUI
import AVFoundation
var audioPlayer: AVAudioPlayer!

struct AnimationView: View {
    @State var guitarIsBouncing : Bool = false
    @State var guitarIsShaking : Bool = false
    @State var notesArePlaying : Bool = false
    @State var showNoteOne = false
    @State var showNoteTwo = false
    @State var showNoteThree = false
    @State var opacity = 1
    @State var didSwipe = false
    @State var startSwipePosition : CGPoint = CGPoint(x: 0.0, y: 0.0)
    @State var endSwipePosition : CGPoint = CGPoint(x: 0.0, y: 0.0)
    @State var isPlayingSound : Bool = false
            
    var body: some View {
        ZStack {
            Image("guitar")
                .offset(y: guitarIsBouncing ? 0 : -300)
                .shadow(radius: 4)
                .rotationEffect(.degrees(guitarIsShaking ? 4 : 0)).animation(Animation.interpolatingSpring(stiffness: 150, damping: 5))
                .onAppear(perform: {
                    withAnimation(Animation.interpolatingSpring(stiffness: 110, damping: 10)) {
                        self.guitarIsBouncing.toggle()
                    }
                }).gesture(DragGesture().onChanged({ value in
                    self.startSwipePosition = value.startLocation
                }).onEnded({ value in
                    self.endSwipePosition = value.predictedEndLocation
                    self.guitarIsShaking.toggle()
                    self.didSwipe = true
                    self.isPlayingSound.toggle()
                    Sounds.playSounds(soundfile: "D_Chord.mp3")
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                        self.didSwipe = false
                    }
                }))
            
            Image(systemName: "music.note")
                .resizable()
                .frame(width: (didSwipe ? 20 : 5), height: (didSwipe ? 30 : 5))
                .opacity(didSwipe ? 1 : 0)
                .position(x: (didSwipe ? startSwipePosition.x : endSwipePosition.x), y: (didSwipe ? startSwipePosition.y+150 : endSwipePosition.y+150))
                .rotationEffect(.degrees(showNoteOne ? -10 : 10))
                //.offset(x: 50, y: 340)
                .animation(Animation.easeOut(duration: 0.7).delay(0))

            
            Image(systemName: "music.note")
                .resizable()
                .frame(width: (didSwipe ? 20 : 5), height: (didSwipe ? 30 : 5))
                .opacity(didSwipe ? 1 : 0)
                .rotationEffect(.degrees(didSwipe ? -10 : 10))
                .position(x: (didSwipe ? startSwipePosition.x-5 : endSwipePosition.x-5), y: (didSwipe ? startSwipePosition.y+160 : endSwipePosition.y+160))
                //.offset(x: 50, y: 340)
                .animation(Animation.easeOut(duration: 0.7).delay(0.2))

            
            Image(systemName: "music.note")
                .resizable()
                .frame(width: (didSwipe ? 20 : 5), height: (didSwipe ? 30 : 5))
                .opacity(didSwipe ? 1 : 0)
                .rotationEffect(.degrees(didSwipe ? -10 : 10))
                .position(x: (didSwipe ? startSwipePosition.x : endSwipePosition.x), y: (didSwipe ? startSwipePosition.y+170 : endSwipePosition.y+170))
                //.offset(x: 50, y: 340)
                .animation(Animation.easeOut(duration: 0.7).delay(0.4))
            
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

class Sounds {

  static var audioPlayer:AVAudioPlayer?

  static func playSounds(soundfile: String) {

      if let path = Bundle.main.path(forResource: soundfile, ofType: nil){

          do{
              audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
              audioPlayer?.prepareToPlay()
              audioPlayer?.play()

          }catch {
              print("Error")
          }
      }
   }
}

struct AnimationModal_Previews: PreviewProvider {
    static var previews: some View {
        AnimationView()
    }
}
