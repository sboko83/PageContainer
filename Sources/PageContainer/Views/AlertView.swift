//
//  AlertView.swift
//  PageContainer
//
//  Created by Sergey Bokonyaev on 14.04.2022.
//

import SwiftUI

struct AlertView: View {
    
    @ObservedObject var model: PageContainerViewModel
    
    private let config = PageContainerConfig.shared
    
    var body: some View {
        ZStack {
            Button(action: buttonPressed) {
                VStack {
                    Spacer(minLength: 0.0)
                    HStack {
                        Spacer(minLength: 0.0)
                        Text("")
                        Spacer(minLength: 0.0)
                    }
                    Spacer(minLength: 0.0)
                }
            }
            VStack {
                Spacer(minLength: 0.0)
                HStack {
                    VStack(spacing: 0) {
                        if !model.alertIcon.isEmpty {
                            ImageSystemView(name: model.alertIcon,
                                            size: 36.0, color: model.alertIconColor)
                                .padding(.bottom)
                        }
                        
                        if !model.alertTitle.isEmpty {
                            Text(model.alertTitle)
                                .textStyle(TextStyle(font: config.fonts.alert.title,
                                                     color: config.color.alert.title))
                                .padding(.bottom, 8.0)
                        }
                        
                        if !model.alertText.isEmpty {
                            Text(model.alertText)
                                .textStyle(TextStyle(font: config.fonts.alert.text,
                                                     color: config.color.alert.text))
                        }
                        
                        Button(action: buttonPressed) {
                            Text(config.strings.stringBtnOK)
                        }
                        .buttonStyle(AlertViewButtonStyle())
                        .padding(.top)
                    }
                    .frame(minWidth: config.size.alertMinWidth)
                    .padding()
                    .background(config.color.alert.background)
                    .cornerRadius(config.cornerRadius.base)
                    .conditionalModifier(config.border.alert,
                                         PageContainerBorder(cornerRadius: config.cornerRadius.base,
                                                             width: config.size.border,
                                                             color: config.color.alert.border))
                    .padding()
                }
                Spacer(minLength: 0.0)
            }
        }
    }
    
    private func buttonPressed() {
        model.alertCompletion()
        model.hideAlert()
    }
}
