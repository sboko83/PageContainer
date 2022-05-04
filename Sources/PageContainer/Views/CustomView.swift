//
//  CustomView.swift
//  PageContainer
//
//  Created by Sergey Bokonyaev on 30.04.2022.
//

import SwiftUI

struct CustomView: View {
    
    @ObservedObject var model: PageContainerViewModel
    
    private let config = PageContainerConfig.sharedInstance
    
    var body: some View {
        ZStack(alignment: model.customViewAlignment) {
            Button(action: model.hideCustomView) {
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
            
            model.customView
        }
    }
}