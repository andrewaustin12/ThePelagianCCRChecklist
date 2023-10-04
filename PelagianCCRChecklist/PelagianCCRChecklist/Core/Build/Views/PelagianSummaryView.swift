import SwiftUI

struct PelagianSummaryView: View {
    @ObservedObject var appViewModel: AppViewModel

    var body: some View {
        NavigationStack {
            VStack {
                if appViewModel.areAllStepsCompleted {
                    SummaryCard(isComplete: true, step: "All steps complete!")
                        .padding(.top)
                        .padding(.bottom)

                    VStack {
                        Text("Summary of Build")
                            .font(.largeTitle)
                    }

                    Form {
                        
                        Section {
                            HStack {
                                Text("You have \(appViewModel.scrubbersViewModel.timeRemaining) minutes remaining on your scrubber")
                                    .font(.title3)
                            }
                        } header: {
                            Text("Scrubber Time")
                        }
                        
                        Section(header: Text("Gas Readings")) {
                            VStack {
                                SummaryGasCard(title: "Oxygen", startingPP02: appViewModel.tanksAnalyzedViewModel.startingO2, startingPressure: appViewModel.gasAndRegsViewModel.o2Pressure)

                                SummaryGasCard(title: "Diluent", startingPP02: appViewModel.tanksAnalyzedViewModel.startingDiluent, startingPressure: appViewModel.gasAndRegsViewModel.diluentPressure)

                                SummaryGasCard(title: "Bailout", startingPP02: appViewModel.tanksAnalyzedViewModel.startingBailout, startingPressure: appViewModel.gasAndRegsViewModel.bailoutPressure)
                                
                                Text("Your Flow Rate is set to \(appViewModel.gasAndRegsViewModel.flowRate) turns.")
                                    .font(.title3)
                            }

                            
                        }

                        Section(header: Text("Cell Readings")) {
                            VStack {
                                Summary02CellsView(cell1: appViewModel.assemblyViewModel.cellOneReading, cell2: appViewModel.assemblyViewModel.cellTwoReading, cell3: appViewModel.assemblyViewModel.cellThreeReading)
                            }
                        }
                    }

                } else {
                    Text("Some steps are not completed:")
                        .font(.title)
                        .bold()

                    ScrollView {
                        Section {
                            ForEach(appViewModel.incompleteSteps, id: \.self) { step in
                                SummaryCard(isComplete: false, step: "Step \(step)")
                            }
                        }
                    }
                }
            }
            .padding(.bottom)

            NavigationLink("Finish") {
                MainTabView()
            }
            .font(.title)
            .bold()
            .modifier(StandardButtonStyle())
            .disabled(!appViewModel.areAllStepsCompleted)
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
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
