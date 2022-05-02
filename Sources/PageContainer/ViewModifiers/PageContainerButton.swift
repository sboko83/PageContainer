//
//  PageContainerButton.swift
//  PageContainer
//
//  Created by Sergey Bokonyaev on 28.04.2022.
//

import SwiftUI

struct ActionSheetButtonStyle: ButtonStyle {
    
    let selected: Bool
    
    private let pcConfig = PageContainerConfig.sharedInstance
    
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            Spacer(minLength: 0.0)
            configuration.label
                .modifier(TextStyle(size: selected ? 18.0 : 16.0,
                                    weight: selected ? .bold : .semibold,
                                    color: labelColor))
                .padding(.vertical, 8.0)
            Spacer(minLength: 0.0)
        }
        .padding(.horizontal, 32.0)
        .background(backgroundColor)
        .cornerRadius(pcConfig.cornerRadius.button)
        .scaleEffect(configuration.isPressed ? 0.96 : 1.0)
    }
    
    private var labelColor: Color {
        selected ? pcConfig.color.actionSheet.buttonSelectedText : pcConfig.color.actionSheet.buttonText
    }
    
    private var backgroundColor: Color {
        selected ? pcConfig.color.actionSheet.buttonSelectedBackground : pcConfig.color.actionSheet.buttonBackground
    }
    
}

struct AlertViewButtonStyle: ButtonStyle {
    
    private let pcConfig = PageContainerConfig.sharedInstance
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .modifier(AlertButtonStyle())
            .padding(.horizontal, 20.0)
            .padding(.vertical, 8.0)
            .background(pcConfig.color.alert.buttonBackground.cornerRadius(pcConfig.cornerRadius.button))
            .scaleEffect(configuration.isPressed ? 0.96 : 1.0)
    }
    
}
