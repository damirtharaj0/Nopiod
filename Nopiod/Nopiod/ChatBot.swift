//
//  ChatBot.swift
//  Nopiod
//
//  Created by Daniel Amirtharaj on 2/18/23.
//

import SwiftUI

struct ChatBot: View {
    
    @State private var showAlert = false
    
    @State private var textInput: String = ""
    @State var chatResponse: String = ""
    
    init() {
        UITextView.appearance().backgroundColor = .clear
    }
    
    
    
    func emergencyCall() -> Void {
        let phoneNumber = "408-315-7040"
        let phone = "tel://"
        let phoneNumberformatted = phone + phoneNumber
        guard let url = URL(string: phoneNumberformatted) else { return }
        UIApplication.shared.open(url)
    }
    
    // rest api login call
        private func search() {
            
            // define response structs
            struct Response: Codable {
                let result: String
            }
            
            let components = textInput.components(separatedBy: " ")
            
            var rsp = ""
            for wrd in components {
                rsp += wrd
                rsp += "+"
            }
            
            // create request
            var request = URLRequest(url: URL(string: "http://127.0.0.1:5000/search?text=" + rsp)!)
            request.httpMethod = "GET"
            
            // perform request
            URLSession.shared.dataTask(with: request) { (data, _, _) in
                
                // decode response into response struct
                guard let response = try? JSONDecoder().decode(Response.self, from: data!) else {
                    return
                }
                
                chatResponse = response.result
                
            }.resume()
        }
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Text("Questions?")
                        .frame(maxWidth: .infinity )
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
                
                Rectangle()
                    .overlay(
                        TextEditor(text: $textInput)
                            .background(Color.card)
                            .foregroundColor(Color.txt)
                            .padding()
                        
                    )
                    .frame(height: 300)
                    .cornerRadius(16)
                    .foregroundColor(Color.card)
                    .padding(.horizontal, 8)
                
                Button {
                    search()
                } label: {
                    Text("Submit")
                }
                Spacer()
                
                Rectangle()
                    .overlay(
                        Text(chatResponse)
                            .foregroundColor(Color.txt)
                            
                    )
                    .frame(height: 300)
                    .cornerRadius(16)
                    .foregroundColor(Color.card)
                    .padding(.horizontal, 8)
            }
        }
        .background(Color.bg)
    }
}

struct ChatBot_Previews: PreviewProvider {
    static var previews: some View {
        ChatBot()
    }
}
