//
//  SummaryCard.swift
//  PelagianCCRChecklist
//
//  Created by andrew austin on 10/2/23.
//

import SwiftUI

struct SummaryCard: View {
    
    let isComplete: Bool
    let step: String
    
    var body: some View {
        HStack{
            Image(systemName: isComplete ? "checkmark.seal.fill" : "xmark.seal.fill")
                .font(.system(size: 25))
                .foregroundStyle(isComplete ? .white : .black)
            
            Text(isComplete ? "Completed:" : "Not Completed:")
                .font(.title2)
                .foregroundStyle(isComplete ? .white : .black)
            
            Text(step)
                .font(.title2)
                .foregroundStyle(isComplete ? .white : .black)
        }
        
        .frame(minWidth: 360, minHeight: 50) // Set a minimum height for the card
        .background(isComplete ? .green : .summaryCard)
        .cornerRadius(5)
        .overlay(RoundedRectangle(cornerRadius: 5)
            .stroke(.gray, lineWidth: 2)
        )
    }
}





#Preview {
    SummaryCard(isComplete: true, step: "All steps completed!")
}
