import SwiftUI

class AppViewModel: ObservableObject {
    // Tanks Analyzed View Model
    @Published var tanksAnalyzedViewModel = TanksAnalyzedViewModel()
    
    // Scrubbers View Model
    @Published var scrubbersViewModel = ScrubbersViewModel()
    
    // Assembly View Model
    @Published var assemblyViewModel = AssemblyViewModel()
    
    // Gas and Regs View Model
    @Published var gasAndRegsViewModel = GasAndRegsViewModel()
    
    // Press Test and Pre-Breathe View Model
    @Published var pressTestAndPreBreatheViewModel = PressTestAndPreBreatheViewModel()
    
    // Add a computed property to check if all steps are completed
    var areAllStepsCompleted: Bool {
        return 
            !tanksAnalyzedViewModel.startingO2.isEmpty &&
            !tanksAnalyzedViewModel.startingDiluent.isEmpty &&
            !tanksAnalyzedViewModel.startingBailout.isEmpty &&
            scrubbersViewModel.isScrubberFilledChecked &&
            !scrubbersViewModel.timeRemaining.isEmpty &&
            assemblyViewModel.isBatteryTestedChecked &&
            assemblyViewModel.isAirCalibrationChecked &&
//            assemblyViewModel.isHoseChecked &&
            !assemblyViewModel.cellOneReading.isEmpty &&
            !assemblyViewModel.cellTwoReading.isEmpty &&
            !assemblyViewModel.cellThreeReading.isEmpty &&
            assemblyViewModel.isMushroomValvesChecked &&
            assemblyViewModel.isPConInhaleChecked &&
            assemblyViewModel.isPConExhaleChecked &&
            assemblyViewModel.isORingChecked &&
            assemblyViewModel.isCo2PipeChecked &&
            assemblyViewModel.isTandPChecked &&
            assemblyViewModel.isUnitAssembledChecked &&
            !gasAndRegsViewModel.o2Pressure.isEmpty &&
            !gasAndRegsViewModel.diluentPressure.isEmpty &&
            !gasAndRegsViewModel.bailoutPressure.isEmpty &&
            !gasAndRegsViewModel.flowRate.isEmpty &&
            gasAndRegsViewModel.isO2FeedChecked &&
            gasAndRegsViewModel.isADVChecked &&
            gasAndRegsViewModel.isBailoutRegChecked &&
            gasAndRegsViewModel.isO2FeedGuageChecked &&
            gasAndRegsViewModel.isADVGuageChecked &&
            gasAndRegsViewModel.isBailoutRegGuageChecked &&
            pressTestAndPreBreatheViewModel.isPosTestChecked &&
            pressTestAndPreBreatheViewModel.isNegTestChecked &&
            pressTestAndPreBreatheViewModel.isPrebreatheChecked
    }

    // Add a computed property to get incomplete steps
    var incompleteSteps: [Int] {
        var steps: [Int] = []
        if tanksAnalyzedViewModel.startingO2.isEmpty {
            steps.append(1)
        }
        if tanksAnalyzedViewModel.startingDiluent.isEmpty {
            steps.append(2)
        }
        if tanksAnalyzedViewModel.startingBailout.isEmpty {
            steps.append(3)
        }
        if !scrubbersViewModel.isScrubberFilledChecked {
            steps.append(4)
        }
        if scrubbersViewModel.timeRemaining.isEmpty {
            steps.append(5)
        }
        if !assemblyViewModel.isBatteryTestedChecked {
            steps.append(6)
        }
        if !assemblyViewModel.isAirCalibrationChecked {
            steps.append(7)
        }
        if assemblyViewModel.cellOneReading.isEmpty {
            steps.append(8)
        }
        if assemblyViewModel.cellTwoReading.isEmpty {
            steps.append(9)
        }
        if assemblyViewModel.cellThreeReading.isEmpty {
            steps.append(10)
        }
        
        if !assemblyViewModel.isMushroomValvesChecked {
            steps.append(11)
        }
        if !assemblyViewModel.isPConInhaleChecked {
            steps.append(12)
        }
        if !assemblyViewModel.isPConExhaleChecked {
            steps.append(13)
        }
        if !assemblyViewModel.isORingChecked {
            steps.append(14)
        }
        if !assemblyViewModel.isCo2PipeChecked {
            steps.append(15)
        }
        if !assemblyViewModel.isTandPChecked {
            steps.append(16)
        }
        if !assemblyViewModel.isUnitAssembledChecked {
            steps.append(17)
        }
        if gasAndRegsViewModel.o2Pressure.isEmpty {
            steps.append(18)
        }
        if gasAndRegsViewModel.diluentPressure.isEmpty {
            steps.append(19)
        }
        if gasAndRegsViewModel.bailoutPressure.isEmpty {
            steps.append(20)
        }
        if gasAndRegsViewModel.flowRate.isEmpty {
            steps.append(21)
        }
        if !gasAndRegsViewModel.isO2FeedChecked {
            steps.append(22)
        }
        if !gasAndRegsViewModel.isADVChecked {
            steps.append(23)
        }
        if !gasAndRegsViewModel.isBailoutRegChecked {
            steps.append(24)
        }
        if !gasAndRegsViewModel.isO2FeedGuageChecked {
            steps.append(25)
        }
        if !gasAndRegsViewModel.isADVGuageChecked {
            steps.append(26)
        }
        if !gasAndRegsViewModel.isBailoutRegGuageChecked {
            steps.append(27)
        }
        if !pressTestAndPreBreatheViewModel.isPosTestChecked {
            steps.append(28)
        }
        if !pressTestAndPreBreatheViewModel.isNegTestChecked {
            steps.append(29)
        }
        if !pressTestAndPreBreatheViewModel.isPrebreatheChecked {
            steps.append(30)
        }
        return steps
    }
    
    var completedSteps: [Int] {
        var completed: [Int] = []
        for step in 1...30 {
            if !incompleteSteps.contains(step) {
                completed.append(step)
            }
        }
        return completed
    }
}

// ViewModel for Tanks Analyzed View
class TanksAnalyzedViewModel: ObservableObject {
    @Published var startingO2: String = ""
    @Published var startingDiluent: String = ""
    @Published var startingBailout: String = ""
    
    init(startingO2: String = "", startingDiluent: String = "", startingBailout: String = "") {
        self.startingO2 = startingO2
        self.startingDiluent = startingDiluent
        self.startingBailout = startingBailout
    }
}


// ViewModel for Scrubbers View
class ScrubbersViewModel: ObservableObject {
    @Published var isScrubberFilledChecked: Bool = false
    @Published var timeRemaining: String = ""
    
    init(timeRemaining: String = "") {
        self.timeRemaining = timeRemaining
    }

}

// ViewModel for Assembly View
class AssemblyViewModel: ObservableObject {
    @Published var isBatteryTestedChecked: Bool = false
    @Published var isAirCalibrationChecked: Bool =  false
//    @Published var isHoseChecked: Bool =  false
    @Published var isMushroomValvesChecked: Bool =  false
    @Published var isPConInhaleChecked: Bool =  false
    @Published var isPConExhaleChecked: Bool =  false
    @Published var isORingChecked: Bool =  false
    @Published var isCo2PipeChecked: Bool =  false
    @Published var isTandPChecked: Bool =  false
    @Published var isUnitAssembledChecked: Bool =  false
    
    @Published var cellOneReading: String = "0"
    @Published var cellTwoReading: String = "0"
    @Published var cellThreeReading: String = "0"
    
    init(cellOneReading: String = "", cellTwoReading: String = "", cellThreeReading: String = "") {
        self.cellOneReading = cellOneReading
        self.cellTwoReading = cellTwoReading
        self.cellThreeReading = cellThreeReading
    }
}

// ViewModel for Gas and Regs View
class GasAndRegsViewModel: ObservableObject {
    @Published var o2Pressure: String = ""
    @Published var diluentPressure: String = ""
    @Published var bailoutPressure: String = ""
    @Published var flowRate: String = ""
    @Published var isO2FeedChecked: Bool = false
    @Published var isADVChecked: Bool = false
    @Published var isBailoutRegChecked: Bool = false
    @Published var isO2FeedGuageChecked: Bool = false
    @Published var isADVGuageChecked: Bool = false
    @Published var isBailoutRegGuageChecked: Bool = false
    
    init(o2Pressure: String = "", diluentPressure: String = "", bailoutPressure: String = "", flowRate: String = "") {
        self.o2Pressure = o2Pressure
        self.diluentPressure = diluentPressure
        self.bailoutPressure = bailoutPressure
        self.flowRate = flowRate
    }
}

// ViewModel for Press Test and Pre-Breathe View
class PressTestAndPreBreatheViewModel: ObservableObject {
    @Published var isPosTestChecked: Bool = false
    @Published var isNegTestChecked: Bool = false
    @Published var isPrebreatheChecked: Bool = false
}
