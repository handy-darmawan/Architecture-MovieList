//
//  String+Extension.swift
//  VIPER-MovieList
//
//  Created by ndyyy on 07/01/24.
//

import UIKit



extension String {
    func convertHTMLToAttributedString() -> NSAttributedString? {
        var _self = self
        let cssFontSize = "<style>* {font-size: 18px;}</style>"
        _self.append(cssFontSize)
        
        guard let data = _self.data(using: .unicode) else { return nil}
        let attributedString = try? NSMutableAttributedString.init(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
        return attributedString
    }

    func boldLabelWithLength() -> NSMutableAttributedString {
        let attributedString = NSMutableAttributedString(string: self)
        let colonPosition = self.firstIndex(of: ":") ?? self.startIndex
        let length = self.distance(from: self.startIndex, to: colonPosition)
        
        attributedString.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 16), range: NSRange(location: 0, length: length))
        return attributedString
    }
    
    func boldLabelAndColoringGenre(items: [GenreEnum]) -> NSMutableAttributedString {
        let mutableAttributedString = self.boldLabelWithLength()
        
        for x in items.indices {
            let genre = items[x]
            let genreLength = genre.rawValue.count
            
            let attributedString = NSMutableAttributedString(string: genre.rawValue)
            attributedString.addAttribute(.foregroundColor, value: genre.color, range: NSRange(location: 0, length: genreLength))
            
            if x != items.count - 1 {
                let separator = ", "
                attributedString.append(NSAttributedString(string: separator))
            }
            mutableAttributedString.append(attributedString)
        }
        return mutableAttributedString
    }
}
