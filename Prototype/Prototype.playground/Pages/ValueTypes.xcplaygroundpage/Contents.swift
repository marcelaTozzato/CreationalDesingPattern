import Foundation

struct Point {
    var x: Int
    var y: Int
}

var p1 = Point(x: 0, y: 0)
var p2 = p1

p2.x = 42
p2.y = 3

print("p1: \(p1) \np2: \(p2)")
