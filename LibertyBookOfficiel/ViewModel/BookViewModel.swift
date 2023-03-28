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
    
    func filteredBooks(_ query: String) -> [Book] {
        let lowercasedQuery = query.lowercased()
        return books.filter({ $0.name.lowercased().contains(lowercasedQuery) || $0.author.lowercased().contains(lowercasedQuery)})
    }

}
