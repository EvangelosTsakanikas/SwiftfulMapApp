//
//  LocationView.swift
//  SwiftfulMapApp
//
//  Created by user268168 on 11/30/24.
//

import SwiftUI
import MapKit

struct LocationsView: View {
    
    @EnvironmentObject private var vm: LocationsViewModel
    
    @State private var cameraPosition: MapCameraPosition = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(
                latitude: 41.8902,
                longitude: 12.4922
            ),
            span: MKCoordinateSpan(
                latitudeDelta: 0.1,
                longitudeDelta: 0.1
            )
        )
    )
    
    
    var body: some View {
        ZStack {
            Map(position: $vm.cameraPosition)
                .ignoresSafeArea()
        }
    }
}

#Preview {
    LocationsView()
        .environmentObject(LocationsViewModel())
}