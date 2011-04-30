import org.junit.Test;

import static junit.framework.Assert.assertEquals;


public class FizzBuzzTest {

    private FizzBuzz buzzer;


    @Test
    public void nonDivisibleNumberReturnsNumber() throws Exception {
        buzzer = createFizzBuzz();

        assertEquals("1", buzzer.answer(1));
        assertEquals("2", buzzer.answer(2));
    }


    @Test
    public void multiplesOfThreeGivesFizz() throws Exception {
        buzzer = createFizzBuzz();

        assertEquals("fizz", buzzer.answer(3));
        assertEquals("fizz", buzzer.answer(6));
    }


    @Test
    public void multiplesOfFiveGivesBuzz() throws Exception {
        buzzer = createFizzBuzz();

        assertEquals("buzz", buzzer.answer(5));
        assertEquals("buzz", buzzer.answer(10));
    }

    @Test
    public void fifteenGivesFizzBuzz() throws Exception {
        buzzer = createFizzBuzz();

        assertEquals("fizzbuzz", buzzer.answer(15));
    }


    @Test
    public void programOneRule() throws Exception {
        FizzBuzz test = createRuleBasedGame();

        assertEquals("hey", test.answer(2));
        assertEquals("foo", test.answer(7));
        assertEquals("heyfoo", test.answer(14));
    }

    private FizzBuzz createRuleBasedGame() {
        FizzBuzz test = new FizzBuzz();
        test.addRule(2, "hey");
        test.addRule(7, "foo");
        return test;
    }

    private FizzBuzz createFizzBuzz() {
        FizzBuzz buzzer = new FizzBuzz();
        buzzer.addRule(3, "fizz");
        buzzer.addRule(5, "buzz");
        return buzzer;
    }
}



