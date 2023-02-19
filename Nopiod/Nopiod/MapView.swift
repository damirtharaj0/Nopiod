//
//  MapView.swift
//  Nopiod
//
//  Created by Akhil M on 2/18/23.
//

import SwiftUI
import MapKit
import CoreLocation
import CoreLocationUI



class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    let manager = CLLocationManager()
    
    @Published var location: CLLocationCoordinate2D?
    
    override init() {
        super.init()
        manager.delegate = self
    }
    
    func requestLocation() {
        manager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.first?.coordinate
    }
}
//
struct MyAnnotationItem: Identifiable {
    var coordinate: CLLocationCoordinate2D
    let id = UUID()
}
//



struct MapView: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.34979956373458, longitude: -121.93898750218749),
        span: MKCoordinateSpan(latitudeDelta: 0.15, longitudeDelta: 0.15)
    )
    
    //
    //    @State var location: CLLocationCoordinate2D
    //    @State private var mapRegion: MKCoordinateRegion
    //    @State private var trackingMode = MapUserTrackingMode.follow
    //    let markers: [Marker]
    //
    //    init(location: CLLocationCoordinate2D) {
    //      _location = State(initialValue: location)
    //      _mapRegion = State(initialValue: MKCoordinateRegion(center: location, span: MKCoordinateSpan(latitudeDelta: 0.00625, longitudeDelta: 0.00625)))
    //      markers = [Marker(location: MapPin(coordinate: location))]
    //    }
    //
    
    @State private var showAlert = false
    
    var annotationItems: [MyAnnotationItem] = [
            MyAnnotationItem(coordinate: CLLocationCoordinate2D(latitude: 37.35003759695697, longitude: -121.9406019868026)),
            MyAnnotationItem(coordinate: CLLocationCoordinate2D(latitude: 37.3353665203413, longitude: -121.88103931563867 )),
        ]
//    37.35003759695697, -121.9406019868026 SCU
//    37.3353665203413, -121.88103931563867 SJSU
    var body: some View {
        
        VStack {
            
//
            HStack {
                Text("Narcan Locations:")
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
//                                emergencyCall()
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
            
//
            Rectangle()
                .fill(Color.card)
                .cornerRadius(16.0)
                .overlay(
                    VStack {
                        Map(coordinateRegion: $region,
                            annotationItems: annotationItems){
                            item in
                                            MapPin(coordinate: item.coordinate)
                        }.cornerRadius(16.0)
                    }
                ).padding([.horizontal],16)
            
            
            //            Spacer()
            
            Rectangle()
                .fill(Color.card)
                .cornerRadius(16.0)
                .overlay(
                    VStack{
                        HStack{
                            VStack{
                            
                                    Text("Cowell Student Health Clinic  ")
                                        .fontWeight(.bold)
                                        .foregroundColor(Color.txt)
                                    
                                HStack{
                                    Text("500 El Camino Real, Santa Clara, CA 95050")
                                        .foregroundColor(Color.txt)
                                    Spacer()
                                }
//                                    Text("500 El Camino Real, Santa Clara, CA 95050")
//                                        .foregroundColor(Color.txt)
                            }
                            Spacer()
                            Button {
                                if let url = URL(string: "https://maps.apple.com/?address=500%20El%20Camino%20Real,%20Santa%20Clara,%20CA%20%2095053,%20United%20States&ll=37.349372,-121.940286&q=500%20El%20Camino%20Real&t=m") {
                                    UIApplication.shared.open(url)
                                }
                            } label: {
                                // go button
                                Rectangle()
                                    .fill(Color.green)
                                    .cornerRadius(16.0)
                                    .frame(width: 70, height: 70)
                                    .overlay(
                                        VStack {
                                            Text("Go")
                                                .bold()
                                                .foregroundColor(Color.white)
                                        }
                                    )
                            }
                        }.padding()
                        
                        HStack{
                            VStack{
                                
                                Text("SJSU Student Health Center  ")
                                    .bold()
                                    .foregroundColor(Color.txt)
                                
                                HStack{
                                    Text("One Washington Square, San Jose, CA 95192")
                                        .foregroundColor(Color.txt)
                                    Spacer()
                                }
                                
                            }
                            Spacer()
                            
                            Button {
                                if let url = URL(string: "https://maps.apple.com/?address=1%20Washington%20Square,%20San%20Jos%C3%A9,%20CA%2095192,%20United%20States&auid=2307802018962819875&ll=37.334492,-121.879842&lsp=9902&q=SJSU&t=m") {
                                    UIApplication.shared.open(url)
                                }
                            } label: {
                                Rectangle()
                                    .fill(Color.green)
                                    .cornerRadius(16.0)
                                    .frame(width: 70, height: 70)
                                    .overlay(
                                        VStack {
                                            Text("Go")
                                                .bold()
                                                .foregroundColor(Color.white)
                                        }
                                    )
                            }
                        }.padding()
                        Spacer()
                        
                    }.cornerRadius(16.0)
                )
                .padding(16)
            
        }
        .background(Color.bg)
    }
}








struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
        //        MapView(location: CLLocationCoordinate2D(latitude: 37.34979956373458, longitude: -121.93898750218749))
    }
}

class LocationDataManager : NSObject, CLLocationManagerDelegate {
    var locationManager = CLLocationManager()
    var mapViewRegion: MKCoordinateRegion?
    
    override init() {
        super.init()
        locationManager.delegate = self
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
            let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
            mapViewRegion = region
        }
    }
}


extension MapView {
    func getUserLocation() {
        let locationDataManager = LocationDataManager()
        locationDataManager.locationManager.requestAlwaysAuthorization()
        locationDataManager.locationManager.startUpdatingLocation()
    }
}

//class MapPins:

