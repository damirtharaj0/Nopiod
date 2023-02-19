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
                    Label("", systemImage: "list.dash")
                }
                .navigationBarHidden(true)
            
            MapView()
                .tabItem {
                    Label("", systemImage: "list.dash")
                }
            
            ChatBot()
                .tabItem {
                    Label("", systemImage: "list.dash")
                }
        }
    }
    
}


struct ScrumsView_Previews: PreviewProvider {
    static var previews: some View {
        ScrumsView()
        
    }
}
