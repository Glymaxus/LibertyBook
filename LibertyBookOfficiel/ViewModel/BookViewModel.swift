//
//  BookViewModel.swift
//  LibertyBookOfficiel
//
//  Created by bastien giat on 23/03/2023.
//

import Firebase

class BookViewModel: ObservableObject {
    @Published var books = [Book]()
    
    init() {
        fetchBooks()
    }
    
    func fetchBooks() {
        booksCollection.getDocuments { snapshot, error in
            guard let documents = snapshot?.documents else { return }
            self.books = documents.compactMap({ try? $0.data(as: Book.self) })
        }
    }
}
