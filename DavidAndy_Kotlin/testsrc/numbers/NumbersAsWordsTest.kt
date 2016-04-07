package numbers

import org.junit.Assert.assertEquals
import org.junit.Test

/**
 * Created by David & Andy on 06/04/2016.
 */
class NumbersAsWordsTest {

    private fun checkExpectedValue(i: Int, expected: String) {
        assertEquals(expected,toWords(i))
    }

    @Test fun underTen() {
        checkExpectedValue(1, "one")
        checkExpectedValue(2, "two")
        checkExpectedValue(3, "three")
        checkExpectedValue(4, "four")
        checkExpectedValue(5, "five")
        checkExpectedValue(6, "six")
        checkExpectedValue(7, "seven")
        checkExpectedValue(8, "eight")
        checkExpectedValue(9, "nine")
    }

    @Test fun underTwenty(){
        checkExpectedValue(10,"ten")
        checkExpectedValue(11,"eleven")
        checkExpectedValue(12,"twelve")
        checkExpectedValue(13,"thirteen")
        checkExpectedValue(14,"fourteen")
        checkExpectedValue(15,"fifteen")
        checkExpectedValue(16,"sixteen")
        checkExpectedValue(17,"seventeen")
        checkExpectedValue(18,"eighteen")
        checkExpectedValue(19,"nineteen")
    }

    @Test fun underThirty(){
        checkExpectedValue(20,"twenty")
        checkExpectedValue(21,"twenty one")
        checkExpectedValue(22,"twenty two")
        checkExpectedValue(23,"twenty three")
        checkExpectedValue(24,"twenty four")
        checkExpectedValue(25,"twenty five")
        checkExpectedValue(26,"twenty six")
        checkExpectedValue(27,"twenty seven")
        checkExpectedValue(28,"twenty eight")
        checkExpectedValue(29,"twenty nine")
    }

    @Test fun underForty(){
        checkExpectedValue(30,"thirty")
        checkExpectedValue(31,"thirty one")
        checkExpectedValue(32,"thirty two")
        checkExpectedValue(33,"thirty three")
        checkExpectedValue(34,"thirty four")
        checkExpectedValue(35,"thirty five")
        checkExpectedValue(36,"thirty six")
        checkExpectedValue(37,"thirty seven")
        checkExpectedValue(38,"thirty eight")
        checkExpectedValue(39,"thirty nine")
    }

    @Test fun underFifty(){
        checkExpectedValue(40,"forty")
        checkExpectedValue(41,"forty one")
        checkExpectedValue(44,"forty four")
        checkExpectedValue(45,"forty five")
        checkExpectedValue(46,"forty six")
        checkExpectedValue(49,"forty nine")
    }

    @Test fun underSixty(){
        checkExpectedValue(50,"fifty")
        checkExpectedValue(51,"fifty one")
        checkExpectedValue(53,"fifty three")
        checkExpectedValue(55,"fifty five")
        checkExpectedValue(57,"fifty seven")
        checkExpectedValue(59,"fifty nine")
    }

    @Test fun underSeventy(){
        checkExpectedValue(60,"sixty")
        checkExpectedValue(61,"sixty one")
        checkExpectedValue(64,"sixty four")
        checkExpectedValue(65,"sixty five")
        checkExpectedValue(66,"sixty six")
        checkExpectedValue(69,"sixty nine")
    }

    @Test fun oneHundred(){
        checkExpectedValue(100,"one hundred")
        checkExpectedValue(101,"one hundred one")
        checkExpectedValue(107,"one hundred seven")
        checkExpectedValue(120,"one hundred twenty")
        checkExpectedValue(165,"one hundred sixty five")
        checkExpectedValue(182,"one hundred eighty two")
        checkExpectedValue(145,"one hundred forty five")
        checkExpectedValue(199,"one hundred ninety nine")
    }

    @Test fun twoHundred(){
        checkExpectedValue(200,"two hundred")
    }

    @Test fun threeHundred(){
        checkExpectedValue(300,"three hundred")
    }

    @Test fun nineHundred(){
        checkExpectedValue(900,"nine hundred")
    }

}
