import Foundation

//: Converts a Base 10 Integer into Sexagesimal (Base 60) String
public func IntToSxg(num: Int)->String {
    var num = num
    var sxg = ""
    let sequence: String = "0123456789ABCDEFGHJKLMNPQRSTUVWXYZ_abcdefghijkmnopqrstuvwxyz"
    if (num == 0) {
        return "0"
    }
    while (num > 0) {
        let index: Int = num % 60
        sxg = String(sequence[sequence.startIndex.advancedBy(index)]) + sxg
        num = (num - index)/60
    }
    return sxg
}

//: Converts a Base 10 Integer to Sexagesimal (Base 60) String of a fixed minimum length
public func IntToSxgF(num: Int, formatLength: Int = 0)->String {
    var sxg: String = IntToSxg(num)
    var zeroesToAdd = formatLength - sxg.characters.count
    while (zeroesToAdd > 0) {
        sxg = "0" + sxg
        zeroesToAdd = zeroesToAdd - 1
    }
    return sxg
}

//: Converts a Sexageismal (Base 60) String into a Base 10 Integer
public func SxgToInt(sxg: String)->Int {
    var num: Int = 0

    sxg

    // iterate from first to last char of s
    for var c: UInt8 in sxg.utf8 {

        var i: UInt8 = 0

        c

        if (c>=48 && c<=57) {
            i = c - 48
        }
        else if (c>=65 && c<=72) {
            i = c - 55
        }

        // typo capital I,
        // lowercase l to 1
        else if (c==73 || c==108) {
            i = 1
        }
        else if (c>=74 && c<=78) {
            i = c - 56
        }

        // error correct typo capital O to 0
        else if (c==79) { c=0 }
        else if (c>=80 && c<=90) {
            i = c - 57
        }

        // underscore
        else if (c==95) {
            c=34
        }
        else if (c>=97 && c<=107) {
            i = c - 62
        }
        else if (c>=109 && c<=122) {
            i = c - 63
        }

        num = (60 * num) + Int(i)
    }
    return num
}



func DateToSxg(date: NSDate)->String {
    let sinceEpoch = date.timeIntervalSince1970
    let epochDays = Int(floor(sinceEpoch / (60 * 60 * 24)))

    return IntToSxg(epochDays)
}

func DateToSxgF(date: NSDate, formatLength: Int = 0)->String {
    let sinceEpoch = date.timeIntervalSince1970

    let epochDays = Int(floor(sinceEpoch / (60 * 60 * 24)))

    return IntToSxgF(epochDays, formatLength: formatLength)
}

func SxgToDate(sxg: String)->NSDate {
    let num = SxgToInt(sxg)
    let interval: NSTimeInterval = NSTimeInterval(num * 60 * 60 * 24)

    return NSDate(timeIntervalSince1970: interval)
}

IntToSxg(8645997)

SxgToInt("flex")

DateToSxg(NSDate())

SxgToDate("4hr")
