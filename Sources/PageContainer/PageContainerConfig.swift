//
//  PageContainerConfig.swift
//  PageContainer
//
//  Created by Sergey Bokonyaev on 23.04.2022.
//

import SwiftUI

open class PageContainerConfig {
    
    public static let sharedInstance = PageContainerConfig()
    private init() {}
    
    public var border = Border()
    public var color = Colors()
    public var cornerRadius = CornerRadius()
    public var size = Sizes()
    public var strings = Strings()
    public var animations = Animations()
    public var fonts = Fonts()
    public var alignments = Alignments()
    
    
    // MARK: - Methods
    
    public func setAlwaysDark() {
        allBackgrounds(color: Color.black)
        allTexts(color: Color.white)
        allBorders(color: Color(UIColor.darkGray))
        allBordersVisible(true)
    }
    
    public func allTexts(color: Color) {
        self.color.loading.text = color
        self.color.alert.title = color
        self.color.alert.text = color
        self.color.actionSheet.title = color
        self.color.actionSheet.buttonText = color
        self.color.actionSheet.buttonSelectedText = color
        self.color.bottomButtons.title = color
        self.color.bottomButtons.buttonText = color
        self.color.bottomButtons.buttonSelectedText = color
    }
    
    public func allBackgrounds(color: Color) {
        self.color.loading.background = color
        self.color.alert.background = color
        self.color.actionSheet.background = color
        self.color.bottomButtons.background = color
    }
    
    public func allBordersVisible(_ state: Bool) {
        border.alert = state
        border.actionSheet = state
        border.bottomButtons = state
        border.loading = state
    }
    
    public func allBorders(color: Color) {
        self.color.loading.border = color
        self.color.alert.border = color
        self.color.actionSheet.border = color
        self.color.bottomButtons.border = color
    }
    
    public func restoreDefaults() {
        border = Border()
        color = Colors()
        cornerRadius = CornerRadius()
        size = Sizes()
        strings = Strings()
        animations = Animations()
        fonts = Fonts()
        alignments = Alignments()
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
            public var title: Color
            public var text: Color
            public var border: Color
            
            public var buttonText: Color
            public var buttonBackground: Color
            
            internal init(background: Color = Color(UIColor.systemBackground),
                          title: Color = Color(UIColor.label),
                          text: Color = Color(UIColor.label),
                          border: Color = Color(UIColor.label),
                          buttonText: Color = Color(UIColor.label),
                          buttonBackground: Color = Color(UIColor.systemGray4)) {
                self.background = background
                self.title = title
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
        
        public var border: CGFloat
        public var alertMinWidth: CGFloat
        
        public init(border: CGFloat = 1.0,
                    alertMinWidth: CGFloat = 120.0) {
            self.border = border
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
    
    public struct Animations {
        
        public struct Parts {
            
            public var show: Animation?
            public var hide: Animation?
            
            public init(show: Animation? = .easeIn,
                        hide: Animation? = .easeOut(duration: 0.5)) {
                self.show = show
                self.hide = hide
            }
        }
        
        public var loading: Parts
        public var alert: Parts
        public var actionSheet: Parts
        public var bottomButtons: Parts
        public var customView: Parts
        
        public init(loading: Parts = Parts(),
                    alert: Parts = Parts(),
                    actionSheet: Parts = Parts(),
                    bottomButtons: Parts = Parts(),
                    customView: Parts = Parts()) {
            self.loading = loading
            self.alert = alert
            self.actionSheet = actionSheet
            self.bottomButtons = bottomButtons
            self.customView = customView
        }
    }
    
    public struct Fonts {
        
        public var loading: Font = Font.system(size: 16.0, weight: .bold)
        public var alert: Fonts.Alert = Fonts.Alert()
        public var actionSheet: Fonts.ActionSheet = Fonts.ActionSheet()
        public var bottomButtons: Fonts.BottomButtons = Fonts.BottomButtons()
        
        public struct Alert {
            
            public var title: Font
            public var text: Font
            public var buttonText: Font
            
            public init(title: Font = Font.system(size: 16.0, weight: .bold),
                        text: Font = Font.system(size: 14.0, weight: .regular),
                        buttonText: Font = Font.system(size: 14.0, weight: .medium)) {
                self.title = title
                self.text = text
                self.buttonText = buttonText
            }
        }
        
        public struct ActionSheet {
            
            public var title: Font
            public var buttonText: Font
            public var buttonSelectedText: Font
            
            public init(title: Font = Font.system(size: 16.0, weight: .bold),
                        buttonText: Font = Font.system(size: 16.0, weight: .semibold),
                        buttonSelectedText: Font = Font.system(size: 18.0, weight: .bold)) {
                self.title = title
                self.buttonText = buttonText
                self.buttonSelectedText = buttonSelectedText
            }
        }
        
        public struct BottomButtons {
            
            public var title: Font
            public var buttonText: Font
            public var buttonSelectedText: Font
            
            public init(title: Font = Font.system(size: 16.0, weight: .bold),
                        buttonText: Font = Font.system(size: 16.0, weight: .semibold),
                        buttonSelectedText: Font = Font.system(size: 18.0, weight: .bold)) {
                self.title = title
                self.buttonText = buttonText
                self.buttonSelectedText = buttonSelectedText
            }
        }
    }
    
    public struct Alignments {
        
        public var actionSheet: Alignment
        public var customView: Alignment
        
        public init(actionSheet: Alignment = .center,
                    customView: Alignment = .center) {
            self.actionSheet = actionSheet
            self.customView = customView
        }
    }
    
}
