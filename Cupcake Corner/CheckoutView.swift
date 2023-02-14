//
//  CheckoutView.swift
//  Cupcake Corner
//
//  Created by Bahadır Ersin on 14.02.2023.
//

import SwiftUI

struct CheckoutView: View {
    
    @ObservedObject var order:CupcakeOrder
    @State private var displayOrderComplete = false
    @State private var confirmationMessage = ""
    
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
            
            
            VStack(alignment: .leading){
                    Text("Address Summary")
                        .font(.title2.bold())
                    .padding(.bottom,5)
                
                Divider()
                Text("To: \(order.customerName)")
                Text("Address: \(order.customerAddress), \(order.customerCity), \(order.customerCountry)")
                
            }.padding([.bottom,.top])
                .padding(.leading)
            
            VStack(alignment: .leading){
                    Text("Order Summary")
                        .font(.title2.bold())
                    .padding(.bottom,5)
                
                Divider()
                Text("\(order.quantity) x \(CupcakeOrder.types[order.type]) Cakes")
                Text(order.addSprinkles == true ? "With Sprinkles" : "Without Sprinkles")
                Text(order.extraTopping == true ? "Extra Topping Added" : "No Extra Topping")
                Text("Your total amount to pay is \(order.orderCost, format: .currency(code: "USD"))")
                    .fontWeight(.bold)
            }.padding([.bottom,.top])
                .padding(.leading)
            
            
            Button("Place Order: \(order.orderCost, format: .currency(code: "USD"))"){
                Task{
                    await placeOrder()
                }
             }
            .padding()
            .frame(width:200,height:50)
            .background(.blue)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .foregroundColor(.white)
            .alert("Order Complete", isPresented: $displayOrderComplete){
                
            }message:{
                Text(confirmationMessage)
            }
            
            
        }.navigationTitle("Checkout")
        .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    func placeOrder() async{
        guard let encoded = try? JSONEncoder().encode(order) else{
            print("Order couldn't get encoded")
            return
        }
        
        let url = URL(string: "https://reqres.in/api/cupcakes")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        
        do{
            let (data,_) = try await URLSession.shared.upload(for: request, from: encoded)
            let decoded = try JSONDecoder().decode(CupcakeOrder.self, from: data)
            confirmationMessage = "Thank you for ordering \(decoded.quantity)x \(CupcakeOrder.types[decoded.type]) cakes"
            displayOrderComplete = true
        }catch{
            print("Checkout Failed")
        }
        
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView(order:CupcakeOrder())
    }
}
