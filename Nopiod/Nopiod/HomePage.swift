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
        let phoneNumber = "408-315-7040"
        let phone = "tel://"
        let phoneNumberformatted = phone + phoneNumber
        guard let url = URL(string: phoneNumberformatted) else { return }
        UIApplication.shared.open(url)
        
    }
    
    var body: some View {
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
                        .shadow(color: .red, radius: 4, x: 0, y: 0)
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
                                .overlay(
                                    Rectangle()
                                        .fill(Color.card)
                                        .cornerRadius(16.0)
                                        .overlay(
                                            GifImage("sos")
                                        )
                                )
                                .frame(width: 150, height: 200)
                                .foregroundColor(Color.bg)
                                .cornerRadius(16)
                                .shadow(color: Color.bg, radius: 8, x: 0, y: 0)
                            
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
                                .overlay(
                                    Image("pulse")
                                        .resizable()
                                        .frame(width: 120, height: 50)
                                )
                                .cornerRadius(16)
                                .frame(width: 140, height: 100)
                                .foregroundColor(Color.bg)
                                .shadow(color: Color.bg, radius: 8, x: 0, y: 0)
                            
                            Spacer()
                        }
                        Spacer()
                        HStack {
                            Spacer()
                            Rectangle()
                                .overlay(
                                    Image("narcan")
                                        .resizable()
                                        .cornerRadius(16)
                                        .colorInvert()
                                )
                                .frame(width: 150, height: 110)
                                .foregroundColor(Color.bg)
                                .cornerRadius(16)
                                .shadow(color: Color.bg, radius: 8, x: 0, y: 0)
                            
                            
                            
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
                .padding(16)
            
            Spacer()
            
        }
        .background(Color.bg)
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}
