import SwiftUI

struct PelagianTanksAnalyzedView: View {
    
    @ObservedObject var appViewModel: AppViewModel
    @FocusState private var focusedTextField: FormTextField?
    
    enum FormTextField {
        case starting02, startingDiluent, startingBailout
    }
    
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
                                      text: $appViewModel.tanksAnalyzedViewModel.startingO2)
                            .focused($focusedTextField, equals: .starting02)
                            .onSubmit {focusedTextField = .startingDiluent}
                            .submitLabel(.next)
                            .keyboardType(.numberPad)
                            .frame(width: 80)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .disableAutocorrection(true)
                        }
                        
                        
                        HStack() {
                            Text("Diluent PP02")
                            Spacer()
                            TextField("PP02",
                                      text: $appViewModel.tanksAnalyzedViewModel.startingDiluent)
                            .focused($focusedTextField, equals: .startingDiluent)
                            .onSubmit {focusedTextField = .startingBailout }
                            .submitLabel(.next)
                            .keyboardType(.numberPad)
                            .frame(width: 80)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .disableAutocorrection(true)
                        }
                        
                        HStack() {
                            Text("Bailout Gas PP02")
                            Spacer()
                            TextField("PP02",
                                      text: $appViewModel.tanksAnalyzedViewModel.startingBailout)
                            .focused($focusedTextField, equals: .startingBailout)
                            .onSubmit {focusedTextField = nil }
                            .submitLabel(.done)
                            .keyboardType(.numberPad)
                            .frame(width: 80)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .disableAutocorrection(true)
                        }
                    } header: {
                        Text("Steps 1 - 3 ")
                    }
                }
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Spacer()
                        Button("Dismiss") { focusedTextField = nil }
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
