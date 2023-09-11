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
    
    private let config = PageContainerConfig.shared
    
    
    @Published var lockContentState: Bool = false
    
    
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
        
        withAnimation(config.animations.actionSheet.show) {
            self.lockContentState = true
            self.hasActionSheet = true
        }
    }
    
    public func showActionSheet(title: String,
                                body: AnyView,
                                buttons: [ActionSheetButton]) {
        actionSheetTitle = title
        actionSheetBody = body
        actionSheetButtons = buttons
        
        withAnimation(config.animations.actionSheet.show) {
            self.lockContentState = true
            self.hasActionSheet = true
        }
    }
    
    public func hideActionSheet() {
        withAnimation(config.animations.actionSheet.hide) {
            self.hasActionSheet = false
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.actionSheetTitle = ""
            self.actionSheetBody = AnyView(EmptyView())
            self.actionSheetButtons = []
            self.lockContentState = false
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
        
        withAnimation(config.animations.alert.show) {
            self.lockContentState = true
            self.hasAlert = true
        }
    }
    
    public func hideAlert() {
        withAnimation(config.animations.alert.hide) {
            self.hasAlert = false
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.alertTitle = ""
            self.alertText = ""
            self.alertIcon = ""
            self.alertIconColor = .accentColor
            self.alertCompletion = {}
            self.lockContentState = false
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
        
        withAnimation(config.animations.bottomButtons.show) {
            self.lockContentState = true
            self.hasBottomButtons = true
        }
    }
    
    public func hideBottomButtons() {
        withAnimation(config.animations.bottomButtons.hide) {
            self.hasBottomButtons = false
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.bottomButtonsTitle = ""
            self.bottomButtonsButtons = []
            self.lockContentState = false
        }
    }
    
    // MARK: Loading
    
    @Published var isLoading: Bool = false
    
    
    public func showLoading() {
        withAnimation(config.animations.loading.show) {
            self.lockContentState = true
            self.isLoading = true
        }
    }
    
    public func hideLoading() {
        withAnimation(config.animations.loading.hide) {
            self.isLoading = false
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.lockContentState = false
        }
    }
    
    // MARK: - Custom view
    
    @Published var hasCustomView: Bool = false
    @Published var customView: AnyView = AnyView(EmptyView())
    @Published var closeCustomViewByTap: Bool = true
    
    
    public func showCustomView(_ custom: AnyView,
                               closeByTap: Bool = true) {
        closeCustomViewByTap = closeByTap
        customView = custom
        
        withAnimation(config.animations.customView.show) {
            self.lockContentState = true
            self.hasCustomView = true
        }
    }
    
    public func hideCustomView() {
        customView = AnyView(EmptyView())
        closeCustomViewByTap = true
        
        withAnimation(config.animations.customView.hide) {
            self.hasCustomView = false
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.lockContentState = false
        }
    }
    
}
