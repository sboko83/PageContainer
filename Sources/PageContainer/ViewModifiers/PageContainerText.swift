//
//  PageContainerText.swift
//  PageContainer
//
//  Created by Sergey Bokonyaev on 14.04.2022.
//

import SwiftUI

struct TextStyle: ViewModifier {
    
    var size: CGFloat = 14.0
    var weight: Font.Weight = .regular
    var color: Color = Color(UIColor.label)
    
    func body(content: Content) -> some View {
        return content
            .font(Font.system(size: self.size, weight: self.weight))
            .foregroundColor(self.color)
    }
}

// MARK: - Loading

struct LoadingTextStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .modifier(TextStyle(size: 16.0, weight: .bold,
                                color: PageContainerConfig.sharedInstance.color.loading.text))
    }
}

// MARK: - Alert

struct AlertTitleStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .modifier(TextStyle(size: 16.0, weight: .bold,
                                color: PageContainerConfig.sharedInstance.color.alert.text))
    }
}

struct AlertTextStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .modifier(TextStyle(size: 14.0, weight: .regular,
                                color: PageContainerConfig.sharedInstance.color.alert.text))
    }
}

struct AlertButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .modifier(TextStyle(size: 14.0, weight: .medium,
                                color: PageContainerConfig.sharedInstance.color.alert.buttonText))
    }
}

// MARK: - ActionSheet

struct ActionSheetTitleStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .modifier(TextStyle(size: 16.0, weight: .bold,
                                color: PageContainerConfig.sharedInstance.color.actionSheet.title))
    }
}

// MARK: - BottomButtons

struct BottomButtonsTitleStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .modifier(TextStyle(size: 14.0, weight: .bold,
                                color: PageContainerConfig.sharedInstance.color.bottomButtons.title))
    }
}
