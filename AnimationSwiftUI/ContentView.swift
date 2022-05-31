//
//  ContentView.swift
//  AnimationSwiftUI
//
//  Created by Кирилл on 31.05.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var animationIsShowing = false
    
    var body: some View {
        ZStack {
            Color(.gray)
                .ignoresSafeArea()

            VStack {
                Spacer()
                if animationIsShowing {
                    AnimationView()
                        .frame(width: 200, height: 200)
                        .transition(.leadingSlide)
                }
                
                Spacer()
                Button(action: buttonAction, label: {
                    Text(animationIsShowing ? "Hide animation" :"Show animation")
                })
                .padding(40)
                .font(.largeTitle)
                .foregroundColor(.orange)
            }
        }
    }
    private func buttonAction() {
        withAnimation {
            animationIsShowing.toggle()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension AnyTransition {
    static var leadingSlide: AnyTransition {
        let insertion = AnyTransition.move(edge: .top)
            .combined(with: .scale)
        let removal = AnyTransition.scale
            .combined(with: .opacity)
        return .asymmetric(insertion: insertion, removal: removal)
    }
}
