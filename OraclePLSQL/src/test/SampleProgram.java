package test;

import com.modak.tools.parsers.plsql.PlSqlLexer;
import com.modak.tools.parsers.plsql.PlSqlParser;
import com.modak.tools.parsers.plsql.PlSqlParserSparkVisitor;
import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.Lexer;

import java.nio.file.Paths;
import java.util.Arrays;
import java.util.List;

public class SampleProgram {

    public static void main(String[] args) throws Exception {

        CharStream s = CharStreams.fromPath(Paths.get("C:\\Workarea\\OraclePLSQL\\src\\resources\\examples\\test.sql"));
        CaseChangingCharStream upper = new CaseChangingCharStream(s, true);
        Lexer lexer = new PlSqlLexer(upper);
        CommonTokenStream tokenStream = new CommonTokenStream(lexer);
        PlSqlParser parser = new PlSqlParser(tokenStream);
        // set error handler
        parser.removeErrorListeners();
        parser.addErrorListener(new ThrowingErrorListener());
        try {
            PlSqlParser.Sql_scriptContext tree = parser.sql_script();
            PlSqlParserSparkVisitor parserSparkVisitor = new PlSqlParserSparkVisitor(tokenStream);
            String traverseResult = parserSparkVisitor.visitSql_script(tree);
            System.out.println(traverseResult);

            List<String> ruleNamesList = Arrays.asList(parser.getRuleNames());
            String prettyTree = TreeUtils.toPrettyTree(tree, ruleNamesList,tokenStream);
            System.out.println(prettyTree);
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }
}
