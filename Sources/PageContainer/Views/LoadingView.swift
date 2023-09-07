//
//  LoadingView.swift
//  PageContainer
//
//  Created by Sergey Bokonyaev on 15.10.2021.
//

import SwiftUI

struct LoadingView: View {
    
    private let config = PageContainerConfig.shared
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.45)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text(config.strings.stringLoading)
                    .textStyle(TextStyle(font: config.fonts.loading,
                                         color: config.color.loading.text))
                    .multilineTextAlignment(.center)
                    .padding(.bottom)
                ActivityIndicatorView(isAnimating: true, style: .medium,
                                      color: UIColor(config.color.loading.text))
            }
            .padding(36.0)
            .background(config.color.loading.background)
            .cornerRadius(config.cornerRadius.base)
            .conditionalModifier(config.border.loading,
                                 PageContainerBorder(cornerRadius: config.cornerRadius.base,
                                                     width: config.size.border,
                                                     color: config.color.loading.border))
            .padding(.bottom, 40.0)
        }
    }
}
