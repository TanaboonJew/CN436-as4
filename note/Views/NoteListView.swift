//
//  NoteListView.swift
//  note
//
//  Created by นายธนบูรณ์ จิวริยเวชช์ on 4/3/24.
//

import SwiftUI
import FirebaseFirestoreSwift

struct NoteListView: View {
    @StateObject var viewModel: NoteListViewModel
    
    @FirestoreQuery var notes: [Note]
    
    init(userId: String) {
        self._notes = FirestoreQuery(collectionPath: "users/\(userId)/notes")
        self._viewModel = StateObject(wrappedValue: NoteListViewModel(userId: userId))
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(notes) { note in
                    NoteItemView(note: note)
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("Notes")
            .toolbar {
                Button {
                    viewModel.showingNewNoteView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewNoteView) {
                NewNoteView(newNotePresented: $viewModel.showingNewNoteView)
            }
        }
    }
}

struct NoteListView_Previews: PreviewProvider {
    static var previews: some View {
        NoteListView(userId: "lRW08O12vffnFAkNuaGF")
    }
}
