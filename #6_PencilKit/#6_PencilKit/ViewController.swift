//
//  ViewController.swift
//  #6_PencilKit
//
//  Created by Steew on 01.08.2021.
//

import UIKit
import PencilKit

class ViewController: UIViewController, PKCanvasViewDelegate {
    private var canvasView: PKCanvasView!
    private var toolPicker: PKToolPicker!
    private var canvasDrawing = PKDrawing()
    
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var undoButton: UIButton!
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var redoButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPencilKitCanvas()
        canvasView.delegate = self
    }
    
    private func setupPencilKitCanvas() {
        canvasView = PKCanvasView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        canvasView.backgroundColor = UIColor.gray
        canvasView.drawingPolicy = .anyInput
        canvasView.drawing = PKDrawing()
        view.addSubview(canvasView)
        
        if #available(iOS 14.0, *) {
            toolPicker = PKToolPicker()
        } else {
            let window = parent?.view.window
            toolPicker = PKToolPicker.shared(for: window!)
        }
        
        toolPicker.setVisible(true, forFirstResponder: canvasView)
        toolPicker.addObserver(canvasView)
        
        canvasView.becomeFirstResponder()
        canvasView.addSubview(saveButton)
        canvasView.addSubview(undoButton)
        canvasView.addSubview(clearButton)
        canvasView.addSubview(redoButton)
    }
    
    private func saveImage() {
        UIImageWriteToSavedPhotosAlbum(canvasView.drawing.image(from: canvasView.frame, scale: 1), nil, nil, nil)
    }
    
    private func undoStroke() {
        canvasDrawing = canvasView.drawing
        canvasView.drawing.strokes.removeLast()
    }
    
    private func clearCanvas() {
        canvasDrawing = canvasView.drawing
        canvasView.drawing = PKDrawing()
    }
    
    private func redoStroke() {
        canvasView.drawing = canvasDrawing
    }
    
    @IBAction func onTapSaveButton(_ sender: Any) {
        saveImage()
    }
    @IBAction func onTapUndoButton(_ sender: Any) {
        undoStroke()
    }
    @IBAction func onTapClearButton(_ sender: Any) {
        clearCanvas()
    }
    @IBAction func onTapRedoButton(_ sender: Any) {
        redoStroke()
    }
}

