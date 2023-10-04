import SwiftUI

struct PelagianGasAndRegsView: View {

    @ObservedObject var appViewModel: AppViewModel
    @FocusState private var focusedTextField: FormTextField?
    
    enum FormTextField {
        case o2Pressure, diluentPressure, bailoutPressure, flowRate
    }
    

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
                                TextField("PP02", text: $appViewModel.gasAndRegsViewModel.o2Pressure)
                                    .focused($focusedTextField, equals: .o2Pressure)
                                    .onSubmit {focusedTextField = .diluentPressure}
                                    .submitLabel(.next)
                                .keyboardType(.numberPad)
                                .frame(width: 80)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                            }
                        }
                        
                        HStack() {
                            Text("Enter Diluent")
                            Spacer()
                            TextField("PP02",
                                      text: $appViewModel.gasAndRegsViewModel.diluentPressure)
                            .focused($focusedTextField, equals: .diluentPressure)
                            .onSubmit {focusedTextField = .bailoutPressure}
                            .submitLabel(.next)
                            .keyboardType(.numberPad)
                            .frame(width: 80)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        }
                        
                        HStack() {
                            Text("Enter Bailout Gas")
                            Spacer()
                            TextField("PP02",
                                      text: $appViewModel.gasAndRegsViewModel.bailoutPressure)
                            .focused($focusedTextField, equals: .bailoutPressure)
                            .onSubmit {focusedTextField = .flowRate}
                            .submitLabel(.next)
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
                            TextField("Num",
                                      text: $appViewModel.gasAndRegsViewModel.flowRate)
                            .focused($focusedTextField, equals: .flowRate)
                            .onSubmit {focusedTextField = nil}
                            .submitLabel(.done)
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
                ToolbarItemGroup(placement: .keyboard) {
                    Button("Dismiss") { focusedTextField = nil }
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
