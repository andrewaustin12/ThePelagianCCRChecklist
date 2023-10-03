//
//  SplashView.swift
//  PelagianCCRChecklist
//
//  Created by andrew austin on 10/2/23.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            Image("pelagian-app-icon")
                .resizable()
                .frame(width: 400,height: 400)
        }
    }
}

#Preview {
    SplashView()
}
