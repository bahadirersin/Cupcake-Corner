//
//  CheckoutView.swift
//  Cupcake Corner
//
//  Created by Bahadır Ersin on 14.02.2023.
//

import SwiftUI

struct CheckoutView: View {
    
    @ObservedObject var order:CupcakeOrder
    
    var body: some View {
    ScrollView{
        VStack{
            AsyncImage(url: URL(string: "https://hws.dev/img/cupcakes@3x.jpg"), scale: 3){ image in
                image
                    .resizable()
                    .scaledToFit()
            }placeholder:{
                ProgressView()
            }
            .frame(height: 223)
            
            Text("Your total amount to pay is \(order.orderCost, format: .currency(code: "USD"))")
                .font(.title)
            
            Button("Place Order"){
                
            }
            .padding()
        }.navigationTitle("Checkout")
        .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView(order:CupcakeOrder())
    }
}
