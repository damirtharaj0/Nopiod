//
//  ScrumsView.swift
//  Nopiod
//
//  Created by Akhil M on 2/18/23.
//
import SwiftUI
import CoreLocation

struct ScrumsView: View {
    
    var body: some View {
        TabView {
            HomePage()
                .tabItem {
                    Label("", systemImage: "house")
                }
            
            MapView()
                .tabItem {
                    Label("", systemImage: "map")
                }
        
            ChatBot()
                .tabItem {
                    Label("", systemImage: "message")
                }
            
            OrderFlow()
                .tabItem {
                    Label("", systemImage: "doc.plaintext")
                }
        }
        
    }
    
}


struct ScrumsView_Previews: PreviewProvider {
    static var previews: some View {
        ScrumsView()
        
    }
}
