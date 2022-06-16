//
//  PageContainerBorder.swift
//  PageContainer
//
//  Created by Sergey Bokonyaev on 14.04.2022.
//

import SwiftUI

public struct PageContainerBorder: ViewModifier {
    
    var cornerRadius: CGFloat
    var width: CGFloat
    var color: Color
    
    public init(cornerRadius: CGFloat = PageContainerConfig.sharedInstance.cornerRadius.base,
                  width: CGFloat = 1.0,
                  color: Color = .black) {
        self.cornerRadius = cornerRadius
        self.width = width
        self.color = color
    }
    
    public func body(content: Content) -> some View {
        content
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
            .overlay(RoundedRectangle(cornerRadius: cornerRadius)
                        .stroke(lineWidth: width)
                        .foregroundColor(color))
    }
    
}

public struct PageContainerTopBorder: ViewModifier {
    
    var cornerRadius: CGFloat
    var width: CGFloat
    var color: Color
    var backgroundColor: Color
    
    public init(cornerRadius: CGFloat = PageContainerConfig.sharedInstance.cornerRadius.base,
                width: CGFloat = 1.0,
                color: Color = .black,
                backgroundColor: Color = Color(UIColor.systemBackground)) {
        self.cornerRadius = cornerRadius
        self.width = width
        self.color = color
        self.backgroundColor = backgroundColor
    }
    
    public func body(content: Content) -> some View {
        content
            .clipShape(RoundedCorner(radius: cornerRadius, corners: [.topLeft, .topRight]))
            .overlay(RoundedCorner(radius: cornerRadius, corners: [.topLeft, .topRight])
                        .stroke(lineWidth: width)
                        .foregroundColor(color))
    }
    
}
