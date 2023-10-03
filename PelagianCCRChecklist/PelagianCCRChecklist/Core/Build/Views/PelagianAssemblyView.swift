//
//  PelagianAssemblyView.swift
//  PelagianCCRChecklist
//
//  Created by andrew austin on 10/2/23.
//

//import SwiftUI
//
//struct PelagianAssemblyView: View {
//
//    @ObservedObject var viewModel: AssemblyViewModel
//    @ObservedObject var gasAndRegsViewModel: GasAndRegsViewModel
//    
//    var body: some View {
//        NavigationStack {
//            
//            VStack(alignment: .leading) {
//                PelagianHeaderView(title: "Assembly Checks")
//                
//                ProgressBarView(progress: Double((350/5) * 2))
//                    .padding(.leading)
//                
//                Form {
//                    Section {
//                        VStack {
//                            Toggle(isOn: $viewModel.isBatteryTestedChecked) {
//                                Text("Is Battery Tested?")
//                            }
//                        }
//                        
//                        VStack {
//                            Text("Air Calibration")
//                                .font(.title3)
//                            // TODO: CHANGE TO 3 NUM INPUTS FOR CELLS 1-3
//                            Toggle(isOn: $viewModel.isAirCalibrationChecked) {
//                                VStack(alignment: .leading) {
//        
//                                    Text("Set to .209?")
//                                }
//                            }
//                            HStack() {
//                                Text("Cell 1")
//                                Spacer()
//                                TextField("PP02",
//                                          value: $viewModel.cellOneReading,
//                                          formatter: NumberFormatter())
//                                            .keyboardType(.numberPad)
//                                            .frame(width: 80)
//                                            .textFieldStyle(RoundedBorderTextFieldStyle())
//                            }
//                            HStack() {
//                                Text("Cell 2")
//                                Spacer()
//                                TextField("PP02",
//                                          value: $viewModel.cellTwoReading,
//                                          formatter: NumberFormatter())
//                                            .keyboardType(.numberPad)
//                                            .frame(width: 80)
//                                            .textFieldStyle(RoundedBorderTextFieldStyle())
//                            }
//                            HStack() {
//                                Text("Cell 3")
//                                Spacer()
//                                TextField("PP02",
//                                          value: $viewModel.cellThreeReading,
//                                          formatter: NumberFormatter())
//                                            .keyboardType(.numberPad)
//                                            .frame(width: 80)
//                                            .textFieldStyle(RoundedBorderTextFieldStyle())
//                            }
//
//                        }
//                        
//                        VStack() {
//                            VStack {
//                                Text("Loop Checks")
//                                    .font(.title3)
//    //                            Toggle(isOn: $isHoseChecked) {
//    //                                Text("Hose Check")
//    //                                    .fontWeight(.medium)
//    //                            }
//                                Toggle(isOn: $viewModel.isMushroomValvesChecked) {
//                                    Text("Hose Check Valves")
//                                }
//                                Toggle(isOn: $viewModel.isPConInhaleChecked) {
//                                    Text("P-Con inhale")
//                                }
//                                Toggle(isOn: $viewModel.isPConExhaleChecked) {
//                                    Text("P-Con exhale")
//                                }
//                                Toggle(isOn: $viewModel.isORingChecked) {
//                                    Text("O-Ring")
//                                }
//                                Toggle(isOn: $viewModel.isCo2PipeChecked) {
//                                    Text("CO2 pipe seated in socket")
//                                }
//                                Toggle(isOn: $viewModel.isTandPChecked) {
//                                    Text("Tees & plugs (twist & tug)")
//                                }
//                            }
//                        }
//                        
//                        VStack() {
//                            Toggle(isOn: $viewModel.isUnitAssembledChecked) {
//                                VStack(alignment: .leading) {
//                                    Text("Are you satisfied with the assembly of your unit?")
//                                }
//                            }
//                        }
//                    } header: {
//                        Text("Steps 7 - 16")
//                    }
//                    .toggleStyle(SwitchToggleStyle(tint: .unitPrimary))
//                }
//            }
//            NavigationLink("Next") {
//                PelagianGasAndRegsView(viewModel: gasAndRegsViewModel)
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
//
//        }
//    }
//}


//#Preview {
//    PelagianAssemblyView()
//}
import SwiftUI

struct PelagianAssemblyView: View {

    @ObservedObject var appViewModel: AppViewModel

    var body: some View {
        NavigationStack {
            
            VStack(alignment: .leading) {
                PelagianHeaderView(title: "Assembly Checks")
                
                ProgressBarView(progress: Double((350/5) * 2))
                    .padding(.leading)
                
                Form {
                    Section {
                        VStack {
                            Toggle(isOn: $appViewModel.assemblyViewModel.isBatteryTestedChecked) {
                                Text("Is Battery Tested?")
                            }
                        }
                        
                        VStack {
                            Text("Air Calibration")
                                .font(.title3)
                            // TODO: CHANGE TO 3 NUM INPUTS FOR CELLS 1-3
                            Toggle(isOn: $appViewModel.assemblyViewModel.isAirCalibrationChecked) {
                                VStack(alignment: .leading) {
                                    Text("Set to .209?")
                                }
                            }
//                            HStack() {
//                                Text("Cell 1")
//                                Spacer()
//                                TextField("PP02",
//                                          value: $appViewModel.assemblyViewModel.cellOneReading,
//                                          formatter: NumberFormatter())
//                                    .keyboardType(.numberPad)
//                                    .frame(width: 80)
//                                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                            }
//                            HStack() {
//                                Text("Cell 2")
//                                Spacer()
//                                TextField("PP02",
//                                          value: $appViewModel.assemblyViewModel.cellTwoReading,
//                                          formatter: NumberFormatter())
//                                    .keyboardType(.numberPad)
//                                    .frame(width: 80)
//                                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                            }
//                            HStack() {
//                                Text("Cell 3")
//                                Spacer()
//                                TextField("PP02",
//                                          value: $appViewModel.assemblyViewModel.cellThreeReading,
//                                          formatter: NumberFormatter())
//                                    .keyboardType(.numberPad)
//                                    .frame(width: 80)
//                                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                            }

                        }
                        
                        VStack() {
                            VStack {
                                Text("Loop Checks")
                                    .font(.title3)
                                Toggle(isOn: $appViewModel.assemblyViewModel.isMushroomValvesChecked) {
                                    Text("Hose Check Valves")
                                }
                                Toggle(isOn: $appViewModel.assemblyViewModel.isPConInhaleChecked) {
                                    Text("P-Con inhale")
                                }
                                Toggle(isOn: $appViewModel.assemblyViewModel.isPConExhaleChecked) {
                                    Text("P-Con exhale")
                                }
                                Toggle(isOn: $appViewModel.assemblyViewModel.isORingChecked) {
                                    Text("O-Ring")
                                }
                                Toggle(isOn: $appViewModel.assemblyViewModel.isCo2PipeChecked) {
                                    Text("CO2 pipe seated in socket")
                                }
                                Toggle(isOn: $appViewModel.assemblyViewModel.isTandPChecked) {
                                    Text("Tees & plugs (twist & tug)")
                                }
                            }
                        }
                        
                        VStack() {
                            Toggle(isOn: $appViewModel.assemblyViewModel.isUnitAssembledChecked) {
                                VStack(alignment: .leading) {
                                    Text("Are you satisfied with the assembly of your unit?")
                                }
                            }
                        }
                    } header: {
                        Text("Steps 6 - 17")
                    }
                    .toggleStyle(SwitchToggleStyle(tint: .unitPrimary))
                }
            }
            NavigationLink("Next") {
                PelagianGasAndRegsView(appViewModel: appViewModel)
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

struct PelagianAssemblyView_Previews: PreviewProvider {
    static var previews: some View {
        let appViewModel = AppViewModel()
        return PelagianAssemblyView(appViewModel: appViewModel)
    }
}
