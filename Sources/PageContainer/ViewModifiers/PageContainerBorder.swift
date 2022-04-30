//
//  PageContainerBorder.swift
//  PageContainer
//
//  Created by Sergey Bokonyaev on 14.04.2022.
//

import SwiftUI

struct PageContainerBorder: ViewModifier {
    
    var cornerRadius: CGFloat = PageContainerConfig.sharedInstance.cornerRadius.base
    var width: CGFloat = 1.0
    var color: Color = .black
    
    func body(content: Content) -> some View {
        content
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
            .overlay(RoundedRectangle(cornerRadius: cornerRadius)
                        .stroke(lineWidth: width)
                        .foregroundColor(color))
    }
    
}

struct PageContainerTopBorder: ViewModifier {
    
    var cornerRadius: CGFloat = PageContainerConfig.sharedInstance.cornerRadius.base
    var width: CGFloat = 1.0
    var color: Color = .black
    var backgroundColor: Color = Color(UIColor.systemBackground)
    
    func body(content: Content) -> some View {
        content
            .clipShape(RoundedCorner(radius: cornerRadius, corners: [.topLeft, .topRight]))
            .overlay(RoundedCorner(radius: cornerRadius, corners: [.topLeft, .topRight])
                        .stroke(lineWidth: width)
                        .foregroundColor(color))
    }
    
}
