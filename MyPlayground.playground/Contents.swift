import UIKit




//var value = arc4random(2)
//if value == 0 {myBool = false}if value == 1 {myBool = true}

var before = [[Bool]](count: 4, repeatedValue: [Bool](count: 4, repeatedValue: false))

var rand: Int
var myBool = false
var living: Int = 0

let rows = 4
let columns = 4

for col in 0..<columns{
    for row in 0..<rows{
        rand = Int(arc4random_uniform(3) == 1)
        if rand == 1 {
            myBool = true
            living += 1
        }
        else if rand == 0 {
            myBool = false
        }
        before[col][row] = myBool
    }
    
    print(before)
    
   // for col in 0..<columns{
    //    for row in 0..<rows{
    //        if before[col][row] == true {
    //            living += 1
     //       }
    //    }
    }
//}


print(living)











