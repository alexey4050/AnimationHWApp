//
//  Animation.swift
//  AnimationHWApp
//
//  Created by testing on 08.11.2023.
//

import Foundation
import SpringAnimation

struct Animation {
    
    let preset: AnimationPreset
    let curve: AnimationCurve
    let force: CGFloat
    let duration: CGFloat
    let delay: CGFloat
}

private func getRandomPreset() -> AnimationPreset {
    let presets = AnimationPreset.allCases
    let randomIndex = Int.random(in: 0..<presets.count)
    return presets[randomIndex]
    
}

private func getRandomCurve() -> AnimationCurve {
    let curves = AnimationCurve.allCases
    let randomIndex = Int.random(in: 0..<curves.count)
    return curves[randomIndex]
}

func getRandomAnimations() -> [Animation] {
    let presents = AnimationPreset.allCases
    let curves = AnimationCurve.allCases
    
    var randomAnimations: [Animation] = []
    
    for _ in 0..<presents.count{
        let randomPreset = presents.randomElement()!
        let randomCurve = curves.randomElement()!
        let randomForce = Double.random(in: 0.5...2).rounded(toDigits: 2)
        let randomDuraton = Double.random(in: 0.5...2).rounded(toDigits: 2)
        let randomDelay = Double.random(in: 0.1...0.5).rounded(toDigits: 2)
        
        let animation = Animation(preset: randomPreset, curve: randomCurve, force: randomForce, duration: randomDuraton, delay: randomDelay)
        
        randomAnimations.append(animation)
        
    }
    return randomAnimations
}

extension Double {
    func rounded(toDigits digits: Int) -> Double {
        let multiplier = pow(10.0, Double(digits))
        return (self * multiplier).rounded() / multiplier
    }
}


