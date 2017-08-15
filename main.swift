//
//  File.swift
//  EDNAriasDA03
//
//  Created by Nathaly Arias on 14/08/17.
//  Copyright © 2017 Nathaly Arias. All rights reserved.
//

import Foundation
class FetchClass {
    
    var vector: [Int] = []
    
    func fetch(n: Int)->Int{
        preconditionFailure("This method must be overridden")
    }
    func setVector(v: [Int]){
        self.vector = v
    }
    func randomVector(n:Int)->[Int]{
        var v:[Int] = [Int]()
        for _ in 0...(n-1) {
            v.append(arc4random() % 100)
        }
        return v
    }
    func getVector()->[Int]{
        return self.vector
    }
    func displayVector(){
        let count:Int = self.vector.count-1
        var string = "("
        for(index) in 0...count{
            string+=String(self.vector[index])
            string+=","
        }
        string = String(string.characters.dropLast()) + ")"
        print(string)
    }
    
    
    func displayFetch(n: Int){
        if(n==(-1)){print("El número no esta presente en el vector")}
        else
        {print("El número se está en la posición \(n)")}
    }
}

class binario: FetchClass{
    override func fetch (n: Int) -> Int {
        var start: Int = 0
        var center: Int = 0
        var last: Int = self.vector.count-1
        
        while(start<=last) {
            center = (start+last)/2
            
            if(self.vector[center]==n ){
                return center
            }
            
            if(n < self.vector[center]){
                last = center-1
            } else {
                start = center+1
            }
        }
        return -1
    }
}

class secuencial: FetchClass{
    override func fetch(n: Int) -> Int {
        let count:Int = self.vector.count-1
        for i in 0...count{
            if(self.vector[i]==n){return i}
        }
        return -1
    }
}


var vector: [Int] = [0,6,12,18,24,30]

var main: secuencial = secuencial()
main.setVector(v: main.randomVector(n: 100))
main.displayVector()
main.displayFetch(n: main.fetch(n: 20))

var main2: binario = binario()
main2.setVector(v: vector)
main2.displayVector()
main2.displayFetch(n: main2.fetch(n: 4))
