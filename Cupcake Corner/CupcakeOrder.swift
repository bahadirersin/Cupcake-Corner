//
//  CupcakeOrder.swift
//  Cupcake Corner
//
//  Created by Bahadır Ersin on 14.02.2023.
//

import Foundation

class CupcakeOrder: ObservableObject, Codable{
    
    enum CodingKeys:CodingKey{
        case cupcake
    }
    
    @Published var cupcake:CupcakeOrderStruct = CupcakeOrderStruct()
    
//    static let types = ["Vanilla","Chocolate","Strawberry","Rainbow","Red Velvet"]
//    @Published var type = 0
//    @Published var quantity = 3
//    @Published var additionalRequests = false {
//        didSet{
//            if additionalRequests == false{
//                addSprinkles = false
//                extraTopping = false
//            }
//        }
//    }
//    @Published var addSprinkles = false
//    @Published var extraTopping = false
//    @Published var customerName = ""
//    @Published var customerAddress = ""
//    @Published var customerCity = ""
//    @Published var customerCountry = ""
//    @Published var customerZipCode = ""
//
//    var hasValidAddress:Bool{
//        if( customerName.isEmpty || customerName.trimmingCharacters(in: .whitespaces).isEmpty ||
//            customerAddress.isEmpty || customerAddress.trimmingCharacters(in: .whitespaces).isEmpty ||
//            customerCity.isEmpty || customerCity.trimmingCharacters(in: .whitespaces).isEmpty ||
//            customerCountry.isEmpty || customerCountry.trimmingCharacters(in: .whitespaces).isEmpty ||
//            customerZipCode.isEmpty || customerZipCode.trimmingCharacters(in: .whitespaces).isEmpty){
//            return false
//        }
//
//        return true
//    }
//
//    var orderCost:Double{
//        var orderCost = Double(quantity)*2
//        if(addSprinkles){
//            orderCost += Double(quantity)/2
//        }
//        if(extraTopping){
//            orderCost += Double(quantity)
//        }
//        return orderCost
//    }
    
    init() {}
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(cupcake, forKey: .cupcake)
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        cupcake = try container.decode(CupcakeOrderStruct.self, forKey: .cupcake)
    }
    
}
