//
//  RoundedCornerShape.swift
//  PageContainer
//
//  Created by Sergey Bokonyaev on 15.10.2021.
//

import SwiftUI

public struct RoundedCorner: Shape {
    
    var radius: CGFloat
    var corners: UIRectCorner
    
    public init(radius: CGFloat = .infinity,
                corners: UIRectCorner = .allCorners) {
        self.radius = radius
        self.corners = corners
    }

    public func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect,
                                byRoundingCorners: corners,
                                cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View {
    
    public func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius,
                                corners: corners))
    }
    
}

public struct ThemeLeftCornersModifier: ViewModifier {
    
    var cornerRadius: CGFloat
    
    public init(cornerRadius: CGFloat = PageContainerConfig.shared.cornerRadius.base) {
        self.cornerRadius = cornerRadius
    }
    
    public func body(content: Content) -> some View {
        content
            .cornerRadius(cornerRadius, corners: [.topLeft, .bottomLeft])
    }
}

public struct ThemeRightCornersModifier: ViewModifier {
    
    var cornerRadius: CGFloat
    
    public init(cornerRadius: CGFloat = PageContainerConfig.shared.cornerRadius.base) {
        self.cornerRadius = cornerRadius
    }
    
    public func body(content: Content) -> some View {
        content
            .cornerRadius(cornerRadius, corners: [.topRight, .bottomRight])
    }
}

public struct ThemeTopCornersModifier: ViewModifier {
    
    var cornerRadius: CGFloat
    
    public init(cornerRadius: CGFloat = PageContainerConfig.shared.cornerRadius.base) {
        self.cornerRadius = cornerRadius
    }
    
    public func body(content: Content) -> some View {
        content
            .cornerRadius(cornerRadius, corners: [.topLeft, .topRight])
    }
}

public struct ThemeBottomCornersModifier: ViewModifier {
    
    var cornerRadius: CGFloat
    
    public init(cornerRadius: CGFloat = PageContainerConfig.shared.cornerRadius.base) {
        self.cornerRadius = cornerRadius
    }
    
    public func body(content: Content) -> some View {
        content
            .cornerRadius(cornerRadius, corners: [.bottomLeft, .bottomRight])
    }
}
