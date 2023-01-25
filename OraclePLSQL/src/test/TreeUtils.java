package test;

import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.RuleContext;
import org.antlr.v4.runtime.Token;
import org.antlr.v4.runtime.misc.Utils;
import org.antlr.v4.runtime.tree.ErrorNode;
import org.antlr.v4.runtime.tree.TerminalNode;
import org.antlr.v4.runtime.tree.Tree;

import java.util.List;

public class TreeUtils {

    /**
     * Platform dependent end-of-line marker
     */
    public static final String Eol = System.lineSeparator();
    /**
     * The literal indent char(s) used for pretty-printing
     */
    public static final String Indents = "  ";
    private static int level;

    private TreeUtils() {
    }

    /**
     * Pretty print out a whole tree. {getNodeText} is used on the node payloads to get the text
     * for the nodes. (Derived from Trees.toStringTree(....))
     */
    public static String toPrettyTree(final Tree t, final List<String> ruleNames, CommonTokenStream tokenStream) {
        level = 0;
        return process(t, ruleNames, tokenStream).replaceAll("(?m)^\\s+$", "").replaceAll("\\r?\\n\\r?\\n", Eol);
    }

    private static String process(final Tree t, final List<String> ruleNames, CommonTokenStream tokenStream) {
        if (t.getChildCount() == 0) {
            String schild = TreeUtils.getNodeText(t, ruleNames, tokenStream);
            // System.out.println(schild);
            return Utils.escapeWhitespace(schild, false);
        }
        StringBuilder sb = new StringBuilder();
        sb.append(lead(level));
        level++;
        String s = Utils.escapeWhitespace(TreeUtils.getNodeText(t, ruleNames, tokenStream), false);
        sb.append(s + ' ');
        for (int i = 0; i < t.getChildCount(); i++) {
            String schild = process(t.getChild(i), ruleNames, tokenStream);
            sb.append(schild);
        }
        level--;
        sb.append(lead(level));
        return sb.toString();
    }

    private static String lead(int level) {
        StringBuilder sb = new StringBuilder();
        if (level > 0) {
            sb.append(Eol);
            for (int cnt = 0; cnt < level; cnt++) {
                sb.append(Indents);
            }
        }
        return sb.toString();
    }

    public static String getNodeText(Tree t, List<String> ruleNames, CommonTokenStream tokenStream) {
        if (ruleNames != null) {
            String s;
            if (t instanceof RuleContext) {
                int ruleIndex = ((RuleContext) t).getRuleContext().getRuleIndex();
                s = ruleNames.get(ruleIndex);
                int altNumber = ((RuleContext) t).getAltNumber();
                if (altNumber != 0) {
                    return s + ":" + altNumber;
                }
                return s;
                //return "";
            }

            if (t instanceof ErrorNode) {
                return t.toString();
            }

            if (t instanceof TerminalNode) {
                Token symbol = ((TerminalNode) t).getSymbol();
                if (symbol != null) {
                    s = symbol.getText();
                    // if (s == null) s = "";
                    List<Token> hiddenTokens = tokenStream.getHiddenTokensToRight(symbol.getTokenIndex());
                    if (hiddenTokens != null && 1==0) {
                        for (Token hiddenToken : hiddenTokens) {
                            if (hiddenToken.getText() != null) {
                                s += hiddenToken.getText();
                            }
                        }
                    }
                    //System.out.println(s);
                    return s;
                }
            }
        }

        Object payload = t.getPayload();
        return payload instanceof Token ? ((Token) payload).getText() : t.getPayload().toString();
    }
}