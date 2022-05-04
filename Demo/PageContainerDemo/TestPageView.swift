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
                Button(action: viewModel.testLoading) {
                    Text("Show Loading")
                }
                .padding(.bottom, 24.0)
                
                Button(action: viewModel.testSimpleMessage) {
                    Text("Show Info")
                }
                .padding(.bottom, 24.0)
                
                Button(action: viewModel.testError) {
                    Text("Show Error")
                }
                .padding(.bottom, 24.0)
                
                Button(action: viewModel.testAlert) {
                    Text("Show simple Alert")
                }
                .padding(.bottom, 24.0)
                
                Button(action: { viewModel.testActionSheet(body: AnyView(actionSheetBody)) }) {
                    Text("Show ActionSheet")
                }
                .padding(.bottom, 24.0)
                
                Button(action: viewModel.testBottomButtons) {
                    Text("Show BottomButtons")
                }
                .padding(.bottom, 24.0)
                
                Button(action: { viewModel.testCustomView(AnyView(customBody)) }) {
                    Text("Show custom view")
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
        }
    }
}

struct TestPageView_Previews: PreviewProvider {
    static var previews: some View {
        TestPageView()
    }
}
