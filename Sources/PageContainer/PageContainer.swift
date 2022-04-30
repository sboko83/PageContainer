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

    public init(_ containerModel: PageContainerViewModel, @ViewBuilder content: () -> Content) {
        self.viewModel = containerModel
        self.content = content()
    }

    public var body: some View {
        ZStack {
            content
                .blur(radius: blurValue)
                .disabled(disabledState)
            
            // MARK: - Alert
            
            if self.viewModel.hasAlert {
                AlertView(model: viewModel)
            }
            
            // MARK: - ActionSheet
            
            if self.viewModel.hasActionSheet {
                ActionSheetView(model: viewModel)
            }
            
            // MARK: - BottomButtons
            
            if self.viewModel.hasBottomButtons {
                BottomButtonsView(model: viewModel)
            }
            
            // MARK: - Loading
            
            if self.viewModel.isLoading {
                LoadingView()
            }
        }
    }
    
    private var blurValue: CGFloat {
        (self.viewModel.hasAlert ||
         self.viewModel.hasActionSheet ||
         self.viewModel.hasBottomButtons ||
         self.viewModel.isLoading) ? 3 : 0
    }
    
    private var disabledState: Bool {
        self.viewModel.hasAlert ||
        self.viewModel.hasActionSheet ||
        self.viewModel.hasBottomButtons ||
        self.viewModel.isLoading
    }
    
}
