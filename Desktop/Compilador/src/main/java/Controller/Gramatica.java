package Controller;

public enum Gramatica {

    CONSTANT("CONSTANT", "[0-9]+|[a-zA-Z]|^[a-zA-Z]+.[0-9]*"),
    CONSTANT_IDENTIFIER("CONSTANT IDENTIFIER", "^[a-zA-Z]+.[0-9]*"),
    IDENTIFIER("IDENTIFIER", "^[a-z]+.[a-zA-Z]+.[0-9]*"),
    LETTER("LETTER", "[a-zA-Z]"),
    DIGIT("DIGITO", "[0-9]+");

    //{a...z, A...Z} = [a-zA-Z]
    /*<constant> ::= <integer constant> | <character constant> | <constant identifier>
    <constant identifier> ::= <identifier>
    <identifier> ::= <letter> { <letter or digit> }
    <letter or digit> ::= <letter> | <digit>
    <integer constant> ::= <digit> { <digit> }
    <character constant> ::= '< letter or digit >' | ''< letter or digit > {< letter or digit >}''*/

    private final String desc;
    private final String regex;

    Gramatica(String desc, String regex) {
        this.desc = desc;
        this.regex = regex;
    }

    public String getdesc() {
        return desc;
    }

    public String getRegex() {
        return regex;
    }
}
