//
//  ViewController.swift
//  ColorizedApp
//
//  Created by Максим Макаров on 28.10.2022.
//

import UIKit

class ViewController: UIViewController {
// MARK: - IBOutlets
    @IBOutlet weak var colorizedView: UIView!
    
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSlider(setColor: .red, forSlider: redSlider, andLabel: redLabel)
        setupSlider(setColor: .green, forSlider: greenSlider, andLabel: greenLabel)
        setupSlider(setColor: .blue, forSlider: blueSlider, andLabel: blueLabel)
        
        setupColorizedView()
        
        
    }
// MARK: - IBActions
    @IBAction func SliderAction() {
        colorizedView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }
    
    @IBAction func redSliderAction() {
        redLabel.text = String(format: "%.2f", redSlider.value)
    }
    @IBAction func greenSliderAction() {
        greenLabel.text = String(format: "%.2f", greenSlider.value)
    }
    
    @IBAction func blueSliderAction() {
        blueLabel.text = String(format: "%.2f", blueSlider.value)
    }
// MARK: - Setup functions
    private func setupSlider(setColor color: UIColor, forSlider slider: UISlider, andLabel label: UILabel){
        slider.minimumTrackTintColor = color
        slider.minimumValue = 0
        slider.maximumValue = 1
        label.text = String(format: "%.2f", slider.value)
    }
    
    
    private func setupColorizedView() {
        colorizedView.layer.cornerRadius = 15
        colorizedView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }
}
