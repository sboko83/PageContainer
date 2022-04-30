//
//  ActionSheetButton.swift
//  PageContainer
//
//  Created by Sergey Bokonyaev on 23.04.2022.
//

import SwiftUI

public struct ActionSheetButton {
    
    public var title: String
    
    public var isClose: Bool = true
    public var selected: Bool = false
    
    public var pressHandler: (() -> Void)?
    
    public init(title: String,
                isClose: Bool = true,
                selected: Bool = false,
                pressHandler: (() -> Void)? = nil) {
        self.title = title
        self.isClose = isClose
        self.selected = selected
        self.pressHandler = pressHandler
    }
    
}
