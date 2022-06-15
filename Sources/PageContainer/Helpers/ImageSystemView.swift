//
//  ImageSystemView.swift
//  PageContainer
//
//  Created by Sergey Bokonyaev on 15.10.2021.
//

import SwiftUI

public struct ImageSystemView: View {
    
    var name: String
    var size: CGFloat
    var color: Color
    
    public init(name: String,
                size: CGFloat = 26.0,
                color: Color = Color.accentColor) {
        self.name = name
        self.size = size
        self.color = color
    }
    
    public var body: some View {
        Image(systemName: self.name)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: self.size, height: self.size)
            .foregroundColor(self.color)
    }
    
}
