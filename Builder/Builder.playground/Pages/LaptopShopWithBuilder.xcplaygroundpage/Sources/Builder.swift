import Foundation

// Protocolo que deve ser adotado por todos os builders
public protocol LaptopBuilder {
    var size: Size { get set }
    var processor: Processor { get set }
    var graphics: Graphics { get set }
    
    // uso mutating para mudar o estado interno do builder
    mutating func buildParts(configuration: [String: String])
    func getLaptop() -> Laptop
}

extension LaptopBuilder {
    mutating public func buildParts(configuration: [String: String]) {
        if let customSize = configuration["size"] {
            switch customSize {
            case "13-inch":
                self.size = .thirteenInch
            case "15-inch":
                self.size = .fifteenInch
            default:
                print("Unexpected value")
            }
        }
        
        if let processor = configuration["processor"] {
            switch processor {
            case "i5":
                self.processor = .i5
            case "i7":
                self.processor = .i7
            case "i9":
                self.processor = .i9
            default:
                print("Unexpected value")
            }
        }
        
        if let graphics = configuration["graphics"] {
            switch graphics {
            case "Intel-Iris-Plus-Graphics-645":
                self.graphics = .intelIrisPlus645
            case "Intel-UHD-Graphics-617":
                self.graphics = .intelUHD617
            case "Radeon-Pro-Vega-20":
                self.graphics = .radeonProVega20
            default:
                print("Unexpected value")
            }
        }
    }
    
    public func getLaptop() -> Laptop {
        return Laptop(size: self.size, processor: self.processor, graphics: self.graphics)
    }
}

public class BudgetLaptopBuilder: LaptopBuilder {
    public var size: Size = .thirteenInch
    public var processor: Processor = .i5
    public var graphics: Graphics = .intelUHD617
    
    public init() {}
}

public class OfficeLaptopBuilder: LaptopBuilder {
    public var size: Size = .fifteenInch
    public var processor: Processor = .i7
    public var graphics: Graphics = .intelIrisPlus645
    
    public init() {}
}

public class HighEndLaptopBuilder: LaptopBuilder {
    public var size: Size = .fifteenInch
    public var processor: Processor = .i9
    public var graphics: Graphics = .radeonProVega20
    
    public init() {}
}

public class Director {
    private var builder: LaptopBuilder?
    
    public init(builder: LaptopBuilder?) {
        self.builder = builder
    }
    
    public func constructLaptop(configuration: [String: String]) {
        builder?.buildParts(configuration: configuration)
    }
}
