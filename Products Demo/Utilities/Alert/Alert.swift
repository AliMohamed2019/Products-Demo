//
//  Alert.swift
//  Products Demo
//
//  Created by Ali Mohamed on 24/11/2024.
//

import SwiftUI

struct AlertItem: Identifiable {
    
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
    
}

