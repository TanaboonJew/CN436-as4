//
//  NoteListViewModel.swift
//  note
//
//  Created by นายธนบูรณ์ จิวริยเวชช์ on 4/3/24.
//

import Foundation
import FirebaseFirestore

class NoteListViewModel: ObservableObject {
    @Published var showingNewNoteView = false
    
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
}
