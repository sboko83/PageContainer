//
//  ActivityIndicatorView.swift
//  PageContainer
//
//  Created by Sergey Bokonyaev on 15.10.2021.
//

import SwiftUI

struct ActivityIndicatorView: UIViewRepresentable {
    
    @State var isAnimating: Bool = true
    var style: UIActivityIndicatorView.Style = .medium
    var color: UIColor = UIColor.label

    func makeUIView(context: UIViewRepresentableContext<ActivityIndicatorView>) -> UIActivityIndicatorView {
        let activityView = UIActivityIndicatorView(style: style)
        activityView.color = color
        return activityView
    }

    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<ActivityIndicatorView>) {
        isAnimating ? uiView.startAnimating() : uiView.stopAnimating()
    }
}
