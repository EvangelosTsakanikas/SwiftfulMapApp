//
//  SwiftfulMapAppApp.swift
//  SwiftfulMapApp
//
//  Created by user268168 on 11/30/24.
//

import SwiftUI

@main
struct SwiftfulMapAppApp: App {
    
    @StateObject private var vm = LocationsViewModel()
    
    var body: some Scene {
        WindowGroup {
            LocationsView()
                .environmentObject(vm)
        }
    }
}
