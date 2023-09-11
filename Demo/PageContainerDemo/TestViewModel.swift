//
//  TestViewModel.swift
//  PageContainerDemo
//
//  Created by Sergey Bokonyaev on 22.04.2022.
//

import SwiftUI

class TestViewModel: PageContainerViewModel {
    
    func prepareLoading() {
        showLoading()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            self.hideLoading()
        }
    }
    
    func prepareSimpleMessage() {
        showMessage(title: "Test message", message: "Message text")
    }
    
    func prepareError() {
        showError(error: "Error text")
    }
    
    func prepareAlert() {
        showAlert(title: "Title", message: "Alert text")
    }
    
    func prepareCustomView(_ customView: AnyView) {
        showCustomView(customView, closeByTap: true)
    }
    
}
