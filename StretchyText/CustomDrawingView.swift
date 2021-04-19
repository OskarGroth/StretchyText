//
//  CustomDrawingView.swift
//  StretchyText
//
//  Created by Oskar Groth on 2021-04-17.
//

import SwiftUI

public struct CustomDrawingView: View {
    
    public typealias DrawingHandler = ((CGRect) -> Void)

    var drawingHandler: DrawingHandler
    
    public init(_ drawingHandler: @escaping DrawingHandler) {
        self.drawingHandler = drawingHandler
    }
    
    public var body: some View {
        Representable(handler: drawingHandler)
    }
}

// MARK: - Representable
extension CustomDrawingView {
    struct Representable: NSViewRepresentable {

        var handler: DrawingHandler
        
        func makeNSView(context: Context) -> NSCustomDrawingView {
            return context.coordinator.view
        }
        
        func updateNSView(_ view: NSCustomDrawingView, context: Context) {
            context.coordinator.update(handler: handler)
        }
        
        func makeCoordinator() -> Coordinator {
            Coordinator(handler: handler)
        }
        
    }

    class Coordinator {
        let view = NSCustomDrawingView()
        
        init(handler: @escaping DrawingHandler) {
            view.drawingHandler = handler
        }
        
        func update(handler: @escaping DrawingHandler) {
            view.drawingHandler = handler
            view.needsDisplay = true
        }
        
    }
}


class NSCustomDrawingView: NSView {
    
    var drawingHandler: CustomDrawingView.DrawingHandler?
    
    init() {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ dirtyRect: NSRect) {
        drawingHandler?(dirtyRect)
    }
    
}
