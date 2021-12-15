//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Brayden Lemke on 12/6/21.
//

import SwiftUI

@main
struct LandmarksApp: App {
    @StateObject private var modelData = ModelData()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
