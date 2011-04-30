import java.util.ArrayList;
import java.util.List;

public class FizzBuzz {

    private List<Rule> rules = new ArrayList<Rule>();

    public void addRule(int divisor, String replacement) {
        addRule(new Rule(divisor, replacement));
    }

    public void addRule(Rule rule) {
        rules.add(rule);
    }

    public String answer(int number) {
        StringBuilder answer = new StringBuilder();

        for (Rule rule : rules) {
            if (rule.hasMatch(number)) {
                answer.append(rule.getReplacement());
            }
        }

        return answer.length() > 0 ? answer.toString() : String.valueOf(number);
    }


    private static class Rule {

        private final int divisor;
        private final String replacement;

        private Rule(int divisor, String replacement) {
            this.divisor = divisor;
            this.replacement = replacement;
        }

        private int getDivisor() {
            return divisor;
        }

        private boolean isDivisibleBy(int number, int divisor) {
            return number % divisor == 0;
        }

        private String getReplacement() {
            return replacement;
        }

        private boolean hasMatch(int number) {
            return isDivisibleBy(number, getDivisor());
        }
    }
}
