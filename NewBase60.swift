//: Converts a Base 10 Integer into Sexagesimal (Base 60) String
public func IntToSxg(num: Int)->String {
    var num = num;
    var sxg = "";
    let sequence: String = "0123456789ABCDEFGHJKLMNPQRSTUVWXYZ_abcdefghijkmnopqrstuvwxyz";
    if (num == 0) {
        return "0";
    }
    while (num > 0) {
        let index: Int = num % 60;
        sxg = String(sequence[sequence.startIndex.advancedBy(index)]) + sxg;
        num = (num - index)/60;
    }
    return sxg;
}

//: Converts a Base 10 Integer to Sexagesimal (Base 60) String of a fixed minimum length
public func IntToSxgF(num: Int, formatLength: Int = 0)->String {
    var sxg: String = IntToSxg(num);
    var zeroesToAdd = formatLength - sxg.characters.count;
    while (zeroesToAdd > 0) {
        sxg = "0" + sxg;
        zeroesToAdd = zeroesToAdd - 1;
    }
    return sxg;
}

//: Converts a Sexageismal (Base 60) String into a Base 10 Integer
public func SxgToInt(sxg: String)->Int {
    var num: Int = 0;

    
    // iterate from first to last char of s
    for var c in sxg.characters {
        
        var i: Int = 0;
        
        if (c>="0" && c<="9") {
            i = "\(c)".unicodeScalars.first - 48;
        }
        else if (c>=65 && c<=72) {
            c-=55;
        }
            
        // typo capital I,
        // lowercase l to 1
        else if (c==73 || c==108) {
            c=1;
        }
        else if (c>=74 && c<=78) {
            c-=56;
        }
            
        // error correct typo capital O to 0
        else if (c==79) { c=0; }
        else if (c>=80 && c<=90) {
            c-=57;
        }
        
        // underscore
        else if (c==95) { c=34; }
        else if (c>=97 && c<=107) {
            c-=62;
        }
        else if (c>=109 && c<=122) {
            c-=63;
        }
        
        // treat all other noise as 0
        else { c = 0; }
        num = (60 * num) + i;
    }
    return num;
}


IntToSxg(40)

SxgToInt("f")
