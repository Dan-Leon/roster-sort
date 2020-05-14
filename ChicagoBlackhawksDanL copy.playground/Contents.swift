import UIKit

var totalage = 0
var aveage = 0
var commonBirthMonth = 0
var totalHeight = 0
var aveHieght = 0

// The dictionary below is used as a key to all the players information. The players number is the Key and its value is the index of which the players information is kept in all of the arrays. This allows the use of controlled information and uniformity in all arrays.
let roster = ["15":0, "91":1, "12":2, "40":3, "24":4, "64":5, "88":6, "16":7, "14":8, "11":9, "20":10, "95":11, "17":12, "19":13, "63":14, "42":15, "56":16, "2":17, "68":18, "5":19, "7":20, "50":21, "30":22]

// The following arrays are of the players information at their corresponding index within the arrays.
let playername = ["Artem Anisimov\t", "Drake Caggiula\t", "Alex DeBrincat\t", "John Hayden\t\t", "Dominik Kahun\t", "David Kampf\t\t", "Patrick Kane\t", "Marcus Kruger\t", "Chris Kunitz\t", "Brendan Perlini\t", "Brandon Saad\t", "Dylan Sikura\t", "Dylan Strome\t", "Jonothan Toews (C)", "Carl Dahlstrom\t", "Gustav Forsling\t", "Erik Gustafsson\t", "Duncan Keith (A)", "Slater Koekkoek\t", "Connor Murphy\t", "Brent Seabrook (A)", "Corey Crawford\t", "Cam Ward\t\t"]

let playernumber = ["15", "91", "12", "40", "24", "64", "88", "16", "14", "11", "20", "95", "17", "19", "63", "42", "56", "2", "68", "5", "7", "50", "30"]

// The height was converted to inches for ease of calculations.
let playerheight = [76, 70, 67, 75, 71, 74, 70, 72, 72, 75, 73, 71, 75, 74, 76, 72, 72, 73, 74, 76, 75, 74, 73]

let playerbirthday = ["1988-05-24", "1994-06-20", "1997-12-18", "1995-02-14", "1995-07-02", "1995-01-12", "1988-11-19", "1990-05-27", "1979-09-26", "1996-04-27", "1992-10-27", "1995-06-01", "1997-03-07", "1988-04-29", "1995-01-28", "1996-06-12", "1992-05-14", "1983-07-16", "1994-02-18", "1993-03-26", "1985-04-20", "1984-12-31", "1984-02-29"]

let playerHomeTown = ["Yaroslavl, RUS", "Pickering, ON, CAN", "Farmington Hills, MI, USA", "Chicago, IL, USA", "Plana, CZE", "Chomutov, CZE", "Buffalo, NY, USA", "Stockholm, SWE", "Regina, SK, CAN", "Guildford, GBR", "Pittsburg, PA, USA", "Aurora, ON, CAN", "Mississauga, ON, CAN", "Winnipeg, MB, CAN", "Stockholm, SWE", "Linkoping, SWE", "Nynashamn, SWE", "Winnipeg, MB, CAN", "Winchester, ON, CAN", "Dublin, OH, USA", "Richmond, BC, CAN", "Montreal, QC, CAN", "Saskatoon, SK, CAN"]

var playersAges = [Int]()  // creates an empty array to hold player ages.
var mostCommonBirthdayMonth = [String]()  //This creates an empty array that will be used to store birth months.
var monthCounts = [String: Int]()  //Creates a dictionary that will be used to map values to count of birthmonths.

func getHeight(height:Int)->String {
    let feet = (height / 12)
    let inches = (height % 12)
    let retheight = "\(feet)'\(inches)\""
    return retheight
}

// the following function generates a random player number to use as a similation of user choice. This random number can then be used to pull the players information once it is used with the dictionary to get the index number (key-value).
func getPlayerNum () -> String {
    let playnum = ["15", "91", "12", "40", "24", "64", "88", "16", "14", "11", "20", "95", "17", "19", "63", "42", "56", " 2", "68", " 5", " 7", "50", "30"]
    let chosenNum = Int.random(in: 0...22)
    let choice = playnum [chosenNum]
    return choice
}
// extends the date function to be able to get an age from the date by comparing todays date and the birthdate.
extension Date {
    var age: Int{
        return Calendar.current.dateComponents([.year], from: self, to: Date()).year!
    }
}
// steps through the array of birthdays to get the age of the player and creates a total on total age var, then devides it by the length of the array, to give an average.
for bday in playerbirthday {
    var ageComponents = bday.components(separatedBy: "-")  // separates date 1995-10-23 to ["1995", "10", "23"]
    let dateDOB = Calendar.current.date(from:DateComponents(year:Int(ageComponents[0]), month: Int(ageComponents[1]), day: Int(ageComponents[2])))!
    let playerage = dateDOB.age
    totalage += playerage
    playersAges.append(playerage)
    
    let birthMonth = ageComponents[1]
    switch birthMonth {
    case "01":
        mostCommonBirthdayMonth.append("January")
    case "02":
        mostCommonBirthdayMonth.append("February")
    case "03":
        mostCommonBirthdayMonth.append("March")
    case "04":
        mostCommonBirthdayMonth.append("April")
    case "05":
        mostCommonBirthdayMonth.append("May")
    case "06":
        mostCommonBirthdayMonth.append("June")
    case "07":
        mostCommonBirthdayMonth.append("July")
    case "08":
        mostCommonBirthdayMonth.append("August")
    case "09":
        mostCommonBirthdayMonth.append("September")
    case "10":
        mostCommonBirthdayMonth.append("October")
    case "11":
        mostCommonBirthdayMonth.append("November")
    case "12":
        mostCommonBirthdayMonth.append("December")
    default:
        print("There was an error in the programming.")
    }
    
}
// this is part was a nightmare to figure out..
// this next bit of code takes all of the above arrays that hold player information in a parallel set of arrays and turns them into an array of arrays that holds each
// players information into its own array. The next step following that will allow us to sort the multidimentional array from a specified index.
var players = [[String]]()
var rotation = 0
let playercount = (playernumber.count)
//var pnum = ""
//var pname = ""
//var pheight = 0
//var pstandheight = ""
//var page = 0
//var pbday = ""
//var ptown = ""

while rotation < playercount {
    let pnum = playernumber[rotation]
    let pname = playername[rotation]
    let pheight = playerheight[rotation]
    let pstandheight = getHeight(height: pheight)
    let page = String(playersAges[rotation])
    let pbday = playerbirthday[rotation]
    let ptown = playerHomeTown[rotation]
    let player = [pname, pnum, page, pbday, pstandheight, ptown]
    players.append(player)
    
    rotation += 1
    
}
print(players)
print("-  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -\n")
let sortedAgePlayers = players.sorted {($0[2]) < ($1[2])}  // creates a new array of arrays that sorted by lowest age to oldest

let sortedCountryPlayers = players.sorted {($0[5]) < ($1[5])}  // creates a new array of arrays that is sorted by country in Alphebetical order acending

// Now we take the arrays and step through them in loops to break out the data into variables in order to format the output. Otherwise the output would be unformatted.
print("1.")
print("The following is the 2018 Blackhawks roster sorted by age from youngest to oldest.")
print("Name\t\t\t\t\tNumber\t\t\tAge\t\t\tDate of Birth\t\tHeight\t\t\tCountry of Origin")
print("^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^")
for agesort in sortedAgePlayers{
    let name1 = agesort[0]
    let num1 = agesort[1]
    let age1 = agesort[2]
    let dob1 = agesort[3]
    let height1 = agesort[4]
    let country1 = agesort[5]
    print("\(name1)\t\t\t\(num1)\t\t\t\(age1)\t\t\t\(dob1)\t\t\t\(height1)\t\t\t\(country1)")
    
}
print("^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n")
print("2.")
print("The following is the 2018 Blackhawks roster, sorted by country of origin in alphabetical order.")
print("Name\t\t\t\t\tNumber\t\t\tAge\t\t\tDate of Birth\t\tHeight\t\t\tCountry of Origin")
print("^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^")
for countrysort in sortedCountryPlayers{
    let name2 = countrysort[0]
    let num2 = countrysort[1]
    let age2 = countrysort[2]
    let dob2 = countrysort[3]
    let height2 = countrysort[4]
    let country2 = countrysort[5]
    print("\(name2)\t\t\t\(num2)\t\t\t\(age2)\t\t\t\(dob2)\t\t\t\(height2)\t\t\t\(country2)")
    
}
print("^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n")

// this is for the average age
print("3.")
aveage = (totalage / playerbirthday.count)
print("The average age of the Chicago Blackhawk's 2018 roster is:", aveage, "\n")

// this is for the average height
print("4.")
for height in playerheight{
    totalHeight += height
}
aveHieght = (totalHeight / playerheight.count)
var feet = (aveHieght / 12)   //gets the feet no remainder
var inches = (aveHieght%12)  //gets the remainder for the inches left
print("The average height of the players is " + String(aveHieght) + " inches, or " + getHeight(height: aveHieght),"\n")

// this is for the most common birth month(s)
print("5.")
mostCommonBirthdayMonth.forEach {monthCounts[$0] = (monthCounts[$0] ?? 0) + 1}
var high = monthCounts.values.max()
print("The most common birth month(s) is/are: ")
for  (value, count) in monthCounts {
    if (count) == high {
        print("\(value)")
    }
//    print("\(value) --\(count)" )
}
