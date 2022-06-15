//
//  PageContainerText.swift
//  PageContainer
//
//  Created by Sergey Bokonyaev on 14.04.2022.
//

import SwiftUI

struct TextStyle: ViewModifier {
    
    var color: Color
    var font: Font
    
    init(font: Font = Font.system(size: 14.0, weight: .regular),
         color: Color = Color(UIColor.label)) {
        self.color = color
        self.font = font
    }
    
    func body(content: Content) -> some View {
        return content
            .font(font)
            .foregroundColor(self.color)
    }
}
