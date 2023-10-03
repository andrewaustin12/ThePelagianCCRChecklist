//
//  PelagianGasAndRegsView.swift
//  PelagianCCRChecklist
//
//  Created by andrew austin on 10/2/23.
//

//import SwiftUI
//
//struct PelagianGasAndRegsView: View {
//    
//    @ObservedObject var viewModel: GasAndRegsViewModel
//    @ObservedObject var pressTestAndPreBreatheViewModel: PressTestAndPreBreatheViewModel
//    
//    var body: some View {
//        NavigationStack {
//            
//            VStack(alignment: .leading) {
//                
//                PelagianHeaderView(title: "Pressure, Regs & Guage Tests")
//                ProgressBarView(progress: Double((350/5) * 3))
//                    .padding(.leading)
//                
//                Form {
//                    Section{
//                        VStack {
//                            Text("Enter remaining pressure in Bars")
//                                .font(.title3)
//                            HStack() {
//                                Text("Enter 02")
//                                Spacer()
//                                TextField("PP02", value: $viewModel.o2Pressure,
//                                          formatter: NumberFormatter())
//                                .keyboardType(.decimalPad)
//                                .frame(width: 80)
//                                .textFieldStyle(RoundedBorderTextFieldStyle())
//                            }
//                        }
//                        
//                        HStack() {
//                            Text("Enter Diluent")
//                            Spacer()
//                            TextField("PP02",
//                                      value: $viewModel.diluentPressure,
//                                      formatter: NumberFormatter())
//                            .keyboardType(.numberPad)
//                            .frame(width: 80)
//                            .textFieldStyle(RoundedBorderTextFieldStyle())
//                        }
//                        
//                        HStack() {
//                            Text("Enter Bailout Gas")
//                            Spacer()
//                            TextField("PP02",
//                                      value: $viewModel.bailoutPressure,
//                                      formatter: NumberFormatter())
//                            .keyboardType(.numberPad)
//                            .frame(width: 80)
//                            .textFieldStyle(RoundedBorderTextFieldStyle())
//                        }
//                        
//                        HStack() {
//                            VStack(alignment: .leading) {
//                                Text("Flow rate at surface ")
//                                Text("Set to (number of turns)")
//                            }
//                            Spacer()
//                            TextField("NUM",
//                                      value: $viewModel.bailoutPressure,
//                                      formatter: NumberFormatter())
//                            .keyboardType(.numberPad)
//                            .frame(width: 80)
//                            .textFieldStyle(RoundedBorderTextFieldStyle())
//                        }
//                    } header: {
//                        Text("Steps 17 -20")
//                    }
//                    Section {
//                        
//                        VStack {
//                            
//                            Text("Gas Injections")
//                                .font(.title3)
//                            
//                            Toggle(isOn: $viewModel.isO2FeedChecked) {
//                                Text("02 feed")
//                            }
//                            
//                            Divider()
//                            
//                            Toggle(isOn: $viewModel.isADVChecked) {
//                                Text("ADV")
//                            }
//                            
//                            Divider()
//                            
//                            Toggle(isOn: $viewModel.isBailoutRegChecked) {
//                                Text("Bailout Reg")
//                            }
//                        }
//                    
//                    } header: {
//                        Text("Steps 21 - 23")
//                    }
//                    .toggleStyle(SwitchToggleStyle(tint: .unitPrimary))
//                    
//                    Section {
//                        
//                        VStack {
//                            
//                            Text("Guages Tested")
//                                .font(.title3)
//                            
//                            Toggle(isOn: $viewModel.isO2FeedGuageChecked) {
//                                Text("02 feed")
//                            }
//                            
//                            Divider()
//                            
//                            Toggle(isOn: $viewModel.isADVGuageChecked) {
//                                Text("ADV")
//                            }
//                            
//                            Divider()
//                            
//                            Toggle(isOn: $viewModel.isBailoutRegGuageChecked) {
//                                Text("Bailout Reg")
//                            }
//                        }
//                        
//                    } header: {
//                        Text("Steps 24 - 26")
//                    }
//                    .toggleStyle(SwitchToggleStyle(tint: .unitPrimary))
//                    
//                }
//            }
//            NavigationLink("Next") {
//                PelagianPressureTestAndPreBreatheView(viewModel: pressTestAndPreBreatheViewModel)
//            }
//            .font(.title)
//            .bold()
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
//    }
//}

//#Preview {
//    PelagianGasAndRegsView()
//}

import SwiftUI

struct PelagianGasAndRegsView: View {

    @ObservedObject var appViewModel: AppViewModel

    var body: some View {
        NavigationStack {
            
            VStack(alignment: .leading) {
                
                PelagianHeaderView(title: "Pressure, Regs & Gauge Tests")
                ProgressBarView(progress: Double((350/5) * 3))
                    .padding(.leading)
                
                Form {
                    Section{
                        VStack {
                            Text("Enter remaining pressure in Bars")
                                .font(.title3)
                            HStack() {
                                Text("Enter O2")
                                Spacer()
                                TextField("PP02", value: $appViewModel.gasAndRegsViewModel.o2Pressure,
                                          formatter: NumberFormatter())
                                .keyboardType(.decimalPad)
                                .frame(width: 80)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                            }
                        }
                        
                        HStack() {
                            Text("Enter Diluent")
                            Spacer()
                            TextField("PP02",
                                      value: $appViewModel.gasAndRegsViewModel.diluentPressure,
                                      formatter: NumberFormatter())
                            .keyboardType(.numberPad)
                            .frame(width: 80)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        }
                        
                        HStack() {
                            Text("Enter Bailout Gas")
                            Spacer()
                            TextField("PP02",
                                      value: $appViewModel.gasAndRegsViewModel.bailoutPressure,
                                      formatter: NumberFormatter())
                            .keyboardType(.numberPad)
                            .frame(width: 80)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        }
                        
                        HStack() {
                            VStack(alignment: .leading) {
                                Text("Flow rate at surface ")
                                Text("Set to (number of turns)")
                            }
                            Spacer()
                            TextField("NUM",
                                      value: $appViewModel.gasAndRegsViewModel.flowRate,
                                      formatter: NumberFormatter())
                            .keyboardType(.numberPad)
                            .frame(width: 80)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        }
                    } header: {
                        Text("Steps 18 - 21")
                    }
                    Section {
                        
                        VStack {
                            
                            Text("Gas Injections")
                                .font(.title3)
                            
                            Toggle(isOn: $appViewModel.gasAndRegsViewModel.isO2FeedChecked) {
                                Text("O2 feed")
                            }
                            
                            Divider()
                            
                            Toggle(isOn: $appViewModel.gasAndRegsViewModel.isADVChecked) {
                                Text("ADV")
                            }
                            
                            Divider()
                            
                            Toggle(isOn: $appViewModel.gasAndRegsViewModel.isBailoutRegChecked) {
                                Text("Bailout Reg")
                            }
                        }
                    
                    } header: {
                        Text("Steps 22 - 24")
                    }
                    .toggleStyle(SwitchToggleStyle(tint: .unitPrimary))
                    
                    Section {
                        
                        VStack {
                            
                            Text("Gauges Tested")
                                .font(.title3)
                            
                            Toggle(isOn: $appViewModel.gasAndRegsViewModel.isO2FeedGuageChecked) {
                                Text("O2 feed")
                            }
                            
                            Divider()
                            
                            Toggle(isOn: $appViewModel.gasAndRegsViewModel.isADVGuageChecked) {
                                Text("ADV")
                            }
                            
                            Divider()
                            
                            Toggle(isOn: $appViewModel.gasAndRegsViewModel.isBailoutRegGuageChecked) {
                                Text("Bailout Reg")
                            }
                        }
                        
                    } header: {
                        Text("Steps 25 - 27")
                    }
                    .toggleStyle(SwitchToggleStyle(tint: .unitPrimary))
                    
                }
            }
            NavigationLink("Next") {
                PelagianPressureTestAndPreBreatheView(appViewModel: appViewModel)
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

struct PelagianGasAndRegsView_Previews: PreviewProvider {
    static var previews: some View {
        let appViewModel = AppViewModel()
        return PelagianGasAndRegsView(appViewModel: appViewModel)
    }
}
