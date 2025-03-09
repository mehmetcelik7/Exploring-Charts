//
//  ArcView.swift
//  Exploring Charts
//
//  Created by mehmet Çelik on 4.03.2025.
//

import SwiftUI

struct ArcView: View {
    let color: Color
    let startRadius: CGFloat
    let endRadius: CGFloat
    let startTrim: CGFloat
    let endTrim: CGFloat
    let rotate:CGFloat
    
    @State private var finalTrim: CGFloat = 0
    
    var lineWidth: CGFloat {
        endRadius - startRadius
    }
    
    var finalRadius: CGFloat {
        endRadius-lineWidth
    }
    
    var body: some View {
        Circle()
            .trim(from: startTrim, to: finalTrim)
            .stroke(color,style: StrokeStyle(lineWidth: lineWidth,lineCap: .round))
            .rotationEffect(.degrees(rotate))
            .frame(width: finalRadius, height: endRadius)
            .onAppear {
                withAnimation {
                    finalTrim = endTrim
                }
                
            }
    }
}

#Preview {
    ZStack {
        ArcView(
            color: .chocolate,
            startRadius: 90,
            endRadius: 100,
            startTrim: 0.25,
            endTrim: 0.75,
            rotate: 30
        )
        Circle()
            .stroke()
            .frame(width: 100,height: 100)
    }
}
