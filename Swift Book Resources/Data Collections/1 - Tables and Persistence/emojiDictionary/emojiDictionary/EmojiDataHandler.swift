//
//  EmojiDataHandler.swift
//  emojiDictionary
//
//  Created by Brayden Lemke on 10/18/21.
//

import Foundation

protocol EmojisUpdated {
    func updatedEmojis(newEmojis: [Emoji])
}

struct EmojiDataHandler {
    static var current = EmojiDataHandler(emojis: defaultEmojis)
    //private(set) means that only this struct can set but anyone can get
    private(set) var emojis: [Emoji] {
        didSet {
            listener?.updatedEmojis(newEmojis: emojis)
        }
    }
    
    var listener: EmojisUpdated? {
        didSet {
            listener?.updatedEmojis(newEmojis: emojis)
        }
    }
    
    mutating func updateEmoji(index: Int, emoji: Emoji) {
        emojis[index] = emoji
        Emoji.saveToFile(emojis: emojis)
    }
    
    mutating func addNewEmoji(emoji: Emoji) {
        emojis.append(emoji)
        Emoji.saveToFile(emojis: emojis)
    }
    
    mutating func addNewEmoji(emoji: Emoji, to index: Int) {
        emojis.insert(emoji, at: index)
        Emoji.saveToFile(emojis: emojis)
    }
    
    mutating func removeEmoji(index: Int) -> Emoji {
        Emoji.saveToFile(emojis: emojis)
        return emojis.remove(at: index)
    }
}

// MARK: - Default Data

extension EmojiDataHandler {
    private static var defaultEmojis: [Emoji] {
        return Emoji.loadFromFile()
    }
}

