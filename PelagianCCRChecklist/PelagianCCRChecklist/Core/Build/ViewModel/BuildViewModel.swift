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
        return tanksAnalyzedViewModel.startingO2 != nil &&
            tanksAnalyzedViewModel.startingDiluent != nil &&
            tanksAnalyzedViewModel.startingBailout != nil &&
            scrubbersViewModel.isScrubberFilledChecked &&
            scrubbersViewModel.timeRemaining != nil &&
            assemblyViewModel.isBatteryTestedChecked &&
            assemblyViewModel.isAirCalibrationChecked &&
//            assemblyViewModel.isHoseChecked &&
            assemblyViewModel.isMushroomValvesChecked &&
            assemblyViewModel.isPConInhaleChecked &&
            assemblyViewModel.isPConExhaleChecked &&
            assemblyViewModel.isORingChecked &&
            assemblyViewModel.isCo2PipeChecked &&
            assemblyViewModel.isTandPChecked &&
            assemblyViewModel.isUnitAssembledChecked &&
            gasAndRegsViewModel.o2Pressure != nil &&
            gasAndRegsViewModel.diluentPressure != nil &&
            gasAndRegsViewModel.bailoutPressure != nil &&
            gasAndRegsViewModel.flowRate != nil &&
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
        if tanksAnalyzedViewModel.startingO2 == nil {
            steps.append(1)
        }
        if tanksAnalyzedViewModel.startingDiluent == nil {
            steps.append(2)
        }
        if tanksAnalyzedViewModel.startingBailout == nil {
            steps.append(3)
        }
        if !scrubbersViewModel.isScrubberFilledChecked {
            steps.append(4)
        }
        if scrubbersViewModel.timeRemaining == nil {
            steps.append(5)
        }
        if !assemblyViewModel.isBatteryTestedChecked {
            steps.append(6)
        }
        if !assemblyViewModel.isAirCalibrationChecked {
            steps.append(7)
        }
//        if !assemblyViewModel.isHoseChecked {
//            steps.append(8)
//        }
        if !assemblyViewModel.isMushroomValvesChecked {
            steps.append(9)
        }
        if !assemblyViewModel.isPConInhaleChecked {
            steps.append(10)
        }
        if !assemblyViewModel.isPConExhaleChecked {
            steps.append(11)
        }
        if !assemblyViewModel.isORingChecked {
            steps.append(12)
        }
        if !assemblyViewModel.isCo2PipeChecked {
            steps.append(13)
        }
        if !assemblyViewModel.isTandPChecked {
            steps.append(14)
        }
        if !assemblyViewModel.isUnitAssembledChecked {
            steps.append(15)
        }
        if gasAndRegsViewModel.o2Pressure == nil {
            steps.append(16)
        }
        if gasAndRegsViewModel.diluentPressure == nil {
            steps.append(17)
        }
        if gasAndRegsViewModel.bailoutPressure == nil {
            steps.append(18)
        }
        if gasAndRegsViewModel.flowRate == nil {
            steps.append(19)
        }
        if !gasAndRegsViewModel.isO2FeedChecked {
            steps.append(20)
        }
        if !gasAndRegsViewModel.isADVChecked {
            steps.append(21)
        }
        if !gasAndRegsViewModel.isBailoutRegChecked {
            steps.append(22)
        }
        if !gasAndRegsViewModel.isO2FeedGuageChecked {
            steps.append(23)
        }
        if !gasAndRegsViewModel.isADVGuageChecked {
            steps.append(24)
        }
        if !gasAndRegsViewModel.isBailoutRegGuageChecked {
            steps.append(25)
        }
        if !pressTestAndPreBreatheViewModel.isPosTestChecked {
            steps.append(26)
        }
        if !pressTestAndPreBreatheViewModel.isNegTestChecked {
            steps.append(27)
        }
        if !pressTestAndPreBreatheViewModel.isPrebreatheChecked {
            steps.append(28)
        }
        return steps
    }
    
    var completedSteps: [Int] {
        var completed: [Int] = []
        for step in 1...28 {
            if !incompleteSteps.contains(step) {
                completed.append(step)
            }
        }
        return completed
    }
}

// ViewModel for Tanks Analyzed View
class TanksAnalyzedViewModel: ObservableObject {
    @Published var startingO2: Double
    @Published var startingDiluent: Double
    @Published var startingBailout: Double
    
    init(startingO2: Double = 0.0, startingDiluent: Double = 0.0, startingBailout: Double = 0.0) {
        self.startingO2 = startingO2
        self.startingDiluent = startingDiluent
        self.startingBailout = startingBailout
    }
}


// ViewModel for Scrubbers View
class ScrubbersViewModel: ObservableObject {
    @Published var isScrubberFilledChecked: Bool = false
    @Published var timeRemaining: Int
    
    init(timeRemaining: Int = 0) {
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
    
    @Published var cellOneReading: Double
    @Published var cellTwoReading: Double
    @Published var cellThreeReading: Double
    
    init(cellOneReading: Double = 0.0, cellTwoReading: Double = 0.0, cellThreeReading: Double = 0.0) {
        self.cellOneReading = cellOneReading
        self.cellTwoReading = cellTwoReading
        self.cellThreeReading = cellThreeReading
    }
}

// ViewModel for Gas and Regs View
class GasAndRegsViewModel: ObservableObject {
    @Published var o2Pressure: Int
    @Published var diluentPressure: Int
    @Published var bailoutPressure: Int
    @Published var flowRate: Int
    @Published var isO2FeedChecked: Bool = false
    @Published var isADVChecked: Bool = false
    @Published var isBailoutRegChecked: Bool = false
    @Published var isO2FeedGuageChecked: Bool = false
    @Published var isADVGuageChecked: Bool = false
    @Published var isBailoutRegGuageChecked: Bool = false
    
    init(o2Pressure: Int = 0, diluentPressure: Int = 0, bailoutPressure: Int = 0, flowRate: Int = 0) {
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
