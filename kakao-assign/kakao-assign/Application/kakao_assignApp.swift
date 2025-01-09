//
//  kakao_assignApp.swift
//  kakao-assign
//
//  Created by  정지원 on 1/9/25.
//

import SwiftUI

@main
struct kakao_assignApp: App {
    init() {
        DIContainer.shared.registerDependencies()
    }
    
    var body: some Scene {
        WindowGroup {
            MainTabView()
        }
    }
}
