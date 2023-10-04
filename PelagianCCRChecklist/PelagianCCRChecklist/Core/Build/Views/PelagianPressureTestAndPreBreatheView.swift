//
//  PelagianPressureTestAndPreBreatheView.swift
//  PelagianCCRChecklist
//
//  Created by andrew austin on 10/2/23.
//

import SwiftUI

struct PelagianPressureTestAndPreBreatheView: View {
    
    @ObservedObject var appViewModel: AppViewModel
    @State var showSheet: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                PelagianHeaderView(title: "Pressure Test and Pre-breathe")
                ProgressBarView(progress: Double((350/5) * 4))
                    .padding(.leading)
                
                Form {
                    Section {
                        
                        Toggle(isOn: $appViewModel.pressTestAndPreBreatheViewModel.isPosTestChecked) {
                            Text("Positive pressure test satisfactory?")
                        }
                       
                        Toggle(isOn: $appViewModel.pressTestAndPreBreatheViewModel.isNegTestChecked) {
                                Text("Negative pressure test satisfactory?")
                        }
                        
                        Toggle(isOn: $appViewModel.pressTestAndPreBreatheViewModel.isPrebreatheChecked) {
                                Text("10 minute pre-breathe done?")
                            
                        }
                        Button {
                            showSheet.toggle()
                        } label: {
                            Text("Timer")
                                .font(.title)
                                .frame(width: 300, height: 44)
                                .background(.blue)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }
                        .sheet(isPresented: $showSheet) {
                            CountdownTimerView()
                        }
                        
                    } header: {
                        Text("Steps 28 - 30")
                    }
                    .toggleStyle(SwitchToggleStyle(tint: .unitPrimary))
                }
            }
            NavigationLink("Next") {
                PelagianSummaryView(appViewModel: appViewModel)
            }
            .font(.title)
            .bold()
            .modifier(StandardButtonStyle())
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink {
                        MainTabView()
                    } label: {
                        Image(systemName: "house")
                    }
                }
            }
        }
    }
}

//#Preview {
//    PelagianPressureTestAndPreBreatheView(appViewModel: AppViewModel)
//}
struct PelagianPressureTestAndPreBreatheView_Previews: PreviewProvider {
    static var previews: some View {
        let appViewModel = AppViewModel()
        return PelagianPressureTestAndPreBreatheView(appViewModel: appViewModel)
    }
}

