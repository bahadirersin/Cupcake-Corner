//
//  CupcakeOrder.swift
//  Cupcake Corner
//
//  Created by Bahadır Ersin on 14.02.2023.
//

import Foundation

class CupcakeOrder: ObservableObject, Codable{
    
    enum CodingKeys:CodingKey{
        case type,quantity,addSprinkles,extraTopping, customerName, customerAddress, customerCity, customerCountry, customerZipCode
    }
    
    static let types = ["Vanilla","Chocolate","Strawberry","Rainbow","Red Velvet"]
    @Published var type = 0
    @Published var quantity = 3
    @Published var additionalRequests = false {
        didSet{
            if additionalRequests == false{
                addSprinkles = false
                extraTopping = false
            }
        }
    }
    @Published var addSprinkles = false
    @Published var extraTopping = false
    @Published var customerName = ""
    @Published var customerAddress = ""
    @Published var customerCity = ""
    @Published var customerCountry = ""
    @Published var customerZipCode = ""
    
    var hasValidAddress:Bool{
        if( customerName.isEmpty || customerName.trimmingCharacters(in: .whitespaces).isEmpty ||
            customerAddress.isEmpty || customerAddress.trimmingCharacters(in: .whitespaces).isEmpty ||
            customerCity.isEmpty || customerCity.trimmingCharacters(in: .whitespaces).isEmpty ||
            customerCountry.isEmpty || customerCountry.trimmingCharacters(in: .whitespaces).isEmpty ||
            customerZipCode.isEmpty || customerZipCode.trimmingCharacters(in: .whitespaces).isEmpty){
            return false
        }
        
        return true
    }
    
    var orderCost:Double{
        var orderCost = Double(quantity)*2
        
        return orderCost
    }
    
    init() {}
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(type, forKey: .type)
        try container.encode(quantity, forKey: .quantity)
        try container.encode(addSprinkles, forKey: .addSprinkles)
        try container.encode(extraTopping, forKey: .extraTopping)
        try container.encode(customerName, forKey: .customerName)
        try container.encode(customerAddress, forKey: .customerAddress)
        try container.encode(customerCity, forKey: .customerCity)
        try container.encode(customerCountry, forKey: .customerCountry)
        try container.encode(customerZipCode, forKey: .customerZipCode)
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        type = try container.decode(Int.self, forKey: .type)
        quantity = try container.decode(Int.self, forKey: .quantity)
        addSprinkles = try container.decode(Bool.self, forKey: .addSprinkles)
        extraTopping = try container.decode(Bool.self, forKey: .extraTopping)
        customerName = try container.decode(String.self, forKey: .customerName)
        customerAddress = try container.decode(String.self, forKey: .customerAddress)
        customerCity = try container.decode(String.self, forKey: .customerCity)
        customerCountry = try container.decode(String.self, forKey: .customerCountry)
        customerZipCode = try container.decode(String.self, forKey: .customerZipCode)
    }
    
}
