package Model;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

public enum TiposDeTokens {
    // IDENTIFIER
    IDENTIFIER(ClasseDeTokens.IDENTIFIER, "none"),

    // RESERVED WORDS
    PROGRAM(ClasseDeTokens.KEYWORD, "PROGRAM"),
    BEGIN(ClasseDeTokens.KEYWORD, "BEGIN"),
    END(ClasseDeTokens.KEYWORD, "END"),
    IF(ClasseDeTokens.KEYWORD, "IF"),
    THEN(ClasseDeTokens.KEYWORD, "THEN"),
    ELSE(ClasseDeTokens.KEYWORD, "ELSE"),
    PROCEDURE(ClasseDeTokens.KEYWORD, "PROCEDURE"),
    FUNCTION(ClasseDeTokens.KEYWORD, "FUNCTION"),
    VAR(ClasseDeTokens.KEYWORD, "VAR"),
    TYPE(ClasseDeTokens.KEYWORD, "TYPE"),
    OF(ClasseDeTokens.KEYWORD, "OF"),
    WRITE(ClasseDeTokens.KEYWORD, "WRITE"),
    WRITELN(ClasseDeTokens.KEYWORD, "WRITELN"),
    READ(ClasseDeTokens.KEYWORD, "READ"),
    NOT(ClasseDeTokens.KEYWORD, "NOT"),
    WHILE(ClasseDeTokens.KEYWORD, "WHILE"),
    DO(ClasseDeTokens.KEYWORD, "DO"),
    FOR(ClasseDeTokens.KEYWORD, "FOR"),

    // RELATIONAL OPERATOR
    AND(ClasseDeTokens.RELATIONAL_OPERATOR, "AND"),
    OR(ClasseDeTokens.RELATIONAL_OPERATOR, "OR"),
    EQUAL(ClasseDeTokens.RELATIONAL_OPERATOR, "="),
    DIFFERENT(ClasseDeTokens.RELATIONAL_OPERATOR, "<>"),
    GREATER_THAN(ClasseDeTokens.RELATIONAL_OPERATOR, ">"),
    LESS_THAN(ClasseDeTokens.RELATIONAL_OPERATOR, "<"),
    GREATER_THAN_OR_EQUAL_TO(ClasseDeTokens.RELATIONAL_OPERATOR, ">="),
    LESS_THAN_OR_EQUAL_TO(ClasseDeTokens.RELATIONAL_OPERATOR, "<="),

    //ARITHMETIC OPERATOR
    ATTRIBUTION(ClasseDeTokens.ARITHMETIC_OPERATOR, ":="),
    PLUS(ClasseDeTokens.ARITHMETIC_OPERATOR, "+"),
    MINUS(ClasseDeTokens.ARITHMETIC_OPERATOR, "-"),
    MULTIPLICATION(ClasseDeTokens.ARITHMETIC_OPERATOR, "*"),
    DIVISION(ClasseDeTokens.ARITHMETIC_OPERATOR, "/"),
    INT_DIVISION(ClasseDeTokens.ARITHMETIC_OPERATOR, "DIV"),

    // DATA TYPE
    ARRAY(ClasseDeTokens.DATA_TYPE, "ARRAY"), // vector, arraylist
    INTEGER(ClasseDeTokens.DATA_TYPE, "INTEGER"),
    REAL(ClasseDeTokens.DATA_TYPE, "REAL"),
    STRING(ClasseDeTokens.DATA_TYPE, "STRING"),
    CHAR(ClasseDeTokens.DATA_TYPE, "CHAR"),
    BOOLEAN(ClasseDeTokens.DATA_TYPE, "BOOLEAN"),

    // SPECIAL SYMBOL
    COMMA(ClasseDeTokens.SPECIAL_SYMBOL, ","),
    SEMICOLON(ClasseDeTokens.SPECIAL_SYMBOL, ";"),
    LEFT_PAREN(ClasseDeTokens.SPECIAL_SYMBOL, "("),
    RIGHT_PAREN(ClasseDeTokens.SPECIAL_SYMBOL, ")"),
    LEFT_BRACKET(ClasseDeTokens.SPECIAL_SYMBOL, "["),
    RIGHT_BRACKET(ClasseDeTokens.SPECIAL_SYMBOL, "]"),
    COLON(ClasseDeTokens.SPECIAL_SYMBOL, ":"),
    DOT(ClasseDeTokens.SPECIAL_SYMBOL, "."),
    SINGLE_QUOTE(ClasseDeTokens.SPECIAL_SYMBOL, "'"),
    DOUBLE_DOT(ClasseDeTokens.SPECIAL_SYMBOL, "..");

    private final ClasseDeTokens type;
    private final String value;

    TiposDeTokens(ClasseDeTokens type, String value) {
        this.type = type;
        this.value = value;
    }

    public ClasseDeTokens getType() {
        return type;
    }

    public String getValue() {
        return value;
    }

    public static List<String> list(ClasseDeTokens type) {
        return Arrays.stream(TiposDeTokens.values())
                .filter(tokenType -> tokenType.type == type)
                .map(TiposDeTokens::getValue)
                .collect(Collectors.toList());
    }
}
