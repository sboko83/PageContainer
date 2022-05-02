//
//  PageContainerConfig.swift
//  PageContainer
//
//  Created by Sergey Bokonyaev on 23.04.2022.
//

import SwiftUI

//typealias PCConfig = PageContainerConfig

open class PageContainerConfig {
    
    public static let sharedInstance = PageContainerConfig()
    private init() {}
    
    public var border = Border()
    public var color = Colors()
    public var cornerRadius = CornerRadius()
    public var size = Sizes()
    public var strings = Strings()
    
    // MARK: - Methods
    
    public func allBordersVisible(_ state: Bool) {
        border.alert = state
        border.actionSheet = state
        border.bottomButtons = state
        border.loading = state
    }
    
    public func restoreDefaults() {
        border = Border()
        color = Colors()
        cornerRadius = CornerRadius()
        size = Sizes()
        strings = Strings()
    }
    
    // MARK: - Default values
    
    public struct Border {
        
        public var loading: Bool
        public var alert: Bool
        public var actionSheet: Bool
        public var bottomButtons: Bool
        
        public init(loading: Bool = true,
                    alert: Bool = true,
                    actionSheet: Bool = true,
                    bottomButtons: Bool = true) {
            self.loading = loading
            self.alert = alert
            self.actionSheet = actionSheet
            self.bottomButtons = bottomButtons
        }
    }
    
    public struct Colors {
        
        public var loading = Loading()
        public var alert = Alert()
        public var actionSheet = ActionSheet()
        public var bottomButtons = BottomButtons()
        
        public struct Loading {
            
            public var background: Color
            public var text: Color
            public var border: Color
            
            public init(background: Color = Color(UIColor.systemBackground),
                        text: Color = Color(UIColor.label),
                        border: Color = Color(UIColor.label)) {
                self.background = background
                self.text = text
                self.border = border
            }
        }
        
        public struct Alert {
            
            public var background: Color
            public var text: Color
            public var border: Color
            
            public var buttonText: Color
            public var buttonBackground: Color
            
            internal init(background: Color = Color(UIColor.systemBackground),
                          text: Color = Color(UIColor.label),
                          border: Color = Color(UIColor.label),
                          buttonText: Color = Color(UIColor.label),
                          buttonBackground: Color = Color(UIColor.systemGray4)) {
                self.background = background
                self.text = text
                self.border = border
                self.buttonText = buttonText
                self.buttonBackground = buttonBackground
            }
        }
        
        public struct ActionSheet {
            
            public var background: Color
            public var title: Color
            public var border: Color
            
            public var buttonText: Color
            public var buttonBackground: Color
            public var buttonSelectedText: Color
            public var buttonSelectedBackground: Color
            
            public init(background: Color = Color(UIColor.systemBackground),
                        title: Color = Color(UIColor.label),
                        border: Color = Color(UIColor.label),
                        buttonText: Color = Color(UIColor.label),
                        buttonBackground: Color = Color(UIColor.systemGray4),
                        buttonSelectedText: Color = Color(UIColor.label),
                        buttonSelectedBackground: Color = .accentColor) {
                self.background = background
                self.title = title
                self.border = border
                self.buttonText = buttonText
                self.buttonBackground = buttonBackground
                self.buttonSelectedText = buttonSelectedText
                self.buttonSelectedBackground = buttonSelectedBackground
            }
        }
        
        public struct BottomButtons {
            
            public var background: Color
            public var title: Color
            public var border: Color
            
            public init(background: Color = Color(UIColor.systemBackground),
                          title: Color = Color(UIColor.label),
                          border: Color = Color(UIColor.label)) {
                self.background = background
                self.title = title
                self.border = border
            }
        }
    }
    
    public struct CornerRadius {
        
        public var base: CGFloat
        public var button: CGFloat
        
        public init(base: CGFloat = 24.0,
                    button: CGFloat = 16.0) {
            self.base = base
            self.button = button
        }
    }
    
    public struct Sizes {
        
        public var alertMinWidth: CGFloat
        
        public init(alertMinWidth: CGFloat = 120.0) {
            self.alertMinWidth = alertMinWidth
        }
    }
    
    public struct Strings {
        
        public var stringLoading: String
        public var stringBtnOK: String
        
        public init(stringLoading: String = "Loading...",
                    stringBtnOK: String = "OK") {
            self.stringLoading = stringLoading
            self.stringBtnOK = stringBtnOK
        }
    }
    
}
