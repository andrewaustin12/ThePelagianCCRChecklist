
import SwiftUI

struct PelagianScrubbersView: View {
    @ObservedObject var appViewModel: AppViewModel
    @FocusState private var focusedTextField: FormTextField?
    
    enum FormTextField {
        case timeRemaining
    }
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                PelagianHeaderView(title: "Scrubbers")

                ProgressBarView(progress: Double((350/5) * 1))
                    .padding(.leading)

                Form {
                    Section {
                        VStack() {
                            Toggle(isOn: $appViewModel.scrubbersViewModel.isScrubberFilledChecked) {
                                Text("Is the scrubber filled?")
                            }
                        }

                        HStack() {
                            Text("Time remaining on scrubber in mins")

                            Spacer()
                            TextField("Minutes",
                                      text: $appViewModel.scrubbersViewModel.timeRemaining)
                                .focused($focusedTextField, equals: .timeRemaining)
                                .onSubmit {focusedTextField = nil}
                                .submitLabel(.continue)
                                .keyboardType(.numberPad)
                                .frame(width: 80)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                        }
                    } header: {
                        Text("Steps 4 - 5")
                    }
                    
                    .toggleStyle(SwitchToggleStyle(tint: .unitPrimary))
                }
            }
            NavigationLink("Next") {
                PelagianAssemblyView(appViewModel: appViewModel)
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
                    Spacer()
                    Button("Dismiss") { focusedTextField = nil }
                }
            }
        }
    }
}

struct PelagianScrubbersView_Previews: PreviewProvider {
    static var previews: some View {
        let appViewModel = AppViewModel()
        return PelagianScrubbersView(appViewModel: appViewModel)
    }
}
