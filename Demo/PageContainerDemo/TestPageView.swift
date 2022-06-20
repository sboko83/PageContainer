//
//  TestPageView.swift
//  PageContainerDemo
//
//  Created by Sergey Bokonyaev on 22.04.2022.
//

import SwiftUI
import Combine
import PageContainer

struct TestPageView: View {
    
    @StateObject private var viewModel = TestViewModel()
    
    var body: some View {
        PageContainer(viewModel) {
            VStack(spacing: 0) {
                HStack(spacing: 0) {
                    TableCellView {
                        Text("PageContainer:").bold()
                    }
                    TableCellView {
                        Text("System views:").bold()
                    }
                }
                .padding(.bottom, 8.0)
                
                HStack(spacing: 0) {
                    TableCellView {
                        Button(action: viewModel.testLoading) {
                            Text("Loading")
                        }
                    }
                    TableCellView {
                        Text("---")
                    }
                }
                
                HStack(spacing: 0) {
                    TableCellView {
                        Button(action: viewModel.testSimpleMessage) {
                            Text("Alert info")
                        }
                    }
                    TableCellView {
                        Text("---")
                    }
                }
                
                HStack(spacing: 0) {
                    TableCellView {
                        Button(action: viewModel.testError) {
                            Text("Alert error")
                        }
                    }
                    TableCellView {
                        Text("---")
                    }
                }
                
                HStack(spacing: 0) {
                    TableCellView {
                        Button(action: viewModel.testAlert) {
                            Text("Alert")
                        }
                    }
                    TableCellView {
                        Text("---")
                    }
                }
                
                HStack(spacing: 0) {
                    TableCellView {
                        Button(action: { viewModel.testActionSheet(body: AnyView(actionSheetBody)) }) {
                            Text("ActionSheet")
                        }
                    }
                    TableCellView {
                        Text("---")
                    }
                }
                
                HStack(spacing: 0) {
                    TableCellView {
                        Button(action: viewModel.testBottomButtons) {
                            Text("BottomButtons")
                        }
                    }
                    TableCellView {
                        Text("---")
                    }
                }
                
                HStack(spacing: 0) {
                    TableCellView {
                        Button(action: { viewModel.testCustomView(AnyView(customBody)) }) {
                            Text("Custom view")
                        }
                    }
                    TableCellView {
                        Text("---")
                    }
                }
                
            }
        }
    }
    
    private var actionSheetBody: some View {
        AnyView(ActionSheetBodyView(incrementElement: self.$viewModel.incrementElement))
    }
    
    private var customBody: some View {
        actionSheetBody
            .padding(24.0)
            .background(Color.green.cornerRadius(12.0))
            .padding()
    }
}

struct ActionSheetBodyView: View {
    
    @Binding var incrementElement: Int
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            Text("ActionSheetBody:\nIncrement element: \(incrementElement)")
                .multilineTextAlignment(.center)
                .foregroundColor(PageContainerConfig.sharedInstance.color.actionSheet.title)
        }
    }
}

struct TableCellView<Content: View>: View {
    
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        HStack(spacing: 0) {
            Spacer(minLength: 0.0)
            content
            Spacer(minLength: 0.0)
        }
        .padding(8.0)
        .border(.gray, width: 1.0)
        .padding(8.0)
    }
}

struct TestPageView_Previews: PreviewProvider {
    static var previews: some View {
        TestPageView()
    }
}
