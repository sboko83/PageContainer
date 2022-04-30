//
//  PageContainerViewModel.swift
//  PageContainer
//
//  Created by Sergey Bokonyaev on 29.01.2022.
//

import SwiftUI
import Combine

open class PageContainerViewModel: ObservableObject {
    
    public init() {}
    
    // MARK: - ActionSheet
    
    @Published var hasActionSheet: Bool = false
    @Published var actionSheetTitle: String = ""
    @Published var actionSheetBody: AnyView = AnyView(EmptyView())
    @Published var actionSheetButtons: [ActionSheetButton] = []
    
    public func showActionSheet(title: String,
                                buttons: [ActionSheetButton]) {
        actionSheetTitle = title
        actionSheetBody = AnyView(EmptyView())
        actionSheetButtons = buttons
        
        withAnimation(.easeIn) {
            self.hasActionSheet = true
        }
    }
    
    public func showActionSheet(title: String,
                                body: AnyView,
                                buttons: [ActionSheetButton]) {
        actionSheetTitle = title
        actionSheetBody = body
        actionSheetButtons = buttons
        
        withAnimation(.easeIn) {
            self.hasActionSheet = true
        }
    }
    
    public func resetActionSheet() {
        withAnimation(.easeOut(duration: 0.5)) {
            self.hasActionSheet = false
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.actionSheetTitle = ""
            self.actionSheetBody = AnyView(EmptyView())
            self.actionSheetButtons = []
        }
    }
    
    // MARK: - Alert
    
    @Published var hasAlert: Bool = false
    @Published var alertTitle: String = ""
    @Published var alertText: String = ""
    @Published var alertIcon: String = ""
    @Published var alertIconColor: Color = .accentColor
    @Published var alertCompletion: (() -> Void) = {}
    
    
    public func showError(error: String) {
        showError(error: error, completion: {})
    }
    
    public func showError(error: String, completion: @escaping (() -> Void)) {
        showAlert(title: "", message: error,
                  icon: "multiply.circle", iconColor: Color(UIColor.systemRed),
                  completion: completion)
    }
    
    public func showMessage(message: String) {
        showMessage(title: "", message: message)
    }
    
    public func showMessage(message: String, completion: @escaping (() -> Void)) {
        showMessage(title: "", message: message, completion: completion)
    }
    
    public func showMessage(title: String, message: String) {
        showMessage(title: title, message: message, completion: {})
    }
    
    public func showMessage(title: String, message: String,
                            completion: @escaping (() -> Void)) {
        showAlert(title: title, message: message,
                  icon: "info.circle", iconColor: Color(UIColor.systemGreen),
                  completion: completion)
    }
    
    public func showAlert(title: String = "", message: String = "",
                          icon: String = "", iconColor: Color = .accentColor,
                          completion: @escaping (() -> Void) = {}) {
        alertTitle = title
        alertText = message
        alertIcon = icon
        alertIconColor = iconColor
        alertCompletion = completion
        
        withAnimation(.easeIn) {
            self.hasAlert = true
        }
    }
    
    public func resetAlert() {
        withAnimation(.easeOut(duration: 0.5)) {
            self.hasAlert = false
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.alertTitle = ""
            self.alertText = ""
            self.alertIcon = ""
            self.alertIconColor = .accentColor
            self.alertCompletion = {}
        }
    }
    
    // MARK: - BottomButtons
    
    @Published var hasBottomButtons: Bool = false
    @Published var bottomButtonsTitle: String = ""
    @Published var bottomButtonsButtons: [ActionSheetButton] = []
    
    public func showBottomButtons(buttons: [ActionSheetButton]) {
        showBottomButtons(title: "",
                          buttons: buttons)
    }
    
    public func showBottomButtons(title: String,
                                  buttons: [ActionSheetButton]) {
        bottomButtonsTitle = title
        bottomButtonsButtons = buttons
        
        withAnimation(.easeIn) {
            self.hasBottomButtons = true
        }
    }
    
    public func resetBottomButtons() {
        withAnimation(.easeOut(duration: 0.5)) {
            self.hasBottomButtons = false
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.bottomButtonsTitle = ""
            self.bottomButtonsButtons = []
        }
    }
    
    // MARK: Loading
    
    @Published var isLoading: Bool = false
    
    
    public func showLoading() {
        withAnimation(.easeIn) {
            self.isLoading = true
        }
    }
    
    public func hideLoading() {
        withAnimation(.easeOut) {
            self.isLoading = false
        }
    }
    
}
