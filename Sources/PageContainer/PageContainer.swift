//
//  PageContainer.swift
//  PageContainer
//
//  Created by Sergey Bokonyaev on 29.01.2022.
//

import SwiftUI

public struct PageContainer<Content: View>: View {
    
    @ObservedObject var viewModel: PageContainerViewModel
    private let content: Content
    private let config = PageContainerConfig.shared
    
    public init(_ containerModel: PageContainerViewModel,
                @ViewBuilder content: () -> Content) {
        self.viewModel = containerModel
        self.content = content()
    }

    public var body: some View {
        ZStack {
            content
                .blur(radius: blurValue)
                .disabled(viewModel.lockContentState)
            
            // MARK: - Alert
            
            if viewModel.hasAlert {
                AlertView(model: viewModel)
            }
            
            // MARK: - ActionSheet
            
            if viewModel.hasActionSheet {
                actionSheetView
            }
            
            // MARK: - BottomButtons
            
            if viewModel.hasBottomButtons {
                BottomButtonsView(model: viewModel)
            }
            
            // MARK: - Loading
            
            if viewModel.isLoading {
                LoadingView()
            }
            
            // MARK: - CustomView
            
            if viewModel.hasCustomView {
                CustomView(model: viewModel)
            }
        }
        .font(config.fonts.common)
    }
    
    @ViewBuilder
    private var actionSheetView: some View {
        ZStack(alignment: config.alignments.actionSheet) {
            Button(action: viewModel.hideActionSheet) {
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
                if !viewModel.actionSheetTitle.isEmpty {
                    Text(viewModel.actionSheetTitle)
                        .textStyle(TextStyle(font: config.fonts.actionSheet.title,
                                             color: config.color.actionSheet.title))
                        .padding(.bottom, 8.0)
                }
                
                viewModel.actionSheetBody
                
                ForEach(viewModel.actionSheetButtons, id: \.title) { oneButton in
                    Button(action: {
                        oneButton.pressHandler?()
                        if oneButton.isClose {
                            viewModel.hideActionSheet()
                        }
                    }) {
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
                                                     width: config.size.border,
                                                     color: config.color.actionSheet.border))
            .padding(32.0)
        }
    }
    
    private var blurValue: CGFloat {
        (viewModel.hasAlert ||
         viewModel.hasActionSheet ||
         viewModel.hasBottomButtons ||
         viewModel.isLoading ||
         viewModel.hasCustomView) ? 3 : 0
    }
    
}
