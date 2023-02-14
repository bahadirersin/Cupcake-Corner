//
//  ContentView.swift
//  Cupcake Corner
//
//  Created by Bahadır Ersin on 14.02.2023.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var order = CupcakeOrder()

    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    Picker("Select your cake type", selection: $order.cupcake.type){
                        ForEach(CupcakeOrderStruct.types.indices){
                            Text(CupcakeOrderStruct.types[$0])
                        }
                    }
                    Stepper("Numbe of cakes: \(order.cupcake.quantity)", value: $order.cupcake.quantity, in:1...20)
                    Toggle("Add Extras", isOn: $order.cupcake.additionalRequests.animation())
                    
                    if(order.cupcake.additionalRequests){
                        Toggle("Extra Topping", isOn: $order.cupcake.extraTopping)
                        Toggle("Add Sprinkles", isOn:$order.cupcake.addSprinkles)
                    }
                    
                    HStack{
                        Text("Total Cost:")
                            .fontWeight(.bold)
                        Spacer()
                        Text("\(order.cupcake.orderCost, format: .currency(code: "USD"))")
                            .fontWeight(.bold)
                    }
                }
                
                Section{
                    NavigationLink{
                        AddressView(order: order)
                    }label: {
                        Text("Continue with Delivery")
                    }
                }
            }.navigationTitle("Cupcake Order")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
