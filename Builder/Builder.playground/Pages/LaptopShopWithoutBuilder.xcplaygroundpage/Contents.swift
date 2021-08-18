import UIKit

func buildLaptop(configuration: [String: String]) -> Laptop? {
    guard let model = configuration["baseModel"] else { return nil }
    
    var laptop: Laptop?
    
    switch model {
    case "budget":
        laptop = Laptop(size: .thirteenInch, processor: .i5, graphics: .intelUHD617)
    case "office":
        laptop = Laptop(size: .fifteenInch, processor: .i7, graphics: .intelIrisPlus645)
    case "high-end":
        laptop = Laptop(size: .fifteenInch, processor: .i9, graphics: .radeonProVega20)
    default:
        print("Unexpected value")
    }
    
    guard let selectedLaptop = laptop else { return nil }
    
    if let customSize = configuration["size"] {
        switch customSize {
        case "13-inch":
            selectedLaptop.size = .thirteenInch
        case "15-inch":
            selectedLaptop.size = .fifteenInch
        default:
            print("Unexpected value")
        }
    }
    
    if let processor = configuration["processor"] {
        switch processor {
        case "i5":
            selectedLaptop.processor = .i5
        case "i7":
            selectedLaptop.processor = .i7
        case "i9":
            selectedLaptop.processor = .i9
        default:
            print("Unexpected value")
        }
    }
    
    if let graphics = configuration["graphics"] {
        switch graphics {
        case "Intel-Iris-Plus-Graphics-645":
            selectedLaptop.graphics = .intelIrisPlus645
        case "Intel-UHD-Graphics-617":
            selectedLaptop.graphics = .intelUHD617
        case "Radeon-Pro-Vega-20":
            selectedLaptop.graphics = .radeonProVega20
        default:
            print("Unexpected value")
        }
    }
    
    return selectedLaptop
}

if let laptop = buildLaptop(configuration: ["baseModel": "budget"]) {
    print(laptop)
}

if let laptop = buildLaptop(configuration: ["baseModel": "office",
                                            "size": "13-inch"]) {
    print(laptop)
}
