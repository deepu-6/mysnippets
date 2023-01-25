package com.modak.tools.parsers.plsql;

import org.antlr.v4.runtime.CommonToken;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.Token;
import org.antlr.v4.runtime.tree.ErrorNode;
import org.antlr.v4.runtime.tree.ParseTree;
import org.antlr.v4.runtime.tree.RuleNode;
import org.antlr.v4.runtime.tree.TerminalNode;

import java.util.ArrayList;
import java.util.List;

public class PlSqlParserSparkVisitor extends PlSqlParserBaseVisitor {

    CommonTokenStream tokenStream = null;

    public PlSqlParserSparkVisitor(CommonTokenStream tokenStream) {
        this.tokenStream = tokenStream;
    }

    @Override
    public String visitSql_script(PlSqlParser.Sql_scriptContext ctx) {
        return visitChildren(ctx);
    }

    @Override
    public String visitGeneral_element_part(PlSqlParser.General_element_partContext ctx) {
        return visitChildren(ctx);
    }

    @Override
    public String visitString_function(PlSqlParser.String_functionContext ctx) {
        if (ctx != null && ctx.getChildCount() > 0) {
            ParseTree child = ctx.getChild(0);
            if (child != null && child instanceof TerminalNode) {
                Token funcNameToken = ((TerminalNode)child).getSymbol();
                if (funcNameToken.getText().equalsIgnoreCase("to_date")) {
                    ((CommonToken)funcNameToken).setText("to_timestamp");
                }
                else if (funcNameToken.getText().equalsIgnoreCase("decode")) {
                    if (ctx.getChildCount() >= 4 && ctx.getChild(2) instanceof  PlSqlParser.ExpressionsContext) {
                        List<ParseTree> expressionList = ((PlSqlParser.ExpressionsContext)ctx.getChild(2)).children;
                        ArrayList<String> expressionsForDecode = new ArrayList<>();
                        for (ParseTree pTree: expressionList) {
                            if (pTree instanceof PlSqlParser.ExpressionContext) {
                                expressionsForDecode.add( (String) this.visitExpression((PlSqlParser.ExpressionContext)pTree));
                            }
                        }
                        if (expressionsForDecode.size() >= 3) {
                            String defaultExpr = null;
                            String firstExpr = expressionsForDecode.get(0);
                            if (expressionsForDecode.size() % 2 == 0) {
                                // last expression is the default
                                defaultExpr = expressionsForDecode.get(expressionsForDecode.size() - 1);
                                expressionsForDecode.remove(expressionsForDecode.size() - 1);
                            }
                            expressionsForDecode.remove(0); // remove first element that is the basic comparision expr
                            int i = 0;
                            StringBuilder stringBuilder = new StringBuilder();
                            stringBuilder.append("case ");
                            while ( i < expressionsForDecode.size()) {
                                String compExpr = expressionsForDecode.get(i);
                                String resultExpr = expressionsForDecode.get(i+1);
                                stringBuilder.append(" when " + firstExpr + " == " + compExpr + " then " + resultExpr);
                                i = i + 2;
                            }
                            if ( defaultExpr != null) {
                                stringBuilder.append(" else " + defaultExpr);
                            }
                            stringBuilder.append(" end ");
                            return stringBuilder.toString();
                        }
                    }
                }
            }
        }
        return visitChildren(ctx);
    }

    public String visitTerminal(TerminalNode node) {
        if (node != null) {
            Token symbol = node.getSymbol();
            if (symbol != null) {
                String s = symbol.getText();
                List<Token> hiddenTokens = tokenStream.getHiddenTokensToRight(symbol.getTokenIndex());
                if (hiddenTokens != null) {
                    for (Token hiddenToken : hiddenTokens) {
                        if (hiddenToken.getText() != null) {
                            s += hiddenToken.getText();
                        }
                    }
                }
                return s;
            }
        }
        return null;
    }

    public String visitErrorNode(ErrorNode node) {
        return (String) this.defaultResult();
    }

    protected String aggregateResult(String aggregate, String nextResult) {
        if (aggregate == null) {
            return nextResult;
        }
        if (nextResult == null) {
            return aggregate;
        }
        return aggregate + nextResult;
    }

    public String visitChildren(RuleNode node) {
        String result = null;
        int n = node.getChildCount();

        for (int i = 0; i < n && this.shouldVisitNextChild(node, result); ++i) {
            ParseTree c = node.getChild(i);
            String childResult = (String) c.accept(this);
            result = this.aggregateResult(result, childResult);
        }

        return result;
    }
}
