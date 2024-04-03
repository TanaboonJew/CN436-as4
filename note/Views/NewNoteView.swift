//
//  NewNoteView.swift
//  note
//
//  Created by นายธนบูรณ์ จิวริยเวชช์ on 4/3/24.
//

import SwiftUI

struct NewNoteView: View {
    @StateObject var viewModel = NewNoteViewModel()
    @Binding var newNotePresented: Bool
    
    var body: some View {
        VStack {
            Text("New Note")
                .font(.system(size: 32))
                .bold()
                .padding(.top, 50)
            
            Form {
                TextField("Title", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                TextField("Note", text: $viewModel.note)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                TLButton(title: "Save", background: .pink) {
                    if viewModel.canSave {
                        viewModel.save()
                        newNotePresented = false
                    } else {
                        viewModel.showAlert = true
                    }
                }
            }
            .alert(isPresented: $viewModel.showAlert) {
                Alert(
                    title: Text("Error"),
                    message: Text("Please fill in all fields.")
                )
            }
        }
    }
}

struct NewNoteView_Previews: PreviewProvider {
    static var previews: some View {
        NewNoteView(newNotePresented: .constant(true))
    }
}
