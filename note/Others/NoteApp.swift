//
//  NoteApp.swift
//  note
//
//  Created by นายธนบูรณ์ จิวริยเวชช์ on 4/3/24.
//

import SwiftUI
import FirebaseCore

@main
struct NoteApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
