//
//  HomePage.swift
//  Nopiod
//
//  Created by Daniel Amirtharaj on 2/18/23.
//

import SwiftUI

struct HomePage: View {
    @State private var showAlert = false
    
    func emergencyCall() -> Void {
        let phoneNumber = "403-315-7040"
        let phone = "tel://"
        let phoneNumberformatted = phone + phoneNumber
        guard let url = URL(string: phoneNumberformatted) else { return }
        UIApplication.shared.open(url)
        
    }
    
    var body: some View {
        ZStack {
            VStack {
                // Overdose title
                HStack {
                    Text("Someone Overdosing?")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(Color.white)
                        .font(Font.largeTitle.weight(.bold))
                    
                    Button {
                        showAlert = true
                    } label: {
                        Rectangle()
                            .fill(Color.card)
                            .frame(width: 104, height: 72)
                            .cornerRadius(16.0)
                            .shadow(color: .red, radius: 8, x: 0, y: 0)
                            .overlay(
                                Text("SOS")
                                    .foregroundColor(.red)
                            )
                            .padding(.trailing)
                    }
                    .alert(isPresented: $showAlert) {
                        Alert(
                            title: Text("Emergency Call"),
                            primaryButton: .default(
                                Text("Ok"),
                                action: {
                                    emergencyCall()
                                }
                            ),
                            secondaryButton: .destructive(
                                Text("Cancel"),
                                action: {
                                    print("Cancel")
                                }
                            )
                        )
                    }
                }
                .padding()
                
                Spacer()
                
                
                Rectangle()
                    .fill(Color.card)
                    .cornerRadius(16.0)
                    .overlay(
                        VStack {
                            Spacer()
                            HStack {
                                Spacer()
                                Rectangle()
                                    .fill(Color.card)
                                    .frame(width: 104, height: 72)
                                    .cornerRadius(16.0)
                                    .shadow(color: .red, radius: 8, x: 0, y: 0)
                                    .overlay(
                                        Text("SOS")
                                            .foregroundColor(.red)
                                    )
                                    .padding(.trailing)
                                Spacer()
                                Text("Call 911")
                                    .foregroundColor(Color.txt)
                                Spacer()
                                
                            }
                            Spacer()
                            HStack {
                                Spacer()
                                Text("Monitor vital signs")
                                    .foregroundColor(Color.txt)
                                Spacer()
                                Rectangle()
                                    .frame(width: 100, height: 60)
                                    .foregroundColor(.card)
                                Spacer()
                            }
                            Spacer()
                            HStack {
                                Spacer()
                                GifImage("narcan")
                                    .frame(width: 160, height: 120)
                                    .cornerRadius(16)
                                Spacer()
                                Text("Administer narcan")
                                    .foregroundColor(Color.txt)
                                    .multilineTextAlignment(.center)
                                Spacer()
                            }
                            Spacer()
                        }
                            .padding()
                            .padding([.vertical], 16)
                    )
                    .padding(32)
                
                Spacer()
                
                Rectangle()
                    .fill(Color.card)
                    .frame(height: 72)
                    .cornerRadius(16.0)
                    .overlay(
                        HStack {
                            Text("A")
                                .foregroundColor(Color.txt)
                            Spacer()
                            Text("B")
                                .foregroundColor(Color.txt)
                            Spacer()
                            Text("C")
                                .foregroundColor(Color.txt)
                            Spacer()
                            Text("D")
                                .foregroundColor(Color.txt)
                            Spacer()
                            Text("E")
                                .foregroundColor(Color.txt)
                        }
                            .padding(32)
                    )
                    .padding([.horizontal], 32)
            }
        }
        .background(Color.bg)
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}
