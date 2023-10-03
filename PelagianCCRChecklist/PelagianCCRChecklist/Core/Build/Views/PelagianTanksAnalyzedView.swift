//
//  BuildView2.swift
//  PelagianCCRChecklist
//
//  Created by andrew austin on 10/2/23.
//

import SwiftUI

//struct PelagianTanksAnalyzedView: View {
//    
//    @ObservedObject var viewModel: TanksAnalyzedViewModel
//    @ObservedObject var scrubberViewModel: ScrubbersViewModel
////    @Binding var summaryData: SummaryData
//    
//    var body: some View {
//        NavigationStack {
//            
//            VStack(alignment: .leading) {
//                PelagianHeaderView(title: "Analyze Tanks")
//                    
//                ProgressBarView(progress: Double((350/5) * 0.1))
//                    .padding(.leading)
//
//                List {
//                    Section {
//                        HStack() {
//                            Text("Enter 02")
//                            Spacer()
//                            TextField("PP02",
//                                      value: $viewModel.startingO2,
//                                      formatter: NumberFormatter())
//                            .keyboardType(.numberPad)
//                            .frame(width: 80)
//                            .textFieldStyle(RoundedBorderTextFieldStyle())
//                        }
//                        
//                        
//                        HStack() {
//                            Text("Diluent")
//                            Spacer()
//                            TextField("PP02",
//                                      value: $viewModel.startingDiluent,
//                                      formatter: NumberFormatter())
//                            .keyboardType(.numberPad)
//                            .frame(width: 80)
//                            .textFieldStyle(RoundedBorderTextFieldStyle())
//                        }
//                        
//                        HStack() {
//                            Text("Bailout Gas")
//                            Spacer()
//                            TextField("PP02",
//                                      value: $viewModel.startingBailout,
//                                      formatter: NumberFormatter())
//                            .keyboardType(.numberPad)
//                            .frame(width: 80)
//                            .textFieldStyle(RoundedBorderTextFieldStyle())
//                        }
//                    } header: {
//                        Text("Steps 1 -4 ")
//                    }
//                }
//            }
//            NavigationLink {
//                PelagianScrubbersView(viewModel: ScrubbersViewModel)
//            } label: {
//                Text("Next")
//                    .font(.title)
//                    .bold()
//            }
//            .modifier(StandardButtonStyle())
//            .toolbar {
//                ToolbarItem(placement: .topBarTrailing) {
//                    NavigationLink {
//                        MainTabView()
//                    } label: {
//                        Image(systemName: "house")
//                    }
//                }
//            }
//        }
//        
//    }
//}

import SwiftUI

struct PelagianTanksAnalyzedView: View {
    
    @ObservedObject var appViewModel: AppViewModel
    
    var body: some View {
        NavigationStack {
            
            VStack(alignment: .leading) {
                PelagianHeaderView(title: "Analyze Tanks")
                    
                ProgressBarView(progress: Double((350/5) * 0.1))
                    .padding(.leading)

                Form {
                    Section {
                        HStack() {
                            Text("Enter O2 PP02")
                            Spacer()
                            TextField("PP02",
                                      value: $appViewModel.tanksAnalyzedViewModel.startingO2,
                                      formatter: NumberFormatter())
                            .keyboardType(.numberPad)
                            .frame(width: 80)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .disableAutocorrection(true)
                        }
                        
                        
                        HStack() {
                            Text("Diluent PP02")
                            Spacer()
                            TextField("PP02",
                                      value: $appViewModel.tanksAnalyzedViewModel.startingDiluent,
                                      formatter: NumberFormatter())
                            .keyboardType(.numberPad)
                            .frame(width: 80)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .disableAutocorrection(true)
                        }
                        
                        HStack() {
                            Text("Bailout Gas PP02")
                            Spacer()
                            TextField("PP02",
                                      value: $appViewModel.tanksAnalyzedViewModel.startingBailout,
                                      formatter: NumberFormatter())
                            .keyboardType(.numberPad)
                            .frame(width: 80)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .disableAutocorrection(true)
                        }
                    } header: {
                        Text("Steps 1 - 3 ")
                    }
                }
            }
            NavigationLink {
                PelagianScrubbersView(appViewModel: appViewModel)
            } label: {
                Text("Next")
                    .font(.title)
                    .bold()
            }
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

struct PelagianTanksAnalyzedView_Previews: PreviewProvider {
    static var previews: some View {
        let appViewModel = AppViewModel()
        return PelagianTanksAnalyzedView(appViewModel: appViewModel)
    }
}


//#Preview {
//    PelagianTanksAnalyzedView()
//}
