//
//  NewNoteViewModel.swift
//  note
//
//  Created by นายธนบูรณ์ จิวริยเวชช์ on 4/3/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class NewNoteViewModel: ObservableObject {
    @Published var title = ""
    @Published var note = ""
    @Published var showAlert = false
    
    func save() {
        guard canSave else { return }
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        
        let newId = UUID().uuidString
        let newNote = Note(
            id: newId,
            title: title,
            note: note,
            createDate: Date().timeIntervalSince1970
        )
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uId)
            .collection("notes")
            .document(newId)
            .setData(newNote.asDictionary())
    }
    
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty,
              !note.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        return true
    }
}
