//
//  PageContainerConfig.swift
//  PageContainer
//
//  Created by Sergey Bokonyaev on 23.04.2022.
//

import SwiftUI

//typealias PCConfig = PageContainerConfig

public final class PageContainerConfig {
    
    public static let sharedInstance = PageContainerConfig()
    private init() {}
    
    public var border = Border()
    public var color = Colors()
    public var cornerRadius = CornerRadius()
    public var size = Sizes()
    public var strings = Strings()
    
    public func restoreDefaults() {
        border = Border()
        color = Colors()
        cornerRadius = CornerRadius()
        size = Sizes()
        strings = Strings()
    }
    
    // MARK: - Default values
    
    public struct Border {
        var loading: Bool = true
        var alert: Bool = true
        var actionSheet: Bool = true
        var bottomButtons: Bool = true
    }
    
    public struct Colors {
        
        public var loading = Loading()
        public var alert = Alert()
        public var actionSheet = ActionSheet()
        public var bottomButtons = BottomButtons()
        
        public struct Loading {
            var background: Color = Color(UIColor.systemBackground)
            var text: Color = Color(UIColor.label)
            var border: Color = Color(UIColor.label)
        }
        
        public struct Alert {
            var background: Color = Color(UIColor.systemBackground)
            var text: Color = Color(UIColor.label)
            var button: Color = Color(UIColor.systemGray4)
            var textButton: Color = Color(UIColor.label)
            var border: Color = Color(UIColor.label)
        }
        
        public struct ActionSheet {
            var background: Color = Color(UIColor.systemBackground)
            var title: Color = Color(UIColor.label)
            var border: Color = Color(UIColor.label)
            
            var buttonText: Color = Color(UIColor.label)
            var buttonBackground: Color = Color(UIColor.systemGray4)
            var buttonSelectedText: Color = Color(UIColor.label)
            var buttonSelectedBackground: Color = .accentColor
        }
        
        public struct BottomButtons {
            var background: Color = Color(UIColor.systemBackground)
            var title: Color = Color(UIColor.label)
            var border: Color = Color(UIColor.label)
        }
    }
    
    public struct CornerRadius {
        var base: CGFloat = 24.0
        var button: CGFloat = 16.0
    }
    
    public struct Sizes {
        var alertMinWidth: CGFloat = 120.0
    }
    
    public struct Strings {
        var stringLoading: String = "Loading..."
        var stringBtnOK: String = "OK"
    }
    
}
