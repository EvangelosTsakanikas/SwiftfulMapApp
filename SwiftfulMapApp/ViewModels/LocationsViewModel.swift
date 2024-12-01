//
//  LocationsViewModel.swift
//  SwiftfulMapApp
//
//  Created by user268168 on 12/1/24.
//

import Foundation
import MapKit
import SwiftUI

class LocationsViewModel: ObservableObject {
    
    // All loaded locations
    @Published var locations: [Location]
    
    // Current location on map
    @Published var mapLocation: Location {
        didSet {
            updateMapRegion(location: mapLocation)
        }
    }
    
    // mapRegion in the bvideo
    @Published var cameraPosition: MapCameraPosition = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 41.8902,longitude: 12.4922),
            span: MKCoordinateSpan(latitudeDelta: 0.1,longitudeDelta: 0.1)
        )
    )
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1,longitudeDelta: 0.1)
    
    // show list of locations
    @Published var showLocationsList: Bool = false
    
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
        self.mapLocation = locations.first!
        
        self.updateMapRegion(location: locations.first!)
    }
    
    private func updateMapRegion(location: Location) {
        withAnimation(.easeInOut) {
            cameraPosition = MapCameraPosition.region(
                MKCoordinateRegion(center: location.coordinates,span: mapSpan)
            )
        }
    }
    
    func toggleLocationsList() {
        withAnimation(.easeInOut) {
            showLocationsList.toggle()
        }
    }
    
    func showNextLocation(location: Location) {
        withAnimation(.easeInOut) {
            mapLocation = location
            showLocationsList = false
        }
    }
}
