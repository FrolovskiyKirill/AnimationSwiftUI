//
//  LeafView.swift
//  AnimationSwiftUI
//
//  Created by Кирилл on 31.05.2022.
//

import SwiftUI

struct LeafView: View {
  let rotation: Angle
  let isCurrent: Bool

  var body: some View {
      Image(systemName: "leaf.fill")
          .resizable()
          .aspectRatio(contentMode: .fill)
      .foregroundColor(isCurrent ? Color.yellow : .pink)
      .frame(width: 70, height: 70)
      .offset(
        isCurrent
          ? .init(width: 40, height: 0)
          : .init(width: 115, height: 40)
      )
      .scaleEffect(isCurrent ? 0.5 : 1)
      .rotationEffect(rotation)
      .animation(.easeInOut(duration: 1.5))
      
  }
}
