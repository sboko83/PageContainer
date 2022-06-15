//
//  ActivityIndicatorView.swift
//  PageContainer
//
//  Created by Sergey Bokonyaev on 15.10.2021.
//

import SwiftUI

struct ActivityIndicatorView: UIViewRepresentable {
    
    @State var isAnimating: Bool
    var style: UIActivityIndicatorView.Style
    var color: UIColor
    
    public init(isAnimating: Bool = true,
                style: UIActivityIndicatorView.Style = .medium,
                color: UIColor = UIColor.label) {
        self.isAnimating = isAnimating
        self.style = style
        self.color = color
    }

    func makeUIView(context: UIViewRepresentableContext<ActivityIndicatorView>) -> UIActivityIndicatorView {
        let activityView = UIActivityIndicatorView(style: style)
        activityView.color = color
        return activityView
    }

    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<ActivityIndicatorView>) {
        isAnimating ? uiView.startAnimating() : uiView.stopAnimating()
    }
}
