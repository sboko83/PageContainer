//
//  TestPageView.swift
//  PageContainerDemo
//
//  Created by Sergey Bokonyaev on 22.04.2022.
//

import SwiftUI

struct TestPageView: View {
    
    @StateObject private var viewModel = TestViewModel()
    
    @State private var actionSheetIncrement: Int = 1
    
    @State private var darkStyle: Bool = false
    
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
                            Button(action: viewModel.prepareLoading) {
                                TableCellView {
                                    Text("Loading (3 sec)")
                                }
                            }
                            TableCellView {
                                Text("---")
                            }
                        }
                        
                        HStack(spacing: 0) {
                            Button(action: viewModel.prepareSimpleMessage) {
                                TableCellView {
                                    Text("Alert info")
                                }
                            }
                            TableCellView {
                                Text("---")
                            }
                        }
                        
                        HStack(spacing: 0) {
                            Button(action: viewModel.prepareError) {
                                TableCellView {
                                    Text("Alert error")
                                }
                            }
                            TableCellView {
                                Text("---")
                            }
                        }
                        
                        HStack(spacing: 0) {
                            Button(action: viewModel.prepareAlert) {
                                TableCellView {
                                    Text("Alert")
                                }
                            }
                            TableCellView {
                                Text("---")
                            }
                        }
                        
                        HStack(spacing: 0) {
                            Button(action: { prepareActionSheet() }) {
                                TableCellView {
                                    Text("ActionSheet")
                                }
                            }
                            TableCellView {
                                Text("---")
                            }
                        }
                        
                        HStack(spacing: 0) {
                            Button(action: prepareBottomButtons) {
                                TableCellView {
                                    Text("BottomButtons")
                                }
                            }
                            TableCellView {
                                Text("---")
                            }
                        }
                        
                        HStack(spacing: 0) {
                            Button(action: { viewModel.prepareCustomView(AnyView(customBody)) }) {
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
    
    @ViewBuilder
    private var actionSheetBody: some View {
        ActionSheetBodyView(incrementElement: $actionSheetIncrement)
    }
    
    @ViewBuilder
    private var customBody: some View {
        actionSheetBody
            .padding(24.0)
            .background(Color.green.cornerRadius(12.0))
            .padding()
    }
    
    func prepareActionSheet() {
        var buttons: [ActionSheetButton] = []
        
        let simpleBtn = ActionSheetButton(title: "Simple style button", selected: false) {
            print("Simple style button pressed")
        }
        buttons.append(simpleBtn)
        
        let incrementBtn = ActionSheetButton(title: "Button increment", isClose: false, selected: false) {
            actionSheetIncrement += 1
            print("Button increment pressed: \(actionSheetIncrement)")
        }
        buttons.append(incrementBtn)
        
        let selectedBtn = ActionSheetButton(title: "Selected style button", selected: true) {
            print("Selected style button pressed")
        }
        buttons.append(selectedBtn)
        
        viewModel.showActionSheet(title: "Title", body: AnyView(actionSheetBody), buttons: buttons)
    }
    
    func prepareBottomButtons() {
        var buttons: [ActionSheetButton] = []
        
        let simpleBtn = ActionSheetButton(title: "Simple style button", selected: false) {
            print("Simple style button pressed")
        }
        buttons.append(simpleBtn)
        
        let selectedBtn = ActionSheetButton(title: "Selected style button", selected: true) {
            print("Selected style button pressed")
        }
        buttons.append(selectedBtn)
        
        viewModel.showBottomButtons(title: "Title", buttons: buttons)
    }
    
}

struct TestPageView_Previews: PreviewProvider {
    static var previews: some View {
        TestPageView()
            .previewDevice("iPhone SE (3rd generation)")
    }
}
