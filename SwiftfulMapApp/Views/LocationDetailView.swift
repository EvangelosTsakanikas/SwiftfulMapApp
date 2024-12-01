//
//  LocationDetailView.swift
//  SwiftfulMapApp
//
//  Created by user268168 on 12/1/24.
//

import SwiftUI

struct LocationDetailView: View {
    
    let location: Location
    
    var body: some View {
        ScrollView {
            VStack {
                imageSection
                    .shadow(color: .black.opacity(0.3), radius: 20, x: 0, y: 10)
                
                VStack(alignment: .leading, spacing: 16) {
                    titleSection
                    Divider()
                    descriptionSection
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    LocationDetailView(location: LocationsDataService.locations.first!)
}

extension LocationDetailView {
    
    private var imageSection: some View {
        TabView {
            ForEach(location.imageNames, id:\.self) {
                Image($0)
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width)
                    .clipped()
            }
        }
        .frame(height: 500)
        .tabViewStyle(.page)
    }
    
    private var titleSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(location.name)
                .font(.largeTitle)
                .fontWeight(.semibold)
            Text(location.cityName)
                .font(.title3)
                .foregroundStyle(.secondary)
        }
        
    }
    
    private var descriptionSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(location.description)
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
        
    }
    
}
