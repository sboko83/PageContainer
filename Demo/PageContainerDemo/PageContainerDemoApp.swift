//
//  PageContainerDemoApp.swift
//  PageContainerDemo
//
//  Created by Sergey Bokonyaev on 22.04.2022.
//

import SwiftUI
import PageContainer

@main
struct PageContainerDemoApp: App {
    
    init() {
        setupContainerConfig()
    }
    
    var body: some Scene {
        WindowGroup {
            TestPageView()
        }
    }
    
    private func setupContainerConfig() {
        let config = PageContainerConfig.shared
        config.setDarkStyle()
    }
}
