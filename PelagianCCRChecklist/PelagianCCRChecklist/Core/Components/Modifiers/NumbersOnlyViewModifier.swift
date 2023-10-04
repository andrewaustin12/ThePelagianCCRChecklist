//
//  NumberOnlyViewModifier.swift
//  PelagianCCRChecklist
//
//  Created by andrew austin on 10/4/23.
//

//import SwiftUI
//import Combine
//
//struct NumbersOnlyViewModifier: ViewModifier {
//    
//    @Binding var text: String
//    var includeDescimal: Bool
// 
//    func body(content: Content) -> some View {
//        content
//            .keyboardType(includeDescimal ? .decimalPad : .numberPad)
//            .onReceive(Just(text)) { newValue in
//                var numbers = "0123456789"
//                let decimalSeparator: String = Locale.current.decimalSeparator ?? "."
//                if includeDescimal {
//                    numbers += decimalSeparator
//                }
//                if newValue.components(separatedBy: decimalSeparator).count-1 > 1 {
//                    let filtered = newValue
//                    self.text = String(filtered.dropLast())
//                }else{
//                    let filtered = newValue.filter { numbers.contains($0) }
//                    if filtered != newValue {
//                        self.text = filtered
//                    }
//                }
//            }
//    }
//}
//
//extension View {
//    func numbersOnly(_ text: Binding<String>, includesDecimal: Bool = false) -> some View {
//        self.modifier(NumbersOnlyViewModifier(text: text, includeDescimal: includesDecimal))
//    }
//}
