//
//  TestPageView.swift
//  PageContainerDemo
//
//  Created by Sergey Bokonyaev on 22.04.2022.
//

import SwiftUI
import PageContainer

struct TestPageView: View {
    
    @StateObject private var viewModel = TestViewModel()
    
    @State private var darkStyle: Bool = true
    
    var body: some View {
        PageContainer(viewModel) {
            ScrollView(.vertical) {
                VStack(spacing: 0) {
                    Group {
                        Text("PageContainer demo")
                            .bold()
                        
                        HStack(spacing: 0) {
                            TableCellView(showBorder: false) {
                                Text("Default style:")
                                    .bold()
                            }
                            TableCellView(showBorder: false) {
                                Text("System style:")
                                    .bold()
                            }
                        }
                        
                        HStack(spacing: 0) {
                            Button(action: viewModel.testLoading) {
                                TableCellView {
                                    Text("Loading (3 sec)")
                                }
                            }
                            TableCellView {
                                Text("---")
                            }
                        }
                        
                        HStack(spacing: 0) {
                            Button(action: viewModel.testSimpleMessage) {
                                TableCellView {
                                    Text("Alert info")
                                }
                            }
                            TableCellView {
                                Text("---")
                            }
                        }
                        
                        HStack(spacing: 0) {
                            Button(action: viewModel.testError) {
                                TableCellView {
                                    Text("Alert error")
                                }
                            }
                            TableCellView {
                                Text("---")
                            }
                        }
                        
                        HStack(spacing: 0) {
                            Button(action: viewModel.testAlert) {
                                TableCellView {
                                    Text("Alert")
                                }
                            }
                            TableCellView {
                                Text("---")
                            }
                        }
                        
                        HStack(spacing: 0) {
                            Button(action: { viewModel.testActionSheet(body: AnyView(actionSheetBody)) }) {
                                TableCellView {
                                    Text("ActionSheet")
                                }
                            }
                            TableCellView {
                                Text("---")
                            }
                        }
                        
                        HStack(spacing: 0) {
                            Button(action: viewModel.testBottomButtons) {
                                TableCellView {
                                    Text("BottomButtons")
                                }
                            }
                            TableCellView {
                                Text("---")
                            }
                        }
                        
                        HStack(spacing: 0) {
                            Button(action: { viewModel.testCustomView(AnyView(customBody)) }) {
                                TableCellView {
                                    Text("Custom view")
                                }
                            }
                            TableCellView {
                                Text("---")
                            }
                        }
                    }
                    
                    Divider()
                        .padding(.top)
                    
                    Group {
                        Text("Settings")
                            .bold()
                            .padding(.top)
                        
                        Toggle(isOn: $darkStyle) {
                            Text("Dark style")
                        }
                        .padding()
                    }
                    
                    Spacer(minLength: 0.0)
                }
            }
        }
        .onChange(of: darkStyle) { newValue in
            if newValue {
                PageContainerConfig.shared.setDarkStyle()
            } else {
                PageContainerConfig.shared.setLightStyle()
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

struct TestPageView_Previews: PreviewProvider {
    static var previews: some View {
        TestPageView()
            .previewDevice("iPhone SE (3rd generation)")
    }
}
