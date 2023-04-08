//
//  BookViewModel.swift
//  LibertyBookOfficiel
//
//  Created by bastien giat on 23/03/2023.
//

import Firebase
import FirebaseStorage

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
    
    func createBook(name: String, author: String, image: UIImage, description: String, chapters: [String], buyLink: String) {
        
        
        uploadImage(selectedImage: image) { imageurl in
            let book = Book(image: imageurl, name: name, author: author, description: description, chapters: chapters, audio: "sound", buyLink: buyLink)
            
            guard let encodedBook = try? Firestore.Encoder().encode(book) else { return }
            booksCollection.document().setData(encodedBook) { _ in
                print("DEBUG: did upload book to firestore")
            }
        }
    }
    
    func uploadImage(selectedImage: UIImage?, completion: @escaping(String) -> Void) {
        guard selectedImage != nil else { return }
        let storageRef = Storage.storage().reference()
        
        let imageData = selectedImage!.jpegData(compressionQuality: 0.8)
        
        guard imageData != nil else { return }
        
        let fileRef = storageRef.child("/bookImages/\(NSUUID().uuidString)")
        
        fileRef.putData(imageData!, metadata: nil) { metadata, error in
            if let error = error {
                print("DEBUG: Failed to upload image \(error.localizedDescription)")
                return
            }
            
            print("Successfully uploaded image...")
            
            fileRef.downloadURL { url, _ in
                guard let imageUrl = url?.absoluteString else { return }
                completion(imageUrl)
            }
        }
    }

}
