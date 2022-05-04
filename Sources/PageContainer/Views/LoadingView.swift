//
//  LoadingView.swift
//  PageContainer
//
//  Created by Sergey Bokonyaev on 15.10.2021.
//

import SwiftUI

struct LoadingView: View {
    
    private let config = PageContainerConfig.sharedInstance
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.45)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text(config.strings.stringLoading)
                    .textStyle(LoadingTextStyle())
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
                                                     width: 1.0,
                                                     color: config.color.loading.border))
            .padding(.bottom, 40.0)
        }
    }
}