import Foundation

// nos livramos da maioria da logica de parse no client
// o client não precisa saber sobre os valores de configuração do objeto
func createBuilder(configuration: [String: String]) -> LaptopBuilder? {
    guard let model = configuration["baseModel"] else { return nil}
    
    var result: LaptopBuilder?
    
    switch model {
    case "budget":
        result = BudgetLaptopBuilder()
    case "office":
        result = OfficeLaptopBuilder()
    case "high-end":
        result = HighEndLaptopBuilder()
    default:
        print("Unexpected value")
    }
    
    return result
}

var configuration = ["baseModel": "budget"]
var laptopBuilder = createBuilder(configuration: configuration)
var director = Director(builder: laptopBuilder)

director.constructLaptop(configuration: configuration)

if let laptop = laptopBuilder?.getLaptop() {
    print(laptop)
}


configuration = ["baseModel": "office",
                 "size": "13-inch"]
laptopBuilder = createBuilder(configuration: configuration)
director = Director(builder: laptopBuilder)

director.constructLaptop(configuration: configuration)

if let laptop = laptopBuilder?.getLaptop() {
    print(laptop)
}
