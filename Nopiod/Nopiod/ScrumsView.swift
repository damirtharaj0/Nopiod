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
            
            OrderPage()
                .tabItem {
                    Label("", systemImage: "list.dash")
                }
            Text("Current Workout")
                .tabItem {
                    Label("", systemImage: "list.dash")
                }
            
//            MapView(locationManager: .constant(CLLocationManager()), showMapAlert: .constant(true))
//            MapView(location: CLLocationCoordinate2D(latitude: 37.34979956373458, longitude: -121.93898750218749)
                MapView()
                .tabItem {
                    Label("", systemImage: "list.dash")
                }
                .navigationBarHidden(true)
        }
    }
    
}


struct ScrumsView_Previews: PreviewProvider {
    static var previews: some View {
        ScrumsView()
        
    }
}
