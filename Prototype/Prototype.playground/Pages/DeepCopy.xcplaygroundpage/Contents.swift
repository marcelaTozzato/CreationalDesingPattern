import Foundation

class Point {
    var x: Int
    var y: Int
    var shape: Shape
    
    init(x: Int, y: Int, shape: Shape) {
        self.x = x
        self.y = y
        self.shape = shape
    }
}

extension Point: CustomStringConvertible {
    var description: String {
        return "Point(x: \(x), y: \(y), shape: \(shape)"
    }
}

extension Point: NSCopying {
    func copy(with zone: NSZone? = nil) -> Any {
        return Point(x: self.x, y: self.y, shape: self.shape)
    }
}

class Shape {
    var type: String
    var size: Int
    
    init(type: String, size: Int) {
        self.type = type
        self.size = size
    }
}

extension Shape: CustomStringConvertible {
    var description: String {
        return "Shape(type: \(type), size: \(size))"
    }
}

extension Shape: NSCopying {
    func copy(with zone: NSZone? = nil) -> Any {
        return Shape(type: self.type, size: self.size)
    }
}

var p1 = Point(x: 0, y: 0, shape: Shape(type: "circle", size: 0))
var p2 = p1.copy() as! Point

p2.x = 42
p2.y = 3
p2.shape.type = "cross"
p2.shape.size = 10

print("p1: \(p1.description) \np2: \(p2.description)")


