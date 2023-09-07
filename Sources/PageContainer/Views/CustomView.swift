//
//  CustomView.swift
//  PageContainer
//
//  Created by Sergey Bokonyaev on 30.04.2022.
//

import SwiftUI

struct CustomView: View {
    
    @ObservedObject var model: PageContainerViewModel
    
    private let config = PageContainerConfig.shared
    
    var body: some View {
        ZStack(alignment: config.alignments.customView) {
            if model.closeCustomViewByTap {
                Button(action: model.hideCustomView) {
                    emptyScreen
                }
            } else {
                emptyScreen
            }
            
            model.customView
        }
    }
    
    private var emptyScreen: some View {
        VStack {
            Spacer(minLength: 0.0)
            HStack {
                Spacer(minLength: 0.0)
                EmptyView()
                Spacer(minLength: 0.0)
            }
            Spacer(minLength: 0.0)
        }
    }
}
