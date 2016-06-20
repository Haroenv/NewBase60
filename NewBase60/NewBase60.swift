import Foundation


/**
 Tantek Çelik's NewBase60.

 <http://tantek.com/>

 <http://tantek.pbworks.com/NewBase60>

 Lightly translated from the original CASSIS to CommonsJS- & Node.js-aware JavaScript by Edward O'Connor <hober0@gmail.com>.

 Then translated once more to a more usable Node.js module that implements Date conversion similar to that of Shane Becker's NewBase60 (<https://github.com/veganstraightedge/new_base_60>).
 NewBase60.js by Michael Owens <mk@mowens.com>. Published on NPM as newbase60 (<https://npmjs.org/package/newbase60>).

 Translated to Swift by Haroen Viaene <hello@haroen.me> on GitHub as <https://github.com/Haroenv/NewBase60>

 Released under MIT
 */
public struct NumToBase60 {

    /// Converts a Base 10 Integer into sexagesimal (Base 60) String
    ///
    /// - Parameter num: The integer that has to be converted to base 60
    /// - Returns: A base 60 string with the value of `num`
    public static func IntToSxg(num: Int)->String {
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

    /// Converts a Base 10 Integer to sexagesimal (Base 60) String of a fixed minimum length
    ///
    /// - Parameters:
    ///     - num: the integer that has to be converted to base 60
    ///     - formatLength: the minimum amount of characters returned
    /// - Returns: A zero-padded sexagesimal string with the value of `num`
    public static func IntToSxgF(num: Int, formatLength: Int = 0)->String {
        var sxg: String = IntToSxg(num)
        var zeroesToAdd = formatLength - sxg.characters.count
        while (zeroesToAdd > 0) {
            sxg = "0" + sxg
            zeroesToAdd = zeroesToAdd - 1
        }
        return sxg
    }

    /// Converts a sexagesimal (Base 60) String into a Base 10 Integer
    ///
    /// - Parameter sxg: The string to convert to a base 10 integer
    /// - Returns: A base 10 integer with the value of `sxg`
    public static func SxgToInt(sxg: String)->Int {
        var num: Int = 0

        sxg

        // iterate from first to last char of s
        for var c: UInt8 in sxg.utf8 {

            var i: UInt8 = 0

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

    /// Converts a NSDate to a sexagesimal (Base 60) String
    ///
    /// - Parameter date: The NSDate that has to be converted to base 60
    /// - Returns: A base 60 string with the value of `date` (in days)
    public static func DateToSxg(date: NSDate)->String {
        let sinceEpoch = date.timeIntervalSince1970
        let epochDays = Int(floor(sinceEpoch / (60 * 60 * 24)))

        return IntToSxg(epochDays)
    }

    /// Converts a NSDate to a sexagesimal (Base 60) String of a fixed minimum length
    ///
    /// - Parameter date: The NSDate that has to be converted to base 60
    /// - Parameter formatLength: formatLength: the minimum amount of characters returned
    /// - Returns: A zero-padded base 60 string with the value of `date` (in days) and minimum length `formatLength`
    public static func DateToSxgF(date: NSDate, formatLength: Int = 0)->String {
        let sinceEpoch = date.timeIntervalSince1970

        let epochDays = Int(floor(sinceEpoch / (60 * 60 * 24)))

        return IntToSxgF(epochDays, formatLength: formatLength)
    }

    /// Converts a sexagesimal (Base 60) String into a NSDate
    ///
    /// - Parameter sxg: The string to convert to a NSDate
    /// - Returns: A NSDate with the value of `sxg` (in days)
    public static func SxgToDate(sxg: String)->NSDate {
        let num = SxgToInt(sxg)
        let interval: NSTimeInterval = NSTimeInterval(num * 60 * 60 * 24)

        return NSDate(timeIntervalSince1970: interval)
    }

    /// Converts a sexagesimal (Base 60) String into a ISO-8601 Datetime String
    ///
    /// - Parameter sxg: The string to convert to a ISO-8601 Datetime String
    /// - Returns: A ISO-8601 Datetime String with the value of `sxg`
    public static func SxgToISO(sxg: String)->String {
        let date: NSDate = SxgToDate(sxg)

        let dateFormatter = NSDateFormatter()
        let enUSPosixLocale = NSLocale(localeIdentifier: "en_US_POSIX")
        dateFormatter.locale = enUSPosixLocale
        dateFormatter.timeZone = NSTimeZone(abbreviation: "UTC");
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"

        let iso8601String = dateFormatter.stringFromDate(date)

        return iso8601String
    }

}
