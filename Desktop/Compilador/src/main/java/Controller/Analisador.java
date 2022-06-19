package Controller;

import Model.ClasseDeTokens;
import Model.TiposDeTokens;
import java.io.BufferedReader;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;


public class Analisador {

    private PegarLexema lexeme = new PegarLexema();
    private List<String> lines = new ArrayList<>();

    /**
     * Este metodo faz scan de um ficheiro txt com codigo escrito em pascal
     * e quebra os simbolos especiais e armazena num array list
     * @param path
     */
    public void scanPascalFile(Path path) {
        try(BufferedReader readFile = Files.newBufferedReader(path)){

            String line;
            while((line = readFile.readLine()) != null){
                for (String s: line.split("[\\s]")) {
                    if (!s.isEmpty()) {
                        final String symbol = String.valueOf(s.charAt(s.length() - 1));

                        if (TiposDeTokens.list(ClasseDeTokens.SPECIAL_SYMBOL).contains(symbol) ||
                            TiposDeTokens.list(ClasseDeTokens.ARITHMETIC_OPERATOR).contains(symbol) ||
                                TiposDeTokens.list(ClasseDeTokens.RELATIONAL_OPERATOR).contains(symbol)) {

                            final String[] ss = s.trim().split("[" + symbol + "]");

                            if (ss.length > 0)
                                lines.add(ss[0].trim());
                            lines.add(symbol.trim());
                        } else {
                            
                            lines.add(s.trim());
                        }
                    }
                }
            }
        }catch(IOException e){
            Logger.getLogger("FileNotFound").log(Level.INFO, "Erro na leitura do ficheiro!\n===>  {0}", e.getMessage());
        }
    }
    
    public List<String> scan(String[] lines) {
        for (String s: lines) {
            for (String str: s.split("[\\s]")) {
                if (!str.isEmpty()) {
                    final String symbol = String.valueOf(str.charAt(str.length() - 1));

                    if (TiposDeTokens.list(ClasseDeTokens.SPECIAL_SYMBOL).contains(symbol) ||
                        TiposDeTokens.list(ClasseDeTokens.ARITHMETIC_OPERATOR).contains(symbol) ||
                            TiposDeTokens.list(ClasseDeTokens.RELATIONAL_OPERATOR).contains(symbol)) {

                        final String[] ss = str.trim().split("[" + symbol + "]");

                        if (ss.length > 0)
                            this.lines.add(ss[0].trim());
                        this.lines.add(symbol.trim());
                    } else {
                        this.lines.add(str.trim());
                    }
                }
            }
        }
        return this.lines;
    }

    public ClasseDeTokens getTokenType(String line) {
        if (TiposDeTokens.list(ClasseDeTokens.KEYWORD).contains(line.toUpperCase()))
            return ClasseDeTokens.KEYWORD;
        else if ((TiposDeTokens.list(ClasseDeTokens.IDENTIFIER).contains(line) ||
                lexeme.matches(lexeme.getRegex(Gramatica.IDENTIFIER), line)) &&
                !TiposDeTokens.list(ClasseDeTokens.DATA_TYPE).contains(line.toUpperCase()))
            return ClasseDeTokens.IDENTIFIER;
        else if (TiposDeTokens.list(ClasseDeTokens.SPECIAL_SYMBOL).contains(line))
            return ClasseDeTokens.SPECIAL_SYMBOL;
        else if (TiposDeTokens.list(ClasseDeTokens.DATA_TYPE).contains(line.toUpperCase()))
            return ClasseDeTokens.DATA_TYPE;
        else if (TiposDeTokens.list(ClasseDeTokens.ARITHMETIC_OPERATOR).contains(line))
            return ClasseDeTokens.ARITHMETIC_OPERATOR;
        else if (TiposDeTokens.list(ClasseDeTokens.RELATIONAL_OPERATOR).contains(line))
            return ClasseDeTokens.RELATIONAL_OPERATOR;
        else if ((line.startsWith("\"") && line.endsWith("\"")) ||
                (line.startsWith("'") && line.endsWith("'")))
            return ClasseDeTokens.LITERAL;
        else if (lexeme.matches(lexeme.getRegex(Gramatica.LETTER), line))
            return ClasseDeTokens.LETTER;
        else if (lexeme.matches(lexeme.getRegex(Gramatica.DIGIT), line))
            return ClasseDeTokens.DIGIT;
        else if ((line.startsWith("//") && line.endsWith("//")) ||
                (line.startsWith("/*") && line.endsWith("*/")))
            return ClasseDeTokens.COMMENTS;
        
        return ClasseDeTokens.UNDEFINED;
    }
}
