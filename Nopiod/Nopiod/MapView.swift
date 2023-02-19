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
//struct Marker: Identifiable {
//  let id = UUID()
//  var location: MapPin
//}
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
    
    var body: some View {
        VStack {
            Rectangle()
                .fill(Color.card)
                .cornerRadius(16.0)
                .overlay(
                    VStack {
                        Map(coordinateRegion: $region).cornerRadius(16.0)
                        //                        .padding()
                        //                        .padding([.vertical], 16)
                    }
                ).padding([.vertical], 16)
            
            
            Spacer()
            
            Rectangle()
                .fill(Color.card)
                .cornerRadius(16.0)
                .overlay(
                    VStack {
                        //                        MapUserTrackingMode.follow
                        //                        Map(
                        //                              coordinateRegion: $mapRegion,
                        //                              showsUserLocation: true,
                        //                              userTrackingMode: $trackingMode,
                        //                              annotationItems: markers) { marker in
                        //                                marker.location
                        //                              }
                        //                              .edgesIgnoringSafeArea(.bottom)
                    }
                )
            
        }.padding(32)
        
        
        //    }
    }
}
    
    
    
    
    
    


//    struct MapView_Previews: PreviewProvider {
//        static var previews: some View {
//            MapView()
//    //        MapView(location: CLLocationCoordinate2D(latitude: 37.34979956373458, longitude: -121.93898750218749))
//        }
//    }

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

