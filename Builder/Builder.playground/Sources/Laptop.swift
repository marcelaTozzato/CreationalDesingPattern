import Foundation

public class Laptop {
    public var size: Size
    public var processor: Processor
    public var graphics: Graphics
    
    public init(size: Size, processor: Processor, graphics: Graphics) {
        self.size = size
        self.processor = processor
        self.graphics = graphics
    }
}

extension Laptop: CustomStringConvertible {
    public var description: String {
        return "\(size)\n\tProcessor \(processor)\n\tGraphics \(graphics)"
    }
}

public enum Size: String, CustomStringConvertible {
    case thirteenInch = "13-inch"
    case fifteenInch = "15-inch"
    
    public var description: String {
        return self.rawValue
    }
}

public enum Processor: String, CustomStringConvertible {
    case i5 = "Intel Core i5"
    case i7 = "Intel Core i7"
    case i9 = "Intel Core i9"
    
    public var description: String {
        return self.rawValue
    }
}

public enum Graphics: String, CustomStringConvertible {
    case intelUHD617 = "Intel UHD Graphics 617"
    case intelIrisPlus645 = "Intel Iris Plus Graphics 645"
    case radeonProVega20 = "Radeon Pro Vega 20"
    
    public var description: String {
        return self.rawValue
    }
}
