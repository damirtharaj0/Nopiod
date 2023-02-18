//
//  ScrumsView.swift
//  Nopiod
//
//  Created by Akhil M on 2/18/23.
//
import SwiftUI

struct ScrumsView: View {
//    let scrums: [DailyScrum]
    @State private var showAlert = false
    
    var body: some View {
//        HomePage()
        
//        Spacer()
        TabView {
               HomePage()
                   .tabItem {
                       Label("", systemImage: "list.dash")
                   }
               
               Text("Current Workout")
                   .tabItem {
                       Label("", systemImage: "list.dash")
                   }
               
               Text("My Workouts")
                   .tabItem {
                       Label("", systemImage: "list.dash")
                   }
               
//               Button("Sign Out") {
//                   jwtToken = "";
//               }
               .tabItem {
                   Label("", systemImage: "list.dash")
               }
           }
       }
        
    }


struct ScrumsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ScrumsView()
        }
    }
}
