//
//  IDGenerator.swift
//  MyKeynote
//
//  Created by KoJeongMin  on 2023/07/18.
//

class IDGenerator {
    private var characters = Array("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789")
    private var existingIDs = Set<String>()

    func generateID<T: RandomNumberGenerator>(using generator: inout T) -> String {
        var id: String
        repeat {
            id = "\(randomString(length: 3, using: &generator))-\(randomString(length: 3, using: &generator))-\(randomString(length: 3, using: &generator))"
        } while existingIDs.contains(id)

        existingIDs.insert(id)
        return id
    }

    private func randomString<T: RandomNumberGenerator>(length: Int, using generator: inout T) -> String {
        let randomCharacters = (0..<length).map { _ in characters.randomElement(using: &generator)! }
        return String(randomCharacters)
    }
}

