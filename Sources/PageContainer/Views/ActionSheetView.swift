//
//  ActionSheetView.swift
//  PageContainer
//
//  Created by Sergey Bokonyaev on 14.04.2022.
//

import SwiftUI

struct ActionSheetView: View {
    
    @ObservedObject var model: PageContainerViewModel
    
    private let config = PageContainerConfig.sharedInstance
    
    var body: some View {
        ZStack {
            Button(action: model.resetActionSheet) {
                VStack {
                    Spacer(minLength: 0.0)
                    HStack {
                        Spacer(minLength: 0.0)
                        Text("")
                        Spacer(minLength: 0.0)
                    }
                    Spacer(minLength: 0.0)
                }
            }
            
            VStack(spacing: 0) {
                if !model.actionSheetTitle.isEmpty {
                    Text(model.actionSheetTitle)
                        .textStyle(ActionSheetTitleStyle())
                        .padding(.bottom, 8.0)
                }
                
                model.actionSheetBody
                
                ForEach(model.actionSheetButtons, id: \.title) { oneButton in
                    Button(action: { buttonPressHandler(oneButton) }) {
                        Text(oneButton.title)
                    }
                    .buttonStyle(ActionSheetButtonStyle(selected: oneButton.selected))
                    .padding(.top)
                }
            }
            .padding()
            .background(config.color.actionSheet.background)
            .cornerRadius(config.cornerRadius.base)
            .conditionalModifier(config.border.actionSheet,
                                 PageContainerBorder(cornerRadius: config.cornerRadius.base,
                                                     width: 1.0,
                                                     color: config.color.actionSheet.border))
            .padding(32.0)
        }
    }
    
    private func buttonPressHandler(_ button: ActionSheetButton) {
        if let strongHandler = button.pressHandler {
            strongHandler()
        }
        if button.isClose {
            self.model.resetActionSheet()
        }
    }
}
