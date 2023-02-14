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
                    Picker("Select your cake type", selection: $order.type){
                        ForEach(CupcakeOrder.types.indices){
                            Text(CupcakeOrder.types[$0])
                        }
                    }
                    Stepper("Numbe of cakes: \(order.quantity)", value: $order.quantity, in:1...20)
                    Toggle("Add Extras", isOn: $order.additionalRequests.animation())
                    
                    if(order.additionalRequests){
                        Toggle("Extra Topping", isOn: $order.extraTopping)
                        Toggle("Add Sprinkles", isOn:$order.addSprinkles)
                    }
                    
                    HStack{
                        Text("Total Cost:")
                            .fontWeight(.bold)
                        Spacer()
                        Text("\(order.orderCost, format: .currency(code: "USD"))")
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
