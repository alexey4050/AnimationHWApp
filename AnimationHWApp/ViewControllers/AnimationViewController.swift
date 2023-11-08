//
//  ViewController.swift
//  AnimationHWApp
//
//  Created by testing on 07.11.2023.
//

import SpringAnimation
import UIKit

final class AnimationViewController: UIViewController {
    
    var animations: [Animation] = []
    private var currentAnimationIndex = 0
    
    @IBOutlet weak var animationView: SpringView!
    @IBOutlet weak var textAnimationLabel: SpringLabel!
    @IBOutlet weak var animationButton: SpringButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //animationButton.addTarget(self, action: #selector(startAnimation), for: .touchUpInside)
        animations = getRandomAnimations()
        setupInitialAnimation()
    }
    
    @IBAction func startAnimation() {
        playNextAnimation()
        updateButtonTitle()
    }
    
    private func setupInitialAnimation() {
        if animations.count > 0 {
            let initialAnimation = animations[currentAnimationIndex]
            animationView.animation = initialAnimation.preset.rawValue
            animationView.curve = initialAnimation.curve.rawValue
            animationView.force = CGFloat(initialAnimation.force)
            animationView.duration = CGFloat(initialAnimation.duration)
            animationView.delay = CGFloat(initialAnimation.delay)
            
            animationView.animate()
            
            textAnimationLabel.text = "Preset: \(initialAnimation.preset.rawValue)\n Curve: \(initialAnimation.curve.rawValue)\n Force: \(initialAnimation.force)\n Duration: \(initialAnimation.duration)\n Delay: \(initialAnimation.delay) "
        }
    }
    
    private func playNextAnimation() {
        currentAnimationIndex += 1
        if currentAnimationIndex >= animations.count {
            currentAnimationIndex = 0
        }
        
        let nextAnimation = animations[currentAnimationIndex]
        
        animationView.animation = nextAnimation.preset.rawValue
        animationView.curve = nextAnimation.curve.rawValue
        animationView.force = CGFloat(nextAnimation.force)
        animationView.duration = CGFloat(nextAnimation.duration)
        animationView.delay = CGFloat(nextAnimation.delay)
        
        animationView.animate()
        
        textAnimationLabel.text = "Preset: \(nextAnimation.preset.rawValue)\n Curve: \(nextAnimation.curve.rawValue)\n Force: \(nextAnimation.force)\n Duration: \(nextAnimation.duration)\n Delay: \(nextAnimation.delay) "
    }
    
    private func updateButtonTitle() {
        if currentAnimationIndex + 1 >= animations.count {
            animationButton.setTitle(animations[0].preset.rawValue, for: .normal)
        } else {
            animationButton.setTitle(animations[currentAnimationIndex + 1].preset.rawValue, for: .normal)
        }
    }
}
