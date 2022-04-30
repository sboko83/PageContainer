//
//  RoundedCornerShape.swift
//  PageContainer
//
//  Created by Sergey Bokonyaev on 15.10.2021.
//

import SwiftUI

struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

struct ThemeLeftCornersModifier: ViewModifier {
    var cornerRadius: CGFloat = PageContainerConfig.sharedInstance.cornerRadius.base
    func body(content: Content) -> some View {
        content
            .cornerRadius(cornerRadius, corners: [.topLeft, .bottomLeft])
    }
}

struct ThemeRightCornersModifier: ViewModifier {
    var cornerRadius: CGFloat = PageContainerConfig.sharedInstance.cornerRadius.base
    func body(content: Content) -> some View {
        content
            .cornerRadius(cornerRadius, corners: [.topRight, .bottomRight])
    }
}

struct ThemeTopCornersModifier: ViewModifier {
    var cornerRadius: CGFloat = PageContainerConfig.sharedInstance.cornerRadius.base
    func body(content: Content) -> some View {
        content
            .cornerRadius(cornerRadius, corners: [.topLeft, .topRight])
    }
}

struct ThemeBottomCornersModifier: ViewModifier {
    var cornerRadius: CGFloat = PageContainerConfig.sharedInstance.cornerRadius.base
    func body(content: Content) -> some View {
        content
            .cornerRadius(cornerRadius, corners: [.bottomLeft, .bottomRight])
    }
}
