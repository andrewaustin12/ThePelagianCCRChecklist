//
//  PrimaryButton.swift
//  PelagianCCRChecklist
//
//  Created by andrew austin on 10/2/23.
//

import SwiftUI

struct StandardButtonStyle: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .buttonStyle(.bordered)
            .tint(.unitPrimary)
            .controlSize(.large)
    }
}
