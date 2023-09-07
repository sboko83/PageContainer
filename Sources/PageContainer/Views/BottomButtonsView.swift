//
//  BottomButtonsView.swift
//  PageContainer
//
//  Created by Sergey Bokonyaev on 14.04.2022.
//

import SwiftUI

struct BottomButtonsView: View {
    
    @ObservedObject var model: PageContainerViewModel
    
    private let config = PageContainerConfig.shared
    
    var body: some View {
        ZStack {
            Button(action: model.hideBottomButtons) {
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
                Spacer(minLength: 0.0)
                VStack(spacing: 0) {
                    VStack(spacing: 0) {
                        if !model.bottomButtonsTitle.isEmpty {
                            Text(model.bottomButtonsTitle)
                                .textStyle(TextStyle(font: config.fonts.bottomButtons.title,
                                                     color: config.color.bottomButtons.title))
                                .padding(.bottom)
                                .padding(.horizontal, 32.0)
                        }
                        ForEach(model.bottomButtonsButtons, id: \.title) { oneButton in
                            HStack(spacing: 0) {
                                Spacer(minLength: 0.0)
                                Button(action: { buttonPressHandler(oneButton) }) {
                                    Text(oneButton.title)
                                }
                                .buttonStyle(BottomButtonsButtonStyle(selected: oneButton.selected))
                                .frame(width: bottomButtonWidth)
                                .padding(.bottom)
                                Spacer(minLength: 0.0)
                            }
                        }
                    }
                    .padding(.vertical)
                    .background(config.color.bottomButtons.background)
                }
                .modifier(ThemeTopCornersModifier(cornerRadius: config.cornerRadius.base))
                .conditionalModifier(config.border.bottomButtons,
                                     PageContainerTopBorder(cornerRadius: config.cornerRadius.base,
                                                            width: config.size.border,
                                                            color: config.color.bottomButtons.border,
                                                            backgroundColor: config.color.bottomButtons.background))
            }
            .padding([.leading, .trailing, .bottom], -config.size.border)
            .background(Color.clear)
            .edgesIgnoringSafeArea(.bottom)
        }
    }
    
    private var bottomButtonWidth: CGFloat {
        var retVal = UIScreen.main.bounds.width - (32.0 * 2)
        if UIDevice.current.userInterfaceIdiom == .pad {
            retVal = minScreenWidth * 0.4
        }
        return retVal
    }
    
    private var minScreenWidth: CGFloat {
        return UIScreen.main.bounds.width > UIScreen.main.bounds.height ? UIScreen.main.bounds.height : UIScreen.main.bounds.width
    }
    
    private func buttonPressHandler(_ button: ActionSheetButton) {
        if let strongHandler = button.pressHandler {
            strongHandler()
        }
        if button.isClose {
            self.model.hideBottomButtons()
        }
    }
    
}
