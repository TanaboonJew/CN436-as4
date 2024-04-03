//
//  NoteItemView.swift
//  note
//
//  Created by นายธนบูรณ์ จิวริยเวชช์ on 4/3/24.
//

import SwiftUI

struct NoteItemView: View {
    let note: Note
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(note.title)
                .font(.title)
                .bold()
            Text(note.note)
                .font(.body)
                .foregroundColor(Color(.secondaryLabel))
            Text("\(Date(timeIntervalSince1970: note.createDate).formatted(date: .abbreviated, time: .shortened))")
                .font(.footnote)
                .foregroundColor(Color(.secondaryLabel))
        }
    }
}

struct NoteItemView_Previews: PreviewProvider {
    static var previews: some View {
        NoteItemView(note: Note(id: "123", title: "Title", note: "This is a note", createDate: Date().timeIntervalSince1970))
    }
}
