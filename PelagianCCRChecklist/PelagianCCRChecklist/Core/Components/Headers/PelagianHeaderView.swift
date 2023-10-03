//
//  PelagianHeaderView.swift
//  PelagianCCRChecklist
//
//  Created by andrew austin on 10/2/23.
//

import SwiftUI

struct PelagianHeaderView: View {
    let title: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.title)
                .bold()
                .padding(.leading)

            Text("PELAGIAN CHECKLIST")
                .bold()
                .padding(.leading)
            
        }
    }
}

#Preview {
    PelagianHeaderView(title: "Assembly")
}
