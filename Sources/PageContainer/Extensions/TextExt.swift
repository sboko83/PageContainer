//
//  TextExt.swift
//  PageContainer
//
//  Created by Sergey Bokonyaev on 14.04.2022.
//

import SwiftUI

extension Text {
    func textStyle<Style: ViewModifier>(_ style: Style) -> some View {
        ModifiedContent(content: self, modifier: style)
    }
}
