//
//  StretchedTextView.swift
//  StretchyText
//
//  Created by Oskar Groth on 2021-04-17.
//

import SwiftUI

struct StretchedTextView: View {
    
    let text: String
    let font: NSFont
    let color: NSColor
    
    var body: some View {
        CustomDrawingView { rect in
            guard let context = NSGraphicsContext.current?.cgContext else { return }
            let attrString = NSAttributedString(string: text, attributes: [
                .font: font,
                .foregroundColor: color,
                .kern: 1
            ])
            let sx = rect.size.width / attrString.size().width
            let sy = rect.size.height / attrString.size().height
            context.scaleBy(x: sx, y: sy)
            context.translateBy(x: 1, y: 1)
            attrString.draw(with: rect)
        }
    }

}
