//
//  AddressView.swift
//  Cupcake Corner
//
//  Created by Bahadır Ersin on 14.02.2023.
//

import SwiftUI

struct AddressView: View {
    
    @ObservedObject var order:CupcakeOrder
    
    var body: some View {

            Form{
                Section{
                    TextField("Name",text: $order.cupcake.customerName)
                    TextField("Address",text: $order.cupcake.customerAddress)
                    TextField("City",text: $order.cupcake.customerCity)
                    TextField("Country",text: $order.cupcake.customerCountry)
                    TextField("Zip Code", text: $order.cupcake.customerZipCode)
                        .keyboardType(.numberPad)
                }
                
                Section{
                    NavigationLink{
                        CheckoutView(order: order)
                    }label:{
                        Text("Continue to Checkout")
                    }.disabled(order.cupcake.hasValidAddress == false)
                }
            }.navigationTitle("Address Details")
                .navigationBarTitleDisplayMode(.inline)
        
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        AddressView(order:CupcakeOrder())
    }
}
