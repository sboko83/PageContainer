//
//  ActionSheetBodyView.swift
//  PageContainerDemo
//
//  Created by Sergey Bokonyaev on 07.09.2023.
//

import SwiftUI

struct ActionSheetBodyView: View {
    
    @Binding var incrementElement: Int
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            Text("ActionSheetBody:\nIncrement element: \(incrementElement)")
                .multilineTextAlignment(.center)
                .foregroundColor(PageContainerConfig.shared.color.actionSheet.title)
        }
    }
}
