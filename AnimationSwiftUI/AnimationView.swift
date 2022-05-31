//
//  AnimationView.swift
//  AnimationSwiftUI
//
//  Created by Кирилл on 31.05.2022.
//

import SwiftUI

struct AnimationView: View {
    
    let leavesCount = 10
    @State private var currentIndex = -1
    
    var body: some View {
        VStack {
            ZStack {
                ForEach(0..<leavesCount, id: \.self) { index in
                    LeafView(
                        rotation: .init(degrees: .init(index) / .init(leavesCount) * 360),
                        isCurrent: index == currentIndex
                    )
                }
            }
            .onAppear(perform: animate)
        }
    }
    
    private func animate() {
        Timer.scheduledTimer(withTimeInterval: 0.15, repeats: true) { timer in
            currentIndex = (currentIndex + 1) % leavesCount
        }
    }
}

struct SpinnerView_Previews : PreviewProvider {
    static var previews: some View {
        AnimationView()
    }
}

