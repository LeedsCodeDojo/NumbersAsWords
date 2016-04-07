package numbers

import java.util.*

/**
 * Created by David & Andy on 06/04/2016.
 */
val units: List<Pair<Int, String>> = listOf(Pair(1000000, "million"),
                                            Pair(1000, "thousand"),
                                            Pair(100, "hundred"),
                                            Pair(1, ""))

val namedValues: List<Pair<Int, String>> = listOf(
        Pair(90, "ninety"), Pair(80, "eighty"), Pair(70, "seventy"), Pair(60, "sixty"),
        Pair(50, "fifty"), Pair(40, "forty"), Pair(30, "thirty"), Pair(20, "twenty"),
        Pair(19, "nineteen"), Pair(18, "eighteen"), Pair(17, "seventeen"),
        Pair(16, "sixteen"), Pair(15, "fifteen"), Pair(14, "fourteen"),
        Pair(13, "thirteen"), Pair(12, "twelve"), Pair(11, "eleven"),
        Pair(10, "ten"), Pair(9, "nine"), Pair(8, "eight"), Pair(7, "seven"),
        Pair(6, "six"), Pair(5, "five"), Pair(4, "four"),
        Pair(3, "three"), Pair(2, "two"), Pair(1, "one"))


fun toWords(value: Int): String {
    val results = units.fold(Pair(value,ArrayList<String>())){
        x :Pair<Int,List<String>>, y:Pair<Int,String> -> processUnitSection(x, y)
    }
    return results.second.joinToString(separator = " ").trim()
}

private fun processUnitSection(runningTotal: Pair<Int, List<String>>, unit: Pair<Int, String>): Pair<Int, List<String>> {
    if (runningTotal.first >= unit.first ) {
        var newList: MutableList<String> = ArrayList(runningTotal.second.toArrayList())
        newList.add(sectionToWords(runningTotal.first.div(unit.first)) + " " + unit.second)
        return Pair(runningTotal.first.mod(unit.first), newList)
    }
    return runningTotal
}

/**
 * Convert a Number to the equivalent word.
 *
 * @param value The number to be converted
 * @return The English equivalent of the value.
 */
private fun sectionToWords(value: Int): String {
    val results = namedValues.fold(Pair(value,ArrayList<String>())){
        x :Pair<Int,List<String>>, y:Pair<Int,String> -> processNamedItem(x, y)
    }
    return results.second.joinToString(separator = " ")
}



/**
 * Function used in the fold through the basic named values.
 *
 * If the value of the item being processed is less than the remaing running total then the
 * item's value is subtracted from the remaining total & name of the value is appended to the list.
 *
 * @param runningTotal A Pair which holds the remaining value and a list of the preceeding named items
 * @param item  An instance of Pair which is the named item being processed
 */
private fun processNamedItem(runningTotal: Pair<Int, List<String>>, item: Pair<Int, String>): Pair<Int, List<String>> {
    if (runningTotal.first >= item.first ) {
        var newList: MutableList<String> = ArrayList(runningTotal.second.toArrayList())
        newList.add(item.second)
        return Pair(runningTotal.first - item.first, newList)
    }
    return runningTotal
}