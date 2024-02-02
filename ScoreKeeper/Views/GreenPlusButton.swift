//
//  GreenPlusButton.swift
//  ScoreKeeper
//
//  Created by Ivanov, D. (Dmitrii) on 30/01/2024.
//

import SwiftUI

struct GreenPlusButton: View {
    
    enum Size: CGFloat {
        case small = 26
        case medium = 50
    }
    
    let size: Size
    var clicked: (() -> Void)
    
    init(size: Size = .medium, clicked: @escaping () -> Void) {
        self.size = size
        self.clicked = clicked
    }
    
    var body: some View {
        Button {
            clicked()
        } label: {
            Image(systemName: "plus.square.fill")
                .resizable()
                .frame(width: size.rawValue, height: size.rawValue)
                .tint(.green)
        }
    }
}

struct GreenPlusButton_Previews: PreviewProvider {
    static var previews: some View {
        GreenPlusButton() {}
    }
}
