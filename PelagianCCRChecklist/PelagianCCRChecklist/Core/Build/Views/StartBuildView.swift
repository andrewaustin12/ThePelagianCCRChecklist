//
//  BuildView1.swift
//  PelagianCCRChecklist
//
//  Created by andrew austin on 10/2/23.
//

import SwiftUI

struct StartBuildView: View {
    @StateObject var appViewModel = AppViewModel() // Create an instance of AppViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Pelagian MCCR Build Checklist")
                    .font(.title)
                    .multilineTextAlignment(.center)
            }
            
            NavigationLink {
                PelagianTanksAnalyzedView(appViewModel: appViewModel) // Pass the instance of AppViewModel
            } label: {
                Text("Begin")
                    .font(.title)
                    .bold()
            }
            .modifier(StandardButtonStyle())
        }
    }
}


#Preview {
    StartBuildView()
}
