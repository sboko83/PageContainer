//
//  TestViewModel.swift
//  PageContainerDemo
//
//  Created by Sergey Bokonyaev on 22.04.2022.
//

import SwiftUI
import Combine
import PageContainer

class TestViewModel: PageContainerViewModel {
    
    @Published var actionSheetButtonSelected: Bool = false
    @Published var incrementElement: Int = 1
    @Published var bottomButtonsButtonSelected: Bool = false
    
    func testLoading() {
        showLoading()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            self.hideLoading()
        }
    }
    
    func testSimpleMessage() {
        showMessage(title: "Test message", message: "Message text")
    }
    
    func testError() {
        showError(error: "Error text")
    }
    
    func testAlert() {
        showAlert(title: "Title", message: "Alert text")
    }
    
    func testActionSheet(body: AnyView) {
        var buttons: [ActionSheetButton] = []
        let selectDeselectBtn = ActionSheetButton(title: "Button select/deselect",
                                                  selected: actionSheetButtonSelected) {
            print("Button select/deselect pressed")
            self.actionSheetButtonSelected.toggle()
        }
        buttons.append(selectDeselectBtn)
        let incrementBtn = ActionSheetButton(title: "Button increment",
                                             isClose: false,
                                             selected: false) {
            print("Button increment pressed")
            self.incrementElement += 1
        }
        buttons.append(incrementBtn)
        
        showActionSheet(title: "Title",
                        body: body,
                        buttons: buttons)
    }
    
    func testBottomButtons() {
        var buttons: [ActionSheetButton] = []
        let selectDeselectBtn = ActionSheetButton(title: "Button select/deselect",
                                                  selected: bottomButtonsButtonSelected) {
            print("Button select/deselect pressed")
            self.bottomButtonsButtonSelected.toggle()
        }
        buttons.append(selectDeselectBtn)
        
        showBottomButtons(title: "Title",
                          buttons: buttons)
    }
    
    func testCustomView(_ customView: AnyView) {
        showCustomView(customView,
                       alignment: .topTrailing)
    }
    
}
