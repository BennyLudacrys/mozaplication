package Model;

    
public enum ClasseDeTokens {
    IDENTIFIER("Indentificador"),
    KEYWORD("Palavra reservada"),
    SPECIAL_SYMBOL("Simbolo especial"),
    DATA_TYPE("Tipo de dado"),
    ARITHMETIC_OPERATOR("Operador artimetrico"),
    RELATIONAL_OPERATOR("Operador relacional"),
    LITERAL("Literal"),
    COMMENTS("Comentario"),
    LETTER("Letra"),
    DIGIT("Digito"),
    UNDEFINED("Nao definido");

    private final String TYPE;

    ClasseDeTokens(String TYPE) {
        this.TYPE = TYPE;
    }

    public String getTYPE() {
        return TYPE;
    }
}
