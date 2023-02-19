//
//  OrderFlow.swift
//  Nopiod
//
//  Created by Akhil M on 2/19/23.
//


import SwiftUI


extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {
            
            ZStack(alignment: alignment) {
                placeholder().opacity(shouldShow ? 1 : 0)
                self
            }
        }
}

struct OrderFlow : View {
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var address: String = ""
    
    var body: some View {
        VStack{
            HStack{
                Text("Order Narcan")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(Color.white)
                    .font(Font.largeTitle.weight(.bold))
                Spacer()
            }
            .padding(32)
            
            VStack{
                HStack{
                    VStack{
                        HStack{
                            Text("Name")
                                .fontWeight(.bold)
                                .foregroundColor(Color.white)
                            Spacer()
                        }
                        TextField("", text: $name)
                            .placeholder(when: name.isEmpty) {
                                Text("Enter Full Name Here").foregroundColor(.txt)
                                    .foregroundColor(Color.txt)
                                    .background(Color.bg)
                                    .cornerRadius(2)
                            }
                            .foregroundColor(Color.txt)
                        //                        Spacer()
                    }
                    .padding([.horizontal], 32)
                    .padding([.vertical], 16)
                }
                HStack{
                    VStack{
                        HStack{
                            Text("Email Address")
                                .fontWeight(.bold)
                                .foregroundColor(Color.white)
                            Spacer()
                        }
                        TextField("", text: $email)
                            .placeholder(when: email.isEmpty) {
                                Text("Enter Email Address Here").foregroundColor(.txt)
                                    .foregroundColor(Color.txt)
                                    .background(Color.bg)
                                    .cornerRadius(2)
                            }
                            .foregroundColor(Color.txt)
                        //                        Spacer()
                    }
                    .padding([.horizontal], 32)
                    .padding([.vertical], 16)
                }
                HStack{
                    VStack{
                        HStack{
                            Text("Shipping Adress")
                                .fontWeight(.bold)
                                .foregroundColor(Color.white)
                            Spacer()
                        }
                        TextField("", text: $address)
                            .placeholder(when: address.isEmpty) {
                                Text("Enter Shipping Address Here").foregroundColor(.txt)
                                    .foregroundColor(Color.txt)
                                    .background(Color.bg)
                                    .cornerRadius(2)
                            }
                            .foregroundColor(Color.txt)
                    }
                    .padding([.horizontal], 32)
                    .padding([.vertical], 16)
                }
                Spacer()
                Button {
                } label: {
                    Rectangle()
                        .fill(Color.card)
                        .frame(width: 256, height: 64)
                        .cornerRadius(16.0)
                        .shadow(color: .blue, radius: 4, x: 0, y: 0)
                        .overlay(
                            Text("Submit")
                                .foregroundColor(.white)
                        )
                }
                
            }
        }.background(Color.bg)
    }
}


struct OrderFlow_Previews: PreviewProvider {
    static var previews: some View {
        OrderFlow()
    }
}
