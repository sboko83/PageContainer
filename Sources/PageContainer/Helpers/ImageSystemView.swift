//
//  ImageSystemView.swift
//  PageContainer
//
//  Created by Sergey Bokonyaev on 15.10.2021.
//

import SwiftUI

struct ImageSystemView: View {
    
    var name: String
    var size: CGFloat = 26.0
    var color: Color = Color.accentColor
    
    var body: some View {
        Image(systemName: self.name)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: self.size, height: self.size)
            .foregroundColor(self.color)
    }
    
}
