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
    @IBAction func redSliderAction() {
        redLabel.text = (round(redSlider.value * 100) / 100.0).formatted()

        colorizedView.layer.backgroundColor = CGColor(
            red: CGFloat(redSlider.value),
            green: (colorizedView.layer.backgroundColor?.components?[1])!,
            blue: (colorizedView.layer.backgroundColor?.components?[2])!,
            alpha: 1
        )
    }
    
    @IBAction func greenSliderAction() {
        greenLabel.text = (round(greenSlider.value * 100) / 100.0).formatted()
        
        colorizedView.layer.backgroundColor = CGColor(
            red: (colorizedView.layer.backgroundColor?.components?[0])!,
            green: CGFloat(greenSlider.value),
            blue: (colorizedView.layer.backgroundColor?.components?[2])!,
            alpha: 1
        )
    }
    
    @IBAction func blueSliderAction() {
        blueLabel.text = (round(blueSlider.value * 100) / 100.0).formatted()

        colorizedView.layer.backgroundColor = CGColor(
            red: (colorizedView.layer.backgroundColor?.components?[0])!,
            green: (colorizedView.layer.backgroundColor?.components?[1])!,
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }
// MARK: - Setup functions
    private func setupSlider(setColor color: UIColor, forSlider slider: UISlider, andLabel label: UILabel){
        slider.minimumTrackTintColor = color
        slider.minimumValue = 0
        slider.maximumValue = 1
        label.text = (round(slider.value * 100) / 100.0).formatted()
    }
    
    private func setupColorizedView() {
        colorizedView.layer.cornerRadius = 15
    }
}
