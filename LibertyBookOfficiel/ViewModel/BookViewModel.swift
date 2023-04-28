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
    @Published var favoritesBooks = [Book]()
    let DB = Firestore.firestore()
    
    init() {
        fetchBooks()
    }
    
    func fetchBooks() {
        booksCollection.addSnapshotListener { snapshot, error in
            guard let documents = snapshot?.documents else { return }
            self.books = documents.compactMap({ try? $0.data(as: Book.self) })
        }
    }
    
    func filteredBooks(_ query: String) -> [Book] {
        let lowercasedQuery = query.lowercased()
        return books.filter({ $0.name.lowercased().contains(lowercasedQuery) || $0.author.lowercased().contains(lowercasedQuery)})
    }
    
    func createBook(name: String, author: String, image: UIImage, description: String, chapters: [String], buyLink: String, sound: String) {
        self.uploadImage(selectedImage: image) { imageurl in
            let book = Book(image: imageurl, name: name, author: author, description: description, chapters: chapters, audio: sound, buyLink: buyLink)
            
            guard let encodedBook = try? Firestore.Encoder().encode(book) else { return }
            booksCollection.document().setData(encodedBook) { _ in
                print("DEBUG: did upload book to firestore")
            }
            
        }
    }
    
    //    func getSongUrl(musicPath: String, completion: @escaping(String) -> Void) {
    //        let storageRef = Storage.storage()
    //        let musicRef = storageRef.reference(withPath: musicPath)
    //        print("DEBUG: we get the path \(musicRef)")
    //        musicRef.downloadURL { url, error in
    //            print("DEBUG: we enter in the download")
    //            guard let musicUrl = url?.absoluteString else {
    //                print("DEBUG: could not get music url")
    //                return
    //            }
    //            print("DEBUG: did get music URL: \(musicUrl)")
    //            completion(musicUrl)
    //        }
    //
    //    }
    
    func addToFavorites(userId: String, book: Book, completion: @escaping(_ success: Bool) -> Void) {
        DB.collection("users").document(userId).updateData(["hasLiked" : FieldValue.arrayUnion([book.name])])
        self.favoritesBooks.append(book)
        completion(true)
    }
    
    func removeFromFavorites(userId: String, book: Book, completion: @escaping(_ success: Bool) -> Void) {
        DB.collection("users").document(userId).updateData(["hasLiked" : FieldValue.arrayRemove([book.name])])
        favoritesBooks.removeAll(where: { $0 == book })
        completion(true)
    }
    
    func fetchFavorites() {
        self.favoritesBooks = []
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        usersCollection.document(uid).getDocument { snapshot, error in
            if let error = error {
                print("Debug: error getting user : \(error.localizedDescription)")
            }
            
            guard let document = snapshot else { return }
            
            guard let names = document.data()?["hasLiked"] as? [String] else { return }
            
            for name in names {
                booksCollection.whereField("name", isEqualTo: name).addSnapshotListener { snapshot, error in
                    guard let documents = snapshot?.documents else { return }
                    self.favoritesBooks += documents.compactMap({ try? $0.data(as: Book.self) })
                }
            }
        }
    }
    
    func uploadImage(selectedImage: UIImage?, completion: @escaping(String) -> Void) {
        guard selectedImage != nil else { return }
        let storageRef = Storage.storage()
        
        let imageData = selectedImage!.jpegData(compressionQuality: 0.8)
        
        guard imageData != nil else { return }
        
        let fileRef = storageRef.reference().child("/bookImages/\(NSUUID().uuidString)")
        
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
