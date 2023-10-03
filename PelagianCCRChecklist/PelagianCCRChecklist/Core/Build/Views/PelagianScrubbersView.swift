//
//  PelagianScrubbersView.swift
//  PelagianCCRChecklist
//
//  Created by andrew austin on 10/2/23.
//

//import SwiftUI
//
//struct PelagianScrubbersView: View {
//    @ObservedObject var viewModel: ScrubbersViewModel
//
//
//    
//    var body: some View {
//        NavigationStack {
//            VStack(alignment: .leading) {
//                PelagianHeaderView(title: "Scrubbers")
//                
//                ProgressBarView(progress: Double((350/5) * 1))
//                    .padding(.leading)
//                
//                List {
//                    Section {
//                        VStack() {
//                            Toggle(isOn: $viewModel.isScrubberFilledChecked) {
//                                Text("Is the scrubber filled?")
//                            }
//                        }
//                        
//                        HStack() {
//                            Text("Time remaining on scrubber in mins")
//                                
//                            Spacer()
//                            TextField("Minutes",
//                                      value: $viewModel.timeRemaining,
//                                      formatter: NumberFormatter())
//                                        .keyboardType(.numberPad)
//                                        .frame(width: 80)
//                                        .textFieldStyle(RoundedBorderTextFieldStyle())
//                        }
//                    } header: {
//                        Text("Steps 5 - 6")
//                    }
//                    .toggleStyle(SwitchToggleStyle(tint: .unitPrimary))
//                }
//            }
//            NavigationLink("Next") {
//                PelagianAssemblyView(viewModel: assemblyViewModel, gasAndRegsViewModel: GasAndRegsViewModel)
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
//
//
//#Preview {
//    PelagianScrubbersView()
//}
import SwiftUI

struct PelagianScrubbersView: View {
    @ObservedObject var appViewModel: AppViewModel

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
                                      value: $appViewModel.scrubbersViewModel.timeRemaining,
                                      formatter: NumberFormatter())
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
