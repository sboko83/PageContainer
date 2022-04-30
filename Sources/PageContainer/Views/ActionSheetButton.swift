//
//  ActionSheetButton.swift
//  PageContainer
//
//  Created by Sergey Bokonyaev on 23.04.2022.
//

import SwiftUI

public struct ActionSheetButton {
    
    var title: String
    
    var isClose: Bool = true
    var selected: Bool = false
    
    var pressHandler: (() -> Void)?
    
}
