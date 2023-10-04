import SwiftUI

struct PelagianAssemblyView: View {

    @ObservedObject var appViewModel: AppViewModel
    @FocusState private var focusedTextField: FormTextField?

    enum FormTextField {
        case cellOneReading, cellTwoReading, cellThreeReading
    }

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
                            Toggle(isOn: $appViewModel.assemblyViewModel.isAirCalibrationChecked) {
                                VStack(alignment: .leading) {
                                    Text("Set to .209?")
                                }
                            }
                            HStack() {
                                Text("Cell 1")
                                Spacer()
                                TextField("PP02",
                                          text: $appViewModel.assemblyViewModel.cellOneReading)
                                    .focused($focusedTextField, equals: .cellOneReading)
                                    .onSubmit {focusedTextField = .cellTwoReading }
                                    .submitLabel(.next)
                                    .keyboardType(.decimalPad)
                                    .frame(width: 80)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    
                            }
                            HStack() {
                                Text("Cell 2")
                                Spacer()
                                TextField("PP02",
                                          text: $appViewModel.assemblyViewModel.cellTwoReading)
                                    .focused($focusedTextField, equals: .cellTwoReading)
                                    .onSubmit {focusedTextField = .cellThreeReading }
                                    .submitLabel(.next)
                                    .keyboardType(.decimalPad)
                                    .frame(width: 80)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    
                            }
                            HStack() {
                                Text("Cell 3")
                                Spacer()
                                TextField("PP02",
                                          text: $appViewModel.assemblyViewModel.cellThreeReading)
                                    .focused($focusedTextField, equals: .cellThreeReading)
                                    .onSubmit {focusedTextField = nil }
                                    .submitLabel(.done)
                                    .keyboardType(.decimalPad)
                                    .frame(width: 80)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                            }

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
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Button("Dismiss") { focusedTextField = nil }
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

