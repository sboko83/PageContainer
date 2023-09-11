//
//  TableCellView.swift
//  PageContainerDemo
//
//  Created by Sergey Bokonyaev on 07.09.2023.
//

import SwiftUI

struct TableCellView<Content: View>: View {
    
    let content: Content
    let showBorder: Bool
    
    init(showBorder: Bool = true, @ViewBuilder content: () -> Content) {
        self.showBorder = showBorder
        self.content = content()
    }
    
    var body: some View {
        HStack(spacing: 0) {
            Spacer(minLength: 0.0)
            content
            Spacer(minLength: 0.0)
        }
        .padding(8.0)
        .border(.gray, width: showBorder ? 1.0 : 0.0)
        .padding(8.0)
    }
}
