package Controller;

import java.util.regex.Matcher;
import java.util.regex.Pattern;


public class PegarLexema {

    private Gramatica lexicalGrammar;

    public PegarLexema() {
    }

    public Gramatica getLexicalGrammar() {
        return lexicalGrammar;
    }

    public void setLexicalGrammar(Gramatica lexicalGrammar) {
        this.lexicalGrammar = lexicalGrammar;
    }

    public String getRegex(Gramatica lexicalGrammar) {
        return lexicalGrammar.getRegex();
    }

    public boolean matches(String regex, String expression) {
        Matcher matcher = Pattern.compile(regex).matcher(expression);
        return matcher.matches();
    }
}
