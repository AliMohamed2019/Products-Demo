//
//  Products_DemoApp.swift
//  Products Demo
//
//  Created by Ali Mohamed on 24/11/2024.
//

import SwiftUI

@main
struct Products_DemoApp: App {
    
    init() {
        let appearance = UINavigationBarAppearance()
        appearance.backButtonAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.clear]
        appearance.backButtonAppearance.highlighted.titleTextAttributes = [.foregroundColor: UIColor.clear]
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        
        UIPageControl.appearance().currentPageIndicatorTintColor = .primaryColor?.withAlphaComponent(0.8)
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.gray.withAlphaComponent(0.5)
    }
    
    var body: some Scene {
        WindowGroup {
            ProductListView()
        }
    }
}
