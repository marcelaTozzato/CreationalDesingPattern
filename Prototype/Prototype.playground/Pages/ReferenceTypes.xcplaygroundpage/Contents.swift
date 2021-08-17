import Foundation

class Point {
    var x: Int
    var y: Int
    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
}

// para o print ficar legível:
extension Point: CustomStringConvertible {
    var description: String {
        return "Point(x: \(x), y: \(y))"
    }
}

var p1 = Point(x: 0, y: 0)
var p2 = p1

p2.x = 42
p2.y = 3

print("p1: \(p1.description) \np2: \(p2.description)")

// Para implementar o prototype design pattern
extension Point: NSCopying {
    func copy(with zone: NSZone? = nil) -> Any {
        return Point(x: self.x, y: self.y)
    }
}

var p3 = Point(x: 0, y: 0)
var p4 = p1.copy() as! Point

p4.x = 42
p4.y = 3

print("p3: \(p3.description) \np4: \(p4.description)")
