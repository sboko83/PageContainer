//
//  PageContainerButton.swift
//  PageContainer
//
//  Created by Sergey Bokonyaev on 28.04.2022.
//

import SwiftUI

public struct AlertViewButtonStyle: ButtonStyle {
    
    private let pcConfig = PageContainerConfig.sharedInstance
    
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .modifier(TextStyle(font: pcConfig.fonts.alert.buttonText,
                                color: pcConfig.color.alert.buttonText))
            .padding(.horizontal, 20.0)
            .padding(.vertical, 10.0)
            .background(pcConfig.color.alert.buttonBackground.cornerRadius(pcConfig.cornerRadius.button))
            .scaleEffect(configuration.isPressed ? 0.96 : 1.0)
    }
    
}

public struct ActionSheetButtonStyle: ButtonStyle {
    
    let selected: Bool
    
    public init(selected: Bool) {
        self.selected = selected
    }
    
    private let pcConfig = PageContainerConfig.sharedInstance
    
    public func makeBody(configuration: Configuration) -> some View {
        HStack {
            Spacer(minLength: 0.0)
            configuration.label
                .modifier(TextStyle(font: labelFont, color: labelColor))
                .padding(.vertical, selected ? 8.0 : 10.0)
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
    
    private var labelFont: Font {
        selected ? pcConfig.fonts.actionSheet.buttonSelectedText : pcConfig.fonts.actionSheet.buttonText
    }
}

public struct BottomButtonsButtonStyle: ButtonStyle {
    
    let selected: Bool
    
    public init(selected: Bool) {
        self.selected = selected
    }
    
    private let pcConfig = PageContainerConfig.sharedInstance
    
    public func makeBody(configuration: Configuration) -> some View {
        HStack {
            Spacer(minLength: 0.0)
            configuration.label
                .modifier(TextStyle(font: labelFont, color: labelColor))
                .padding(.vertical, selected ? 8.0 : 10.0)
            Spacer(minLength: 0.0)
        }
        .padding(.horizontal, 32.0)
        .background(backgroundColor)
        .cornerRadius(pcConfig.cornerRadius.button)
        .scaleEffect(configuration.isPressed ? 0.96 : 1.0)
    }
    
    private var labelColor: Color {
        selected ? pcConfig.color.bottomButtons.buttonSelectedText : pcConfig.color.bottomButtons.buttonText
    }
    
    private var backgroundColor: Color {
        selected ? pcConfig.color.bottomButtons.buttonSelectedBackground : pcConfig.color.bottomButtons.buttonBackground
    }
    
    private var labelFont: Font {
        selected ? pcConfig.fonts.bottomButtons.buttonSelectedText : pcConfig.fonts.bottomButtons.buttonText
    }
}
