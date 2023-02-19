//
//  ScrumsView.swift
//  Nopiod
//
//  Created by Akhil M on 2/18/23.
//
import SwiftUI

struct ScrumsView: View {
    
    var body: some View {
        TabView {
            HomePage()
                .tabItem {
                    Label("", systemImage: "list.dash")
                }
                .navigationBarHidden(true)
            
            Text("Current Workout")
                .tabItem {
                    Label("", systemImage: "list.dash")
                }
            
            Text("My Workouts")
                .tabItem {
                    Label("", systemImage: "list.dash")
                }
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
