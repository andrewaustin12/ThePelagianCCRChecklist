//
//  SummaryCellCard.swift
//  PelagianCCRChecklist
//
//  Created by andrew austin on 10/4/23.
//

import SwiftUI



struct SummaryGasCard: View {
    
    var title: String
    var startingPP02: String
    var startingPressure: String
    
    var body: some View {
        VStack {
            Text(title)
                .font(.title)
            HStack{
                VStack{
                    Text("PP02:")
                        .font(.headline)
                    Text("\(startingPP02) %")
                        
                }
                Spacer()
                VStack{
                    Text("Pressure:")
                        .font(.headline)
                    Text("\(startingPressure) Bar")
                        
                }
            }
        }
        .padding()
    }
}

#Preview {
    SummaryGasCard(title: "0xygen", startingPP02: "21", startingPressure: "200")
}
