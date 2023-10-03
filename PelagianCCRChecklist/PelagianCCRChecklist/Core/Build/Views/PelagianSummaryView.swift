import SwiftUI

struct PelagianSummaryView: View {
    @ObservedObject var appViewModel: AppViewModel

    var body: some View {
        NavigationStack {
            VStack {
                if appViewModel.areAllStepsCompleted {
                    SummaryCard(isComplete: true, step: "All steps complete!")
                        .padding()
                    
                    Form{
                        VStack {
                            Text("O2")
                                .font(.title3)
                            HStack{
                                Text("PP02: \(appViewModel.tanksAnalyzedViewModel.startingO2)")
                                    .font(.title2)
                                Spacer()
                                Text("Pressure: \(appViewModel.gasAndRegsViewModel.o2Pressure) Bar")
                                    .font(.title2)
                            }
                        }
                        
                        HStack {
                            Text("Diluent PP02: \(appViewModel.tanksAnalyzedViewModel.startingDiluent)")
                                .font(.title3)
                            Spacer()
                            Text("Diluent Pressure: \(appViewModel.gasAndRegsViewModel.diluentPressure) Bar")
                                .font(.title3)
                        }
                        
                        HStack {
                            Text("Bailout PP02: \(appViewModel.tanksAnalyzedViewModel.startingBailout)")
                                .font(.title3)
                            Spacer()
                            Text("Diluent Pressure: \(appViewModel.gasAndRegsViewModel.bailoutPressure) Bar")
                                .font(.title3)
                        }
                        
                        HStack {
                            Text("You have \(appViewModel.scrubbersViewModel.timeRemaining) minutes remaining on your scrubber")
                                .font(.title2)
                            
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


struct PelagianSummaryView_Previews: PreviewProvider {
    static var previews: some View {
        let appViewModel = AppViewModel()
        return PelagianSummaryView(appViewModel: appViewModel)
    }
}

