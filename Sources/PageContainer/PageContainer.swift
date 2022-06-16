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

    public init(_ containerModel: PageContainerViewModel,
                @ViewBuilder content: () -> Content) {
        self.viewModel = containerModel
        self.content = content()
    }

    public var body: some View {
        ZStack {
            content
                .blur(radius: blurValue)
                .disabled(disabledState)
            
            // MARK: - Alert
            
            if viewModel.hasAlert {
                AlertView(model: viewModel)
            }
            
            // MARK: - ActionSheet
            
            if viewModel.hasActionSheet {
                ActionSheetView(model: viewModel)
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
    }
    
    private var blurValue: CGFloat {
        viewModel.lockContentState ? 3 : 0
    }
    
    private var disabledState: Bool {
        viewModel.lockContentState
    }
    
}
